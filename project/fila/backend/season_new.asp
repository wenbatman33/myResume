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
<form name="form1" action="season_add.asp" method="post" enctype="multipart/form-data" onsubmit="return checkcol(document.form1)">
<input type="hidden" name="t_seq" value="<%=t_seq%>">
<input type="hidden" name="excutetype" value="adds">
	<font color="red" size="2">*商品名稱+價錢 建議14個中文字</font>
<table border="1" id="table1" class="tabletype">
	<tr>
		<td>
		<p align="center">左列</td>
		<td>
		<p align="center">右列</td>
	</tr>
	<tr>
		<td>商品名稱：<input type="text" name="p_1" size="18"> 價錢NT：<input type="text" name="m_1" size="10"></td>
		<td>商品名稱：<input type="text" name="p_2" size="18"> 價錢NT：<input type="text" name="m_2" size="10"></td>
	</tr>
	<tr>
		<td>商品名稱：<input type="text" name="p_3" size="18"> 價錢NT：<input type="text" name="m_3" size="10"></td>
		<td>商品名稱：<input type="text" name="p_4" size="18"> 價錢NT：<input type="text" name="m_4" size="10"></td>
	</tr>
	<tr>
		<td>商品名稱：<input type="text" name="p_5" size="18"> 價錢NT：<input type="text" name="m_5" size="10"></td>
		<td>商品名稱：<input type="text" name="p_6" size="18"> 價錢NT：<input type="text" name="m_6" size="10"></td>
	</tr>
	<tr>
		<td>商品名稱：<input type="text" name="p_7" size="18"> 價錢NT：<input type="text" name="m_7" size="10"></td>
		<td>商品名稱：<input type="text" name="p_8" size="18"> 價錢NT：<input type="text" name="m_8" size="10"></td>
	</tr>	
	<tr>
		<td align="center">大圖：</td>
		<td><input type="file" name="p_image_b" size="32"><font color="red" size="2">圖片尺寸:400*300</font></td>
	</tr>
	<tr>
		<td align="center">小圖：</td>
		<td><input type="file" name="p_image_s" size="32"><font color="red" size="2">圖片尺寸:76*76</font></td>
	</tr>
	<tr>
		<td colspan="2">
		<p align="center">顯示<input type="radio" value="Y" name="isshow" checked>&nbsp;&nbsp;&nbsp;&nbsp;
		不顯示 <input type="radio" value="N" name="isshow"></td>
	</tr>
	<tr>
		<td colspan="2">
		<p align="center"><input type="submit" name"submit" value="確定送出">　</td>
	</tr>
</table>
</form>
</body>

</html>