<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
check_power = FindSession()
if check_power <> 99 then
	response.write "�z�L���v��!"
	response.end
end if
userseq = trim(request("userseq"))
if userseq <> Empty then
	oConn.Open connection_str
	SQL = "delete from UserData where userseq="& userseq
	'response.write p_seq
	Set DeleteP = oConn.Execute(SQL)
	oConn.Close
	response.redirect "user_content.asp"
	response.end
else
	response.write "�L�����!�Э��s���"
end if
%>