<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
FindSession()
level2 = request("level2")
'��u����
if (level2 = "1" or level2 = "7" or level2 = "13" or level2 = "19") then
	response.redirect "season_content.asp?t_seq="&level2
	response.end
end if
if (level2 = "888" or level2 = "999") then
	t_seq = request("level3")
else
	t_seq = level2
end if
'response.write level3
%>
<script language="JavaScript" type="text/JavaScript">
function confirmdelete(tmpseq)
{
	if(confirm("�T�w�n�R����?"))
		location.href = "product_delete.asp?p_seq=" + tmpseq + "&t_seq=<%=t_seq%>";
	else
		return false;
}
</script>
<a href="product_new.asp?t_seq=<%=t_seq%>" class="fonttype">+ �s�W�@��</a>
<br><br>
<table border="1" id="table1" class="tabletype">
	<tr>
		<td>�Ϥ�</td>
		<td>�W��</td>
		<td>����</td>
		<td>�ק�</td>
		<td>�R��</td>
	</tr>
<%
oConn.Open connection_str
SQL = "select p_seq,p_name,p_type,p_image_s from Product where t_seq="& t_seq
Set SelectP = oConn.Execute(SQL)
counts = 0
Do Until SelectP.eof
	response.write "<tr><td><img src="&SelectP("p_image_s")&" border=0>"
	response.write "</td><td><p class=fonttype>"&SelectP("p_name")&"</p></td><td>"
	response.write "<p class=fonttype>"&SelectP("p_type")&"</p></td><td>"
	response.write "<input type=button name=button"&counts&" onclick=location.href='product_update.asp?p_seq="&SelectP("p_seq")&"&t_seq="&t_seq&"' value=�ק� class=fonttype></td><td>"
	response.write "<input type=button name=button"&counts&" onclick='return confirmdelete("&SelectP("p_seq")&")' value=�R�� class=fonttype></td></tr>"
	counts = counts + 1
	SelectP.MoveNext
Loop
oConn.Close
%>	
</table>


</body>

</html>