<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'權限檢查
FindSession()
t_seq = request("t_seq")
'response.write level3
%>
<script language="JavaScript" type="text/JavaScript">
function checkcol(chkstr)
{	
	if (chkstr.p_name.value == "") {
		alert("請輸入名稱！！");
		chkstr.p_name.focus();
		return false;
	}	
//	if (chkstr.p_type.value == "") {
//		alert("請輸入型號！！");
//		chkstr.p_type.focus();
//		return false;
//	}		
//	if (chkstr.p_material.value == "") {
//		alert("請輸入材質！！");
//		chkstr.p_material.focus();
//		return false;
//	}	
//	if (chkstr.p_size.value == "") {
//		alert("請輸入尺碼！！");
//		chkstr.p_size.focus();
//		return false;
//	}	
//	if (chkstr.p_detail.value == "") {
//		alert("請輸入說明！！");
//		chkstr.p_detail.focus();
//		return false;
//	}		
	if (chkstr.p_image_b.value == "") {
		alert("請上傳大圖！！");
		chkstr.p_image_b.focus();
		return false;
	}
	if (chkstr.p_image_s.value == "") {
		alert("請上傳小圖！！");
		chkstr.p_image_s.focus();
		return false;
	}							
}
</script>
<form name="form1" action="product_add.asp" method="post" enctype="multipart/form-data" onsubmit="return checkcol(document.form1)">
<input type="hidden" name="t_seq" value="<%=t_seq%>">
<input type="hidden" name="excutetype" value="adds">
	<font color="red" size="2">*名稱、型號、價格、材質、尺碼 建議24個中文字</font>
<table border="1" id="table1" class="tabletype">
	<tr>
		<td>名稱：</td>
		<td><input type="text" name="p_name" size="40"><font color="red" size="2">*必填</font></td>
	</tr>
	<tr>
		<td>型號：</td>
		<td><input type="text" name="p_type" size="40"><font color="red" size="2"></font></td>
	</tr>
	<tr>
		<td>價格：</td>
		<td><input type="text" name="p_price" size="40"><font color="red" size="2">*中文數字皆可</font></td>
	</tr>
	<tr>
		<td>材質：</td>
		<td><input type="text" name="p_material" size="40"><font color="red" size="2"></font></td>
	</tr>
	<tr>
		<td>尺碼：</td>
		<td><input type="text" name="p_size" size="40"><font color="red" size="2"></font></td>
	</tr>
	<tr>
		<td>說明：</td>
		<td><textarea rows="11" name="p_detail" cols="48"></textarea><font color="red" size="2"></font><font color="red" size="2">*建議324個中文字</font></td>
	</tr>
	<tr>
		<td>大圖：</td>
		<td><input type="file" name="p_image_b" size="32"><font color="red" size="2">圖片尺寸:400*400</font></td>
	</tr>
	<tr>
		<td>小圖：</td>
		<td><input type="file" name="p_image_s" size="32"><font color="red" size="2">圖片尺寸:120*120</font></td>
	</tr>
	<tr>
		<td>備註：</td>
		<td><input type="text" name="p_notes" size="40"></td>
	</tr>
	<tr>
		<td colspan="2">
		<p align="center"><input type="submit" name"submit" value="確定送出">　</td>
	</tr>
</table>
</form>
</body>

</html>