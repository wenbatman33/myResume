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
	Dim pic(1)
	nCount = 0
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
end if
   nCount = 0
   if (objUpload.Form.Item("modPic1") = 1) then
      SQL = SQL & "BigPic='" & pic(nCount) & "',"
      nCount = nCount + 1
   end if
   if (objUpload.Form.Item("modPic2") = 1) then
      SQL = SQL & "SmallPic='" & pic(nCount) & "',"
      nCount = nCount + 1
   end if   
   SID = trim(objUpload.Form.Item("SID")) 
   name = trim(objUpload.Form.Item("name"))
   birthday = trim(objUpload.Form.Item("birthday"))
   place = trim(objUpload.Form.Item("place"))
   height = trim(objUpload.Form.Item("height"))
   weight = trim(objUpload.Form.Item("weight"))
   education = trim(objUpload.Form.Item("education"))    
   motto = trim(objUpload.Form.Item("motto"))
   if motto <> Empty then
		  motto = Replace(motto,chr(10),"")
		  motto = Replace(motto,chr(13),"<br/>")
	 end if     
   grade = trim(objUpload.Form.Item("grade"))
   if grade <> Empty then
		  grade = Replace(grade,chr(10),"")
		  grade = Replace(grade,chr(13),"<br/>")
	 end if    
   note = trim(objUpload.Form.Item("note")) 
   if note <> Empty then
		  note = Replace(note,chr(10),"")
		  note = Replace(note,chr(13),"<br/>")
	 end if            
   
   SQL = "Update Sponsor Set " & SQL & "Name='" & name & "',Birth='" & birthday & "',BirthPlace='" & place & "',Height=" & height & ",Weight=" & weight & ",Education='" & education & "',Motto='" & motto & "',Grade='" & grade & "',Note='" & note & "' where SID = " & SID
   'response.write SQL
  
   oConn.open connection_str
   oConn.Execute(SQL)	
   oConn.Close
   Call recorduse(2,"Sponsor_"& SID)
   
%>
<script>
  alert("OK");
	location.href="content_sponsor_view.asp";
</script>

