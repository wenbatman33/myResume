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
	'���X�Ҧ��W�Ǥ���ݩ�
	Dim pic(1)
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
   name = trim(objUpload.Form.Item("name"))
   birthday = trim(objUpload.Form.Item("birthday"))
   place = trim(objUpload.Form.Item("place"))
   height = trim(objUpload.Form.Item("height"))
   if (height = "") then
      height = 0
   end if
   weight = trim(objUpload.Form.Item("weight"))
   if (weight = "") then
      weight = 0
   end if   
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
   
   SQL = "Insert into Sponsor (Name,Birth,BirthPlace,Height,Weight,Education,Motto,Grade,Note,BigPic,SmallPic) values ('" & name & "','" & birthday & "','" & place & "'," & height & "," & weight & ",'" & education & "','" & motto & "','" & grade & "','" & note & "','" & pic(0) & "','" & pic(1) & "' )"
   'response.write SQL
  
   oConn.open connection_str
   oConn.Execute(SQL)	
   strSQL = "SELECT @@IDENTITY AS NewID"
	 Set Rs = oConn.Execute(strSQL)
	 NewID = Rs.Fields("NewID").value	
   oConn.Close
   Call recorduse(1,"Sponsor_"& NewID)
end if

%>
<script>
  alert("OK");
	location.href="content_sponsor_view.asp";
</script>

