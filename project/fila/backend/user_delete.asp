<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'權限檢查
check_power = FindSession()
if check_power <> 99 then
	response.write "您無此權限!"
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
	response.write "無此資料!請重新選擇"
end if
%>