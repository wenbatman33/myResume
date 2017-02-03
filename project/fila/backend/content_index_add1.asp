<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<%
'權限檢查
FindSession()
%>
<%
    Response.Buffer = True
    Response.Expires = 0

'定義上傳目錄
const dirUpload = "upload\"

set objUpload = Server.CreateObject("AspSmartUpload.SmartUpload")

objUpload.MaxFileSize = 500000
objUpload.AllowedFilesList = "jpg,gif"


'文件上傳
objUpload.Upload

'保存文件在upload目錄，同時取得上傳的文件數
'intNo = objUpload.save(dirUpload)

'如果Err值=0，則說明上傳成功
if Err <> 0 then
%>
	<script>
		alert("檔案上傳失敗!請重新上傳");
		history.go(-1);
	</script>
<%	
	response.end
else
	pic = ""

	'取出所有上傳文件的屬性
	for each thefile in objUpload.files
		'如果上傳文件不為空
		if thefile.fileName <> Empty then	
		'====================================================================================
			'取得亂數與日期			
			randomize
			ranNum=int(90000*rnd)+10000
			Nowran=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum   				
			newfilename = Nowran & "." & thefile.FileExt
			newfilepath = dirUpload & newfilename
			'重新命名
			thefile.saveas   server.mappath(newfilepath) 
	  '====================================================================================
		   pic = newfilename
		end if
	Next
  
   Content = trim(objUpload.Form.Item("Content"))
   Link = ""
   if (objUpload.Form.Item("modLink1") = 1) then
      Link = trim(objUpload.Form.Item("Link1"))
   else
      Link = trim(objUpload.Form.Item("Link2"))
   end if
   Method = trim(objUpload.Form.Item("Method"))
   SQL = "Insert into Homepage (Content,Pic,Link,Method) values ('" & Content & "','" & pic & "','" & Link & "','" & Method & "')"
  
   oConn.open connection_str
   oConn.Execute(SQL)	
   strSQL = "SELECT @@IDENTITY AS NewID"
	 Set Rs = oConn.Execute(strSQL)
	 NewID = Rs.Fields("NewID").value	
   oConn.Close
   Call recorduse(1,"Homepage_"& NewID)
end if

%>
<script>
  alert("新增完成");
	location.href="content_index_mod.asp";
</script>