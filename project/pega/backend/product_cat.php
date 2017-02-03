<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css.css" type="text/css">
<script language="JavaScript" type="text/JavaScript">
function add_catalog()
{
	document.frm.changetype.value = "new";
	if (document.frm.cat_name.value == "")
	{
		alert("請輸入類別！");
		return false;
	}
	else if (document.frm.cat_sort.value == "")
	{
		alert("請輸入排序！");
		return false;
	}
	
	return true;
}

function del_catalog(objno)
{
	document.frm.changetype.value = "del";
	var checkflag = 1;
	for (i = 1; i <= objno; i ++)
	{
		var sortobj = document.getElementById("delid_"+i);
		if (sortobj.checked == true)
		{
			checkflag = 2;
			break;
		}
	}
	
	if (checkflag == 1)
	{
		alert("請選擇想要刪除的類別!");
		return false;
	}
	
	return true;
}

function change_sort(objno)
{
	document.frm.changetype.value = "sort";
	return true;
}
</script>
<title></title>
</head>
<?
	$webrootpath = $_SERVER["DOCUMENT_ROOT"];
	include_once $webrootpath."/_inc/_config.php";
	
	if ($_POST['changetype'] == "new")
	{
		$cat_name = $_POST['cat_name'];
		$cat_sort = $_POST['cat_sort'];
		
		$sql = "INSERT INTO bk_product_cat (cat_name, sort) VALUES ('$cat_name', '$cat_sort')";
		$rtn = mysql_query($sql, $mysql_link);
		//echo $sql."<br>";

		if (!mysql_error($mysql_link))
		{	
			?>
			<script>
				alert("新增成功!");
				location.href = "product_cat.php";
			</script>
			<?
			exit;
		}
		else
		{
			echo "新增失敗!<br>$sql";
			exit;
		}
	}
	else if ($_POST['changetype'] == "del")
	{
		foreach($_POST['delid'] as $delvalues)
		{
			$sql = "DELETE FROM bk_product_cat WHERE id = '$delvalues' LIMIT 1";
			$rtndel = mysql_query($sql, $mysql_link);
			//echo $sql."<br>";
		}
	
		if (!mysql_error($mysql_link))
		{	
			?>
			<script>
				alert("刪除成功!");
				location.href="product_cat.php";
			</script>
			<?
			exit;
		}
		else
		{
			echo "刪除失敗!<br>$sql";
			exit;
		}
	}
	else if ($_POST['changetype'] == "sort")
	{
		foreach($_POST['sortno'] as $catkey => $sortvalue)
		{
			$sql = "UPDATE bk_product_cat SET sort = '$sortvalue' WHERE id = '$catkey'";
			$rtn = mysql_query($sql, $mysql_link);
			//echo $sql."<br>";
		}
	
		if (!mysql_error($mysql_link))
		{	
			?>
			<script>
				alert("更改順序成功!");
				location.href="product_cat.php";
			</script>
			<?
			exit;
		}
		else
		{
			echo "更改順序失敗!<br>$sql";
			exit;
		}
	}
?>
<body>
<form name="frm" action="" method="post" target="main">
<input type="hidden" name="changetype">
<table border="1" cellspacing="0" cellpadding="2" style="border-collapse: collapse" bordercolor="#CB9696">
	<tr>
		<td class="firstrowcss">刪除</td>	
		<td class="firstrowcss">排序</td>	
		<td class="firstrowcss">類別名稱</td>	
		<td class="firstrowcss">&nbsp;</td>	
	</tr>
	<tr>
		<td class="tablecss_c">&nbsp;</td>
		<td class="tablecss_c"><input type="text" name="cat_sort" size="3" class="inputcss"></td>
		<td class="tablecss_c"><input type="text" name="cat_name" class="inputcss"></td>	
		<td class="tablecss_c"><input type="submit" name="new_cat" value="新增類別" class="buttoncss" onclick="return add_catalog();"></td>		
	</tr>
	<tr>
		<td height="10" colspan="4" bgcolor="#000000"></td>	
	</tr>
<?
$sql = "SELECT id, cat_name, sort FROM bk_product_cat ORDER BY sort ASC";
//echo $sql;				
$rtn = mysql_query($sql, $mysql_link);
$i = 1;
while (list($id, $cat_name, $sort) = mysql_fetch_array($rtn))
{
?>					
<tr>
	<td class="tablecss_c"><input type="checkbox" class="inputcss" name="delid[]" value="<?=$id?>" id="delid_<?=$i?>"></td>	
	<td class="tablecss_c"><input class="inputcss" type="text" size="3" name="sortno[<?=$id?>]" id="sortid_<?=$i?>" value="<?=$sort?>"></td>
	<td class="tablecss_c"><?=$cat_name?></td>	
	<td class="tablecss_c">&nbsp;</td>
</tr>
<? 
	$i ++; 
}
?>
</table>
		<br>
		<input type="submit" name="submit2" value="刪除類別" class="buttoncss" onclick="return del_catalog(<?=$i-1?>);">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" name="submit2" value="更改順序" class="buttoncss" onclick="return change_sort(<?=$i-1?>);">
</form>
</body>
</html>