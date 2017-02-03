<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'權限檢查
check_power = FindSession()
if check_power <> 99 then
	response.write "您無此權限!"
	response.end
end if
adds = trim(request("adds"))
userseq = trim(request("userseq"))
'新增
if adds = "Y" then		
	oConn.Open connection_str
	userid = trim(request("userid"))
	pwd = trim(request("pwd"))
	username = trim(request("username"))
	power = trim(request("power"))
	'修改
	if userseq <> Empty then 
		SQL = "update UserData set userid='"& userid &"',password='"& pwd &"',username='"& username &"',power='"& power &"' where userseq="& userseq
	else
		SQL = "insert into UserData(userid,password,username,power) values('"& userid &"','"& pwd &"','"& username &"','"& power &"')"
	end if
	Set InsertU = oConn.Execute(SQL)
	oConn.Close
	response.redirect "user_content.asp"
	response.end
end if
'查詢
if userseq <> Empty then
	oConn.Open connection_str
	SQL = "select userid,password,username,power from UserData where userseq="&userseq
	Set SelectU = oConn.Execute(SQL)
	if not SelectU.eof then
		userid = SelectU("userid")
		password = SelectU("password")
		username = SelectU("username")
		power = SelectU("power")
		oConn.Close
	else
		response.write "無此資料!"
		response.end
	end if
end if
		
%>
<script language="JavaScript" type="text/JavaScript">
function checkcol(chkstr)
{	
	if (chkstr.userid.value == "") {
		alert("請輸入登入帳號！！");
		chkstr.userid.focus();
		return false;
	}	
	if (chkstr.pwd.value == "") {
		alert("請輸入登入密碼！！");
		chkstr.pwd.focus();
		return false;
	}		
	if (chkstr.username.value == "") {
		alert("請輸入使用人！！");
		chkstr.username.focus();
		return false;
	}	
	if (chkstr.power.selectedIndex == 0){
		alert("請選擇權限！！");
		chkstr.power.focus();
		return false;
	}		
}
</script>
<form name="form1" action="user_add.asp" method="post" onsubmit="return checkcol(document.form1)">
<input type="hidden" name="adds" value="Y">
<input type="hidden" name="userseq" value="<%=userseq%>">
<table border="1" id="table1" class="tabletype">
	<tr>
		<td>登入帳號：</td>
		<td><input type="text" name="userid" size="40" value="<%=userid%>"></td>
	</tr>
	<tr>
		<td>登入密碼：</td>
		<td><input type="text" name="pwd" size="40" value="<%=password%>"></td>
	</tr>
	<tr>
		<td>使用人：</td>
		<td><input type="text" name="username" size="40" value="<%=username%>"></td>
	</tr>
	<tr>
		<td>權限：</td>
		<td><select size="1" name="power">
		<option value="0">請選擇</option>
		<option value="1" <%if power = 1 then%>selected<%end if%>>一般</option>
		<option value="99" <%if power = 99 then%>selected<%end if%>>管理</option>
		</select></td>
	</tr>
	<tr>
		<td colspan="2">
		<p align="center"><input type="submit" name"submit" value="確定送出">　</td>
	</tr>
</table>

</body>

</html>
