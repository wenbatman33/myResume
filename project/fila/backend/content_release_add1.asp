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
	Dim pic(2)
	nCount = 0

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
		    pic(nCount) = newfilename
		 else
		    pic(nCount) = ""
	   end if
	   nCount = nCount + 1
  Next
  
   topic = trim(objUpload.Form.Item("topic"))
   if topic <> Empty then
		  topic = Replace(topic,chr(10),"")
		  topic = Replace(topic,chr(13),"<br/>")
	 end if
   content = trim(objUpload.Form.Item("content"))
   if content <> Empty then
		  content = Replace(content,chr(10),"")
		  content = Replace(content,chr(13),"<br/>")
	 end if   
   show = trim(objUpload.Form.Item("show"))
   
   if (show = "") then
      show = 0
   else
      show = 1
   end if
   
   SQL = "Insert into Release (Topic,Content,Pic1,Pic2,Pic3,Show) values ('" & topic & "','" & content & "','" & pic(0) & "','" & pic(1) & "','" & pic(2) & "'," & show & ")"
  
   oConn.open connection_str
   oConn.Execute(SQL)	
   strSQL = "SELECT @@IDENTITY AS NewID"
	 Set Rs = oConn.Execute(strSQL)
	 NewID = Rs.Fields("NewID").value	
   oConn.Close
   Call recorduse(1,"Release_"& NewID)
end if

%>
<script>
  alert("新增完成");
	location.href="content_release_view.asp";
</script>