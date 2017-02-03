<%
Function FindSession()
	if session("s_username") <> "" and session("s_power") <> "" then	
		FindSession = session("s_power")
	else
%>
	<script language="JavaScript" type="text/JavaScript">
		alert("請先登入"); 
		top.location.href = "index.asp";
	</script>	
<%		
		response.end
	end if
End Function
'紀錄新增修改刪除
Sub recorduse(usetype,usetable)
	'usetype
	'1:新增	2.修改 3.刪除
	'usetable
	'table名稱_編號
	oConn.Open connection_str
	SQL = "insert into RecordUse(username,usetype,usetable) values('"& session("s_username") &"',"& usetype &",'"& usetable &"')"
	oConn.Execute(SQL)
	oConn.Close
End Sub
%>