<!--#include file="common/DBConn.asp"-->
<%
a = request("a")
if a = 1 then
	p_1 = a = request("p_1")
	response.write p_1(0)
end if
%>
<form name="form1" action="test.asp?a=1" method="post">
<input type="text" name="p_1" size="16"><br>
<input type="text" name="p_1" size="16"><br>
<input type="submit" name"submit" value="½T©w°e¥X">
</form>
</body>
</html>