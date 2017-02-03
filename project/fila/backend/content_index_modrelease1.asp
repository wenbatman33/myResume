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

   Topic = trim(objUpload.Form.Item("topic"))
   Method = trim(objUpload.Form.Item("Method"))
   HID = trim(objUpload.Form.Item("HID"))
   
   if (objUpload.Form.Item("modPic") = 1) then
      SQL = "UPDATE Homepage Set Content = '" & Topic & "',Pic='" & pic & "',Method='" & Method & "' Where HID=" & HID
   else
      SQL = "UPDATE Homepage Set Content = '" & Topic & "',Method='" & Method & "' Where HID=" & HID
   end if
   oConn.open connection_str
   oConn.Execute(SQL)	
   oConn.Close
   Call recorduse(2,"Homepage_"& HID)
end if

%>
<script>
  alert("修改完成");
	location.href="content_index_mod.asp";
</script>