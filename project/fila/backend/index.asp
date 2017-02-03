<!--#include file="common/DBConn.asp"-->
<%
Session.Timeout = 600
'SQL = "insert into UserData(userid,password,username,power) values('root','roottoor','root',99)"
loginstr = request("loginstr")
if loginstr = "Y" then
	username = trim(request("usrn"))
	password = trim(request("pwd"))
	'DB連線
	oConn.Open connection_str
	SQL = "select userid,password,power from UserData where userid='"& username &"' and password='"& password &"'"
	Set InsertUser = oConn.Execute(SQL)
	if not InsertUser.eof then
		check_userid = InsertUser("userid")
		check_password = InsertUser("password")
		power = InsertUser("power")
		if check_userid = username and check_password = password then
			session("s_username") = username
			session("s_power") = power
			response.redirect "backend.asp"			
		else
%>
			<script language="JavaScript" type="text/JavaScript">
				alert("帳號密碼錯誤！");
				location.href = "index.asp";
			</script>	
<%				
			response.end
		end if
	else
%>
		<script language="JavaScript" type="text/JavaScript">
			alert("帳號密碼錯誤！");
			location.href = "index.asp";
		</script>	
<%		
		response.end
	end if	
	oConn.Close
end if

%>
<script language="JavaScript" type="text/JavaScript">
function check(chkstr)
{
	if (chkstr.usrn.value == "") {
		alert("請輸入您的帳號！！");
		chkstr.usrn.focus();
		return false;
	}
	if (chkstr.pwd.value == "") {
		alert("請輸入您的密碼！！");
		chkstr.pwd.focus();
		return false;
	}
}
</script>
<form name="form1" method="post" action="index.asp" onsubmit="return check(document.form1)">
<input type="hidden" name="loginstr" value="Y">
<div align="center">
<br><br><br>
<table border="0" id="table1" cellspacing="0" cellpadding="0" width="518" style="border-width: 0" height="126">
	<!-- MSTableType="layout" -->
	<tr>
		<td align="center" height="61">
		<font face="Verdana" size="7" color="#6600CC">F I L A　Backend</font><p>　</td>
		</tr>
	<tr>
		<td align="center" height="21">
		<p class="fonttype">帳號：<input type="text" name="usrn" size="20"></td>
		</tr>
	<tr>
		<td align="center" height="21">
		<p class="fonttype">密碼：<input type="password" name="pwd" size="20"></td>
		</tr>
	<tr>
		<td align="center" height="23" width="516">
		<br><input type="submit" value="登　入" name="B3">
		</td>
	</tr>
</table>

</div>
</body>

</html>