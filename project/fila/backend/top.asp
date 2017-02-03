<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'權限檢查
FindSession()
%>
<div align="center">
<table width="100%" id="table1" class="tabletype">
	<tr>
		<td align="center" class="tabletype">	<a href="user_content.asp" target="main"><font color="#663300">	權限管理</a></td>
		<td align="center" class="tabletype">	<a href="product_tree.asp" target="main"><font color="#663300">	產品管理　</a></td>
		<td align="center" class="tabletype">	<a href="content.asp" target="main"><font color="#663300">	內容管理</a>　</td>
	</tr>
</table>
</div>
</body>

</html>