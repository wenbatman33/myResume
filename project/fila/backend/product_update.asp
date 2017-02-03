<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%
'權限檢查
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
		response.write "無此資料!請重新選擇"
		response.end
	end if
else
	response.write "無此資料!請重新選擇"
	response.end
end if
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
}
</script>
<form name="form1" action="product_add.asp" method="post" enctype="multipart/form-data" onsubmit="return checkcol(document.form1)">
<input type="hidden" name="t_seq" value="<%=t_seq%>">
<input type="hidden" name="p_seq" value="<%=p_seq%>">
<input type="hidden" name="excutetype" value="updates">
<table border="1" id="table1" class="tabletype">
	<font color="red" size="2">*名稱、型號、價格、材質、尺碼 建議24個中文字</font>
	<tr>
		<td>名稱：</td>
		<td><input type="text" name="p_name" size="40" value="<%=p_name%>"><font color="red" size="2">*必填</font></td>
	</tr>
	<tr>
		<td>型號：</td>
		<td><input type="text" name="p_type" size="40" value="<%=p_type%>"><font color="red" size="2"></font></td>
	</tr>
	<tr>
		<td>價格：</td>
		<td><input type="text" name="p_price" size="40" value="<%=p_price%>"><font color="red" size="2">*中文數字皆可</font></td>
	</tr>
	<tr>
		<td>材質：</td>
		<td><input type="text" name="p_material" size="40" value="<%=p_material%>"><font color="red" size="2"></font></td>
	</tr>
	<tr>
		<td>尺碼：</td>
		<td><input type="text" name="p_size" size="40" value="<%=p_size%>"><font color="red" size="2"></font></td>
	</tr>
	<tr>
		<td>說明：</td>
		<td><textarea rows="11" name="p_detail" cols="72"><%=p_detail%></textarea><font color="red" size="2"></font><font color="red" size="2">*建議324個中文字</font></td>
	</tr>
	<tr>
		<td>大圖：</td>
		<td><img src="<%=p_image_b%>" border="0"><input type="file" name="p_image_b" size="32"><font color="red" size="2">圖片尺寸:400*400，檔名不可為中文</font></td>
	</tr>
	<tr>
		<td>小圖：</td>
		<td><img src="<%=p_image_s%>" border="0"><input type="file" name="p_image_s" size="32" value="<%=p_image_s%>"><font color="red" size="2">圖片尺寸:120*120，檔名不可為中文</font></td>
	</tr>
	<tr>
		<td>備註：</td>
		<td><input type="text" name="p_notes" size="40" value="<%=p_notes%>"></td>
	</tr>
	<tr>
		<td colspan="2">
		<p align="center"><input type="submit" name"submit" value="確定送出">　</td>
	</tr>
</table>
</form>
</body>

</html>