<%
'�w�q�W�ǥؿ�
const dirUpload = "upload\"

set objUpload = Server.CreateObject("AspSmartUpload.SmartUpload")

'����̤j�W��Size
objUpload.TotalMaxFileSize = 300000

'���W��
objUpload.Upload

'�O�s���bupload�ؿ��A�P�ɨ��o�W�Ǫ�����
'intNo = objUpload.save(dirUpload)

'�p�GErr��=0�A�h�����W�Ǧ��\
if Err <> 0 then
	response.write "�W�Ǥ����~�G <font color=ff0000>"&Err.Description&"</font>"
else
	'response.write "�@�W�ǤF <font color=ff0000><b>"&intNo&"</b></font> �Ӥ��I<p>"
	response.write "���O�O�G<br>"
	nPoint = 1

	'���X�Ҧ��W�Ǥ���ݩ�
	for each thefile in objUpload.files
		'�p�G�W�Ǥ�󤣬���
		if thefile.fileName <> Empty then	
	randomize   
  ranNum=int(90000*rnd)+10000   
  Nowran=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum   				
  newfilename = dirUpload&Nowran&"."&thefile.FileExt
  thefile.saveas   server.mappath(newfilename) 
  	
			response.write thefile.Name&" = <font color=0000ff><b>"		'����XFORM����input�W�A�pfile01�Bfile02��
			'��X���W�]���t���|�^
			response.write thefile.fileName&" </b></font>("		
			'��X�U�Ӥ��Size
			response.write FormatNumber(thefile.size,0)&"bytes)<br>"
			response.write "�����G<font color=silver>"&objUpload.Form.Item("disc"&nPoint)&"</font><p>"
			nPoint = nPoint + 1
		end if
	Next

	response.write "<p>�W���`�r�`�ơG"&"<font color=0000ff><b>"&objUpload.files.Totalbytes&"</b></font><br>"
	response.write "�i�W�Ǫ��̤j���ơG"&"<font color=0000ff><b>"&objUpload.files.count&"</b></font><br>"
	response.write "<hr>"
	
	
end if
%>
