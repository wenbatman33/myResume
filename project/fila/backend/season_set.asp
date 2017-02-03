<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'權限檢查
FindSession()
t_seq = request("t_seq")
updates = request("updates")
oConn.Open connection_str
'修改
if updates = "Y" then
	detail = request("detail")
	appear = request("appear")
	SQL = "update ProductTree set title_3='"& detail &"',levels="& appear &" where t_seq="& t_seq
	'response.write SQL
	Set InsertT = oConn.Execute(SQL)	
	response.write "修改完成!"
	response.end
end if
SQL = "select title_3,levels from ProductTree where t_seq="& t_seq
Set SelectT = oConn.Execute(SQL)
if not SelectT.eof then
	detail = SelectT("title_3")
	appear = SelectT("levels")
	oConn.Close
else
	response.write "無此類別!請重新選擇"
	response.end
end if
%>
<script language="JavaScript" type="text/JavaScript">
function checkcol(chkstr)
{
	if (chkstr.detail.value == "") {
		alert("請輸入說明！！");
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
		<td>內文：</td>
		<td><textarea rows="14" name="detail" cols="62"><%=detail%></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
		<p align="center"><input type="radio" value="9" name="appear" <%if(appear = 9) then%>checked<%end if%> >顯示&nbsp;&nbsp; 
		<input type="radio" value="10" name="appear" <%if(appear = 10) then%>checked<%end if%>>不顯示</td>
	</tr>
	<tr>
		<td colspan="2">
		<p align="center"><input type="submit" name"submit" value="確定送出">　</td>
	</tr>
</table>
</form>
</body>

</html>