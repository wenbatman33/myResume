<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
FindSession()
p_seq = trim(request("p_seq"))
t_seq = trim(request("t_seq"))
if p_seq <> Empty then
	oConn.Open connection_str
	SQL = "delete from Product where p_seq="& p_seq
	'response.write p_seq
	Set DeleteP = oConn.Execute(SQL)
	oConn.Close
	'�ϥΰO��
	Call recorduse(3,"Product_"& p_seq)
	response.redirect "product_content.asp?level2="&t_seq
	response.end
else
	response.write "�L�����!�Э��s���"
end if
%>