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
  alert("�ק粒��");
	location.href="content_index_mod.asp";
</script>