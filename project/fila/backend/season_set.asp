<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
FindSession()
t_seq = request("t_seq")
updates = request("updates")
oConn.Open connection_str
'�ק�
if updates = "Y" then
	detail = request("detail")
	appear = request("appear")
	SQL = "update ProductTree set title_3='"& detail &"',levels="& appear &" where t_seq="& t_seq
	'response.write SQL
	Set InsertT = oConn.Execute(SQL)	
	response.write "�ק粒��!"
	response.end
end if
SQL = "select title_3,levels from ProductTree where t_seq="& t_seq
Set SelectT = oConn.Execute(SQL)
if not SelectT.eof then
	detail = SelectT("title_3")
	appear = SelectT("levels")
	oConn.Close
else
	response.write "�L�����O!�Э��s���"
	response.end
end if
%>
<script language="JavaScript" type="text/JavaScript">
function checkcol(chkstr)
{
	if (chkstr.detail.value == "") {
		alert("�п�J�����I�I");
		chkstr.detail.focus();
		return false;
	}	
}
</script>
<form name="form1" action="season_set.asp" method="post" onsubmit="return checkcol(document.form1)">
<input type="hidden" name="updates" value="Y">
<input type="hidden" name="t_seq" value="<%=t_seq%>">
<table border="1" id="table1" class="tabletype">
	<tr>
		<td>����G</td>
		<td><textarea rows="14" name="detail" cols="62"><%=detail%></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
		<p align="center"><input type="radio" value="9" name="appear" <%if(appear = 9) then%>checked<%end if%> >���&nbsp;&nbsp; 
		<input type="radio" value="10" name="appear" <%if(appear = 10) then%>checked<%end if%>>�����</td>
	</tr>
	<tr>
		<td colspan="2">
		<p align="center"><input type="submit" name"submit" value="�T�w�e�X">�@</td>
	</tr>
</table>
</form>
</body>

</html>