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
	pic = ""

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
  alert("�s�W����");
	location.href="content_index_mod.asp";
</script>