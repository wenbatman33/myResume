<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'權限檢查
check_power = FindSession()
if check_power <> 99 then
	response.write "您無此權限!"
	response.end
end if
%>
<script language="JavaScript" type="text/JavaScript">
function confirmdelete(tmpseq)
{
	if(confirm("確定要刪除嗎?"))
		location.href = "user_delete.asp?userseq=" + tmpseq;
	else
		return false;
}
</script>
<a href="user_add.asp" class="fonttype">+ 新增一筆</a>
<br><br>
<table border="1" id="table1" class="tabletype">
	<tr>
		<td>登入帳號</td>
		<td>登入密碼</td>
		<td>使用人</td>
		<td>權限</td>
		<td>修改</td>
		<td>刪除</td>
	</tr>
<%
oConn.Open connection_str
SQL = "select userseq,userid,password,username,power from UserData"
Set SelectU = oConn.Execute(SQL)
counts = 0
Do Until SelectU.eof	
	power = SelectU("power")
	if power = 99 then
		powerstr = "管理"
	else
		powerstr = "一般"
	end if
	response.write "<tr><td class=fonttype>"&SelectU("userid")&"</td>"
	response.write "<td class=fonttype>"&SelectU("password")&"</td>"
	response.write "<td class=fonttype>"&SelectU("username")&"</td>"
	response.write "<td class=fonttype>"&powerstr&"</td>"
	response.write "<td><input type=""button"" name=button"&counts&" value=""修改"" onclick=location.href='user_add.asp?userseq="&SelectU("userseq")&"' class=fonttype></td>"
	response.write "<td><input type=""button"" name=button"&counts&" value=""刪除"" onclick='return confirmdelete("&SelectU("userseq")&")' class=fonttype></td>"
	response.write "</tr>"
	SelectU.MoveNext
	counts = counts + 1
Loop
oConn.Close
%>	
</table>
</body>

</html>