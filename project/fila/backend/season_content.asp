<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
FindSession()
t_seq = request("t_seq")
%>
<script language="JavaScript" type="text/JavaScript">
function confirmdelete(tmpseq)
{
	if(confirm("�T�w�n�R����?"))
		location.href = "season_delete.asp?p_seq=" + tmpseq + "&t_seq=<%=t_seq%>";
	else
		return false;
}
</script>
<a href="season_new.asp?t_seq=<%=t_seq%>" class="fonttype">+ �s�W�@��</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="season_set.asp?t_seq=<%=t_seq%>" class="fonttype">�ק鷺��P�]�w</a>
<br><br>
<table border="1" id="table1" class="tabletype">
	<tr>
		<td>�Ϥ�</td>		
		<td>����</td>
		<td>��ܧ_</td>
		<td>�ק�</td>
		<td>�R��</td>
	</tr>
<%
oConn.Open connection_str
SQL = "select p_seq,p_image_s,isshow from SeasonProduct where t_seq="& t_seq
Set SelectP = oConn.Execute(SQL)
counts = 0
Do Until SelectP.eof	
	response.write "<tr><td><img src="&SelectP("p_image_s")&" border=0>"
	response.write "</td><td><p class=fonttype>"
	SQL = "select p_name,p_price from SeasonDetail where p_seq="& SelectP("p_seq")
	Set SelectD = oConn.Execute(SQL)	
	Do Until SelectD.eof	
		response.write SelectD("p_name") &"NT$"&SelectD("p_price")&"<br>"
		SelectD.MoveNext
	Loop
	response.write "</p></td><td><p align=""center"">"& SelectP("isshow") & "</p></td><td>"	
	response.write "<input type=button name=button"&counts&" onclick=location.href='season_update.asp?p_seq="&SelectP("p_seq")&"&t_seq="&t_seq&"' value=�ק� class=fonttype></td><td>"
	response.write "<input type=button name=button"&counts&" onclick='return confirmdelete("&SelectP("p_seq")&")' value=�R�� class=fonttype></td></tr>"
	counts = counts + 1
	SelectP.MoveNext
Loop
oConn.Close
%>	
</table>


</body>

</html>