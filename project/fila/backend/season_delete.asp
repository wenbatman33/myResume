<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
FindSession()
p_seq = trim(request("p_seq"))
t_seq = trim(request("t_seq"))
if p_seq <> Empty then
	oConn.Open connection_str
	SQL = "delete from SeasonProduct where p_seq="& p_seq
	'response.write p_seq
	Set DeleteP = oConn.Execute(SQL)
	'�R���ӫ~����
	SQL = "delete from SeasonDetail where p_seq="& p_seq
	oConn.Execute(SQL)
	oConn.Close
	'�ϥΰO��
	Call recorduse(3,"SeasonProduct_"& p_seq)
	Call recorduse(3,"SeasonDetail"& p_seq)
	response.redirect "season_content.asp?t_seq="&t_seq
	response.end
else
	response.write "�L�����!�Э��s���"
end if
%>