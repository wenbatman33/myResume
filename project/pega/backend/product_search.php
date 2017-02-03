<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css.css" type="text/css">
<script type="text/javascript">
function chkfrm()
{
	if (document.form1.cid.value == "0")
	{
		alert("請選擇商品類別！");
		return false;
	}
	
	document.form1.submit();
}
</script>
<title></title>
</head>
<?
        $webrootpath = $_SERVER["DOCUMENT_ROOT"];
        include_once $webrootpath."/_inc/_config.php";
		
		$sql = "SELECT id, cat_name FROM bk_product_cat ORDER BY sort ASC";
		//echo $sql;				
		$rtn = mysql_query($sql, $mysql_link);	
?>
<body>
<form name="form1" action="product_mng.php" method="post" target="bottom">
<table border="1" cellpadding="2" cellspacing="0" style="border-collapse: collapse" bordercolor="#CB9696">
        <tr>
                <td class="tablecss_l">商品類別：
                        <select name="cid" class="inputcss">
                                        <option value="0" "selected">請選擇</option>
                                <?
                                        while (list($id, $cat_name) = mysql_fetch_array($rtn))
                                        {                                                
                                ?>
                                        <option value="<?=$id?>"><?=$cat_name?></option>
                                <?
                                        }
                                ?>
                        </select>
                </td>
        </tr>
        <tr>
                <td class="tablecss_c"><input type="submit" name="submit" value="查 詢" class="buttoncss" onClick="return chkfrm();"></td>
        </tr>
</table>

</form>
</body>

</html>
