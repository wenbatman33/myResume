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

  '���X�Ҧ��W�Ǥ���ݩ�
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
  alert("�s�W����");
	location.href="content_release_view.asp";
</script>