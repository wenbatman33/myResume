<%
Function FindSession()
	if session("s_username") <> "" and session("s_power") <> "" then	
		FindSession = session("s_power")
	else
%>
	<script language="JavaScript" type="text/JavaScript">
		alert("�Х��n�J"); 
		top.location.href = "index.asp";
	</script>	
<%		
		response.end
	end if
End Function
'�����s�W�ק�R��
Sub recorduse(usetype,usetable)
	'usetype
	'1:�s�W	2.�ק� 3.�R��
	'usetable
	'table�W��_�s��
	oConn.Open connection_str
	SQL = "insert into RecordUse(username,usetype,usetable) values('"& session("s_username") &"',"& usetype &",'"& usetable &"')"
	oConn.Execute(SQL)
	oConn.Close
End Sub
%>