<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
FindSession()
%>
<%
    Response.Buffer = True
    Response.Expires = 0

'�w�q�W�ǥؿ�
const dirUpload = "upload\"

set objUpload = Server.CreateObject("AspSmartUpload.SmartUpload")

objUpload.MaxFileSize = 500000
objUpload.AllowedFilesList = "jpg,gif"

'���W��
objUpload.Upload

'�O�s���bupload�ؿ��A�P�ɨ��o�W�Ǫ�����
'intNo = objUpload.save(dirUpload)
'�p�GErr��=0�A�h�����W�Ǧ��\
if Err <> 0 then
%>
	<script>
		alert("�ɮפW�ǥ���!�Э��s�W��");
		history.go(-1);
	</script>
<%	
	response.end
else
	Dim pic(2)
	nCount = 0
	for each thefile in objUpload.files
		'�p�G�W�Ǥ�󤣬���
	   if thefile.fileName <> Empty then	
			  '====================================================================================
					'���o�üƻP���			
					randomize
					ranNum=int(90000*rnd)+10000
					Nowran=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum   				
					newfilename = Nowran & "." & thefile.FileExt
					newfilepath = dirUpload & newfilename
					'���s�R�W
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
   if (objUpload.Form.Item("modTopic") = 1) then
      topic = trim(objUpload.Form.Item("topic"))
      if topic <> Empty then
		     topic = Replace(topic,chr(10),"")
		     topic = Replace(topic,chr(13),"<br/>")
	    end if
      SQL = SQL & "Topic='" & topic & "',"
   end if
   if (objUpload.Form.Item("modContent") = 1) then
      content = trim(objUpload.Form.Item("content"))
      if content <> Empty then
		     content = Replace(content,chr(10),"")
		     content = Replace(content,chr(13),"<br/>")
	    end if     
      SQL = SQL & "Content='" & content & "',"
   end if
   if (objUpload.Form.Item("modPic1") = 1) then
      SQL = SQL & "Pic1='" & getFilename(pic(nCount)) & "',"
      nCount = nCount + 1
   end if
   if (objUpload.Form.Item("modPic2") = 1) then
      SQL = SQL & "Pic2='" & getFilename(pic(nCount)) & "',"
      nCount = nCount + 1
   end if
   if (objUpload.Form.Item("modPic3") = 1) then
      SQL = SQL & "Pic3='" & getFilename(pic(nCount)) & "',"
      nCount = nCount + 1
   end if
   if (objUpload.Form.Item("modShow") = 1) then
      if (objUpload.Form.Item("show") = "") then
          show = 0
      else
          show = 1
      end if
      SQL = SQL & "Show=" & show & ","
   end if            
   
   if (SQL <> "") then
      RID = objUpload.Form.Item("RID")
      SQL = "Update Release SET " & SQL
      SQL = Left(SQL,Len(SQL)-1) & " Where RID=" & RID
      response.write SQL
      oConn.open connection_str
      oConn.Execute(SQL)	
      oConn.Close
      Call recorduse(2,"Release_"& RID)
   end if
      
Function getFilename(filepath)
   n = InStrRev(filepath,"\")
   getFilename = Right(filepath,len(filepath)-n)
end Function
%>
<script>
  alert("OK");
	location.href="content_release_view.asp";
</script>
