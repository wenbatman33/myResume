<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
FindSession()
t_seq = request("t_seq")
p_seq = request("p_seq")
if p_seq <> Empty then
	oConn.Open connection_str
	SQL = "select p_name,p_type,p_price,p_material,p_size,p_detail,p_image_b,p_image_s,p_notes from Product where p_seq="& p_seq
	Set SelectP = oConn.Execute(SQL)
	if not SelectP.eof then
		p_name = SelectP("p_name")
		p_type = SelectP("p_type")
		p_price = SelectP("p_price")
		p_material = SelectP("p_material")
		p_size = SelectP("p_size")
		p_detail = SelectP("p_detail")
		p_image_b = SelectP("p_image_b")
		p_image_s = SelectP("p_image_s")
		p_notes = SelectP("p_notes")
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
<script language="JavaScript" type="text/JavaScript">
function checkcol(chkstr)
{
	if (chkstr.p_name.value == "") {
		alert("�п�J�W�١I�I");
		chkstr.p_name.focus();
		return false;
	}	
//	if (chkstr.p_type.value == "") {
//		alert("�п�J�����I�I");
//		chkstr.p_type.focus();
//		return false;
//	}		
//	if (chkstr.p_material.value == "") {
//		alert("�п�J����I�I");
//		chkstr.p_material.focus();
//		return false;
//	}	
//	if (chkstr.p_size.value == "") {
//		alert("�п�J�ؽX�I�I");
//		chkstr.p_size.focus();
//		return false;
//	}	
//	if (chkstr.p_detail.value == "") {
//		alert("�п�J�����I�I");
//		chkstr.p_detail.focus();
//		return false;
//	}						
}
</script>
<form name="form1" action="product_add.asp" method="post" enctype="multipart/form-data" onsubmit="return checkcol(document.form1)">
<input type="hidden" name="t_seq" value="<%=t_seq%>">
<input type="hidden" name="p_seq" value="<%=p_seq%>">
<input type="hidden" name="excutetype" value="updates">
<table border="1" id="table1" class="tabletype">
	<font color="red" size="2">*�W�١B�����B����B����B�ؽX ��ĳ24�Ӥ���r</font>
	<tr>
		<td>�W�١G</td>
		<td><input type="text" name="p_name" size="40" value="<%=p_name%>"><font color="red" size="2">*����</font></td>
	</tr>
	<tr>
		<td>�����G</td>
		<td><input type="text" name="p_type" size="40" value="<%=p_type%>"><font color="red" size="2"></font></td>
	</tr>
	<tr>
		<td>����G</td>
		<td><input type="text" name="p_price" size="40" value="<%=p_price%>"><font color="red" size="2">*����Ʀr�ҥi</font></td>
	</tr>
	<tr>
		<td>����G</td>
		<td><input type="text" name="p_material" size="40" value="<%=p_material%>"><font color="red" size="2"></font></td>
	</tr>
	<tr>
		<td>�ؽX�G</td>
		<td><input type="text" name="p_size" size="40" value="<%=p_size%>"><font color="red" size="2"></font></td>
	</tr>
	<tr>
		<td>�����G</td>
		<td><textarea rows="11" name="p_detail" cols="72"><%=p_detail%></textarea><font color="red" size="2"></font><font color="red" size="2">*��ĳ324�Ӥ���r</font></td>
	</tr>
	<tr>
		<td>�j�ϡG</td>
		<td><img src="<%=p_image_b%>" border="0"><input type="file" name="p_image_b" size="32"><font color="red" size="2">�Ϥ��ؤo:400*400�A�ɦW���i������</font></td>
	</tr>
	<tr>
		<td>�p�ϡG</td>
		<td><img src="<%=p_image_s%>" border="0"><input type="file" name="p_image_s" size="32" value="<%=p_image_s%>"><font color="red" size="2">�Ϥ��ؤo:120*120�A�ɦW���i������</font></td>
	</tr>
	<tr>
		<td>�Ƶ��G</td>
		<td><input type="text" name="p_notes" size="40" value="<%=p_notes%>"></td>
	</tr>
	<tr>
		<td colspan="2">
		<p align="center"><input type="submit" name"submit" value="�T�w�e�X">�@</td>
	</tr>
</table>
</form>
</body>

</html>