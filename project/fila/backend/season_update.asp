<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
FindSession()
t_seq = request("t_seq")
p_seq = request("p_seq")
if p_seq <> Empty then
	oConn.Open connection_str
	SQL = "select p_image_b,p_image_s,isshow from SeasonProduct where p_seq="& p_seq
	Set SelectP = oConn.Execute(SQL)
	if not SelectP.eof then
		p_image_b = SelectP("p_image_b")
		p_image_s = SelectP("p_image_s")		
		isshow = SelectP("isshow")		
		oConn.Close
	else
		response.write "�L�����!�Э��s���"
		response.end
	end if
else
	response.write "�L�����!�Э��s���"
	response.end
end if
%>

<form name="form1" action="season_add.asp" method="post" enctype="multipart/form-data" onsubmit="return checkcol(document.form1)">
<input type="hidden" name="t_seq" value="<%=t_seq%>">
<input type="hidden" name="p_seq" value="<%=p_seq%>">
<input type="hidden" name="excutetype" value="updates">
	<font color="red" size="2">*�ӫ~�W��+���� ��ĳ14�Ӥ���r</font>
<table border="1" id="table1" class="tabletype">
<%
oConn.Open connection_str
SQL = "select p_name,p_price,p_location from SeasonDetail where p_seq="& p_seq
Set SelectD = oConn.Execute(SQL)
redim p_name(9)
redim p_price(9)
Do Until SelectD.eof
	p_location = SelectD("p_location")	
	p_name(p_location) = SelectD("p_name")
	p_price(p_location) = SelectD("p_price")	
	SelectD.MoveNext
Loop	
%>		
	<tr>
		<td>
		<p align="center">���C</td>
		<td>
		<p align="center">�k�C</td>
	</tr>
	<tr>
		<td>�ӫ~�W�١G<input type="text" name="p_1" size="18" value="<%=p_name(1)%>"> ����NT�G<input type="text" name="m_1" value="<%=p_price(1)%>" size="10"></td>
		<td>�ӫ~�W�١G<input type="text" name="p_2" size="18" value="<%=p_name(2)%>"> ����NT�G<input type="text" name="m_2" value="<%=p_price(2)%>" size="10"></td>
	</tr>
	<tr>
		<td>�ӫ~�W�١G<input type="text" name="p_3" size="18" value="<%=p_name(3)%>"> ����NT�G<input type="text" name="m_3" value="<%=p_price(3)%>" size="10"></td>
		<td>�ӫ~�W�١G<input type="text" name="p_4" size="18" value="<%=p_name(4)%>"> ����NT�G<input type="text" name="m_4" value="<%=p_price(4)%>" size="10"></td>
	</tr>
	<tr>
		<td>�ӫ~�W�١G<input type="text" name="p_5" size="18" value="<%=p_name(5)%>"> ����NT�G<input type="text" name="m_5" value="<%=p_price(5)%>" size="10"></td>
		<td>�ӫ~�W�١G<input type="text" name="p_6" size="18" value="<%=p_name(6)%>"> ����NT�G<input type="text" name="m_6" value="<%=p_price(6)%>" size="10"></td>
	</tr>
	<tr>
		<td>�ӫ~�W�١G<input type="text" name="p_7" size="18" value="<%=p_name(7)%>"> ����NT�G<input type="text" name="m_7" value="<%=p_price(5)%>" size="10"></td>
		<td>�ӫ~�W�١G<input type="text" name="p_8" size="18" value="<%=p_name(8)%>"> ����NT�G<input type="text" name="m_8" value="<%=p_price(6)%>" size="10"></td>
	</tr>		
	<tr>
		<td align="center">�j�ϡG</td>
		<td><img src="<%=p_image_b%>" border="0"><br><input type="file" name="p_image_b" size="32"><font color="red" size="2">�Ϥ��ؤo:400*300</font></td>
	</tr>
	<tr>
		<td align="center">�p�ϡG</td>
		<td><img src="<%=p_image_s%>" border="0"><br><input type="file" name="p_image_s" size="32" value="<%=p_image_s%>"><font color="red" size="2">�Ϥ��ؤo:76*76</font></td>
	</tr>
	<tr>
		<td colspan="2">
		<p align="center">���<input type="radio" value="Y" name="isshow" <% if isshow = "Y" then response.write "checked" end if %>>&nbsp;&nbsp;&nbsp;&nbsp;
		����� <input type="radio" value="N" name="isshow" <% if isshow = "N" then response.write "checked" end if %>></td>
	</tr>	
	<tr>
		<td colspan="2"><input type="hidden" name="prenum" value="<%=countnum-1%>">
		<p align="center"><input type="submit" name"submit" value="�T�w�e�X">�@</td>
	</tr>
</table>
</form>
</body>

</html>