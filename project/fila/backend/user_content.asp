<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
check_power = FindSession()
if check_power <> 99 then
	response.write "�z�L���v��!"
	response.end
end if
%>
<script language="JavaScript" type="text/JavaScript">
function confirmdelete(tmpseq)
{
	if(confirm("�T�w�n�R����?"))
		location.href = "user_delete.asp?userseq=" + tmpseq;
	else
		return false;
}
</script>
<a href="user_add.asp" class="fonttype">+ �s�W�@��</a>
<br><br>
<table border="1" id="table1" class="tabletype">
	<tr>
		<td>�n�J�b��</td>
		<td>�n�J�K�X</td>
		<td>�ϥΤH</td>
		<td>�v��</td>
		<td>�ק�</td>
		<td>�R��</td>
	</tr>
<%
oConn.Open connection_str
SQL = "select userseq,userid,password,username,power from UserData"
Set SelectU = oConn.Execute(SQL)
counts = 0
Do Until SelectU.eof	
	power = SelectU("power")
	if power = 99 then
		powerstr = "�޲z"
	else
		powerstr = "�@��"
	end if
	response.write "<tr><td class=fonttype>"&SelectU("userid")&"</td>"
	response.write "<td class=fonttype>"&SelectU("password")&"</td>"
	response.write "<td class=fonttype>"&SelectU("username")&"</td>"
	response.write "<td class=fonttype>"&powerstr&"</td>"
	response.write "<td><input type=""button"" name=button"&counts&" value=""�ק�"" onclick=location.href='user_add.asp?userseq="&SelectU("userseq")&"' class=fonttype></td>"
	response.write "<td><input type=""button"" name=button"&counts&" value=""�R��"" onclick='return confirmdelete("&SelectU("userseq")&")' class=fonttype></td>"
	response.write "</tr>"
	SelectU.MoveNext
	counts = counts + 1
Loop
oConn.Close
%>	
</table>
</body>

</html>