<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
FindSession()
t_seq = request("t_seq")
'response.write level3
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
	if (chkstr.p_image_b.value == "") {
		alert("�ФW�Ǥj�ϡI�I");
		chkstr.p_image_b.focus();
		return false;
	}
	if (chkstr.p_image_s.value == "") {
		alert("�ФW�Ǥp�ϡI�I");
		chkstr.p_image_s.focus();
		return false;
	}							
}
</script>
<form name="form1" action="product_add.asp" method="post" enctype="multipart/form-data" onsubmit="return checkcol(document.form1)">
<input type="hidden" name="t_seq" value="<%=t_seq%>">
<input type="hidden" name="excutetype" value="adds">
	<font color="red" size="2">*�W�١B�����B����B����B�ؽX ��ĳ24�Ӥ���r</font>
<table border="1" id="table1" class="tabletype">
	<tr>
		<td>�W�١G</td>
		<td><input type="text" name="p_name" size="40"><font color="red" size="2">*����</font></td>
	</tr>
	<tr>
		<td>�����G</td>
		<td><input type="text" name="p_type" size="40"><font color="red" size="2"></font></td>
	</tr>
	<tr>
		<td>����G</td>
		<td><input type="text" name="p_price" size="40"><font color="red" size="2">*����Ʀr�ҥi</font></td>
	</tr>
	<tr>
		<td>����G</td>
		<td><input type="text" name="p_material" size="40"><font color="red" size="2"></font></td>
	</tr>
	<tr>
		<td>�ؽX�G</td>
		<td><input type="text" name="p_size" size="40"><font color="red" size="2"></font></td>
	</tr>
	<tr>
		<td>�����G</td>
		<td><textarea rows="11" name="p_detail" cols="48"></textarea><font color="red" size="2"></font><font color="red" size="2">*��ĳ324�Ӥ���r</font></td>
	</tr>
	<tr>
		<td>�j�ϡG</td>
		<td><input type="file" name="p_image_b" size="32"><font color="red" size="2">�Ϥ��ؤo:400*400</font></td>
	</tr>
	<tr>
		<td>�p�ϡG</td>
		<td><input type="file" name="p_image_s" size="32"><font color="red" size="2">�Ϥ��ؤo:120*120</font></td>
	</tr>
	<tr>
		<td>�Ƶ��G</td>
		<td><input type="text" name="p_notes" size="40"></td>
	</tr>
	<tr>
		<td colspan="2">
		<p align="center"><input type="submit" name"submit" value="�T�w�e�X">�@</td>
	</tr>
</table>
</form>
</body>

</html>