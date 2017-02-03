<html>
<link rel="stylesheet" href="css.css" type="text/css">
<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<title></title>
<script language="JavaScript" type="text/JavaScript">
function del_item(objno)
{
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
		alert("請選擇想要刪除的商品!");
		return false;
	}
	
	return true;
}
</script>
</head>
<?
	$webrootpath = $_SERVER["DOCUMENT_ROOT"];
	include_once $webrootpath."/_inc/_config.php";
	
	if ($_POST['changetype'] == "del")
	{
		foreach($_POST['delid'] as $delvalues)
		{
			$sql = "DELETE FROM bk_product WHERE pid = '$delvalues' LIMIT 1";
			$rtndel = mysql_query($sql, $mysql_link);
			//echo $sql."<br>";
		}
	
		if (!mysql_error($mysql_link))
		{	
			?>
			<script>
				alert("刪除成功!");
				location.href="product_mng.php";
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
?>
<body>
<?
	$webrootpath = $_SERVER["DOCUMENT_ROOT"];
	include_once $webrootpath."/_inc/_config.php";
	
	$cid = $_POST['cid'];
	$SQL = "SELECT cat_name FROM bk_product_cat WHERE id = $cid";
	$res = mysql_query($SQL, $mysql_link);
	list($cat_name) = mysql_fetch_array($res);
?>
商品類別：<?=$cat_name?>
<form name="frm" action="" method="post" target="main">
	<input type="hidden" name="changetype" value="del">
	<table border="1" cellspacing="0" cellpadding="2" style="border-collapse: collapse" bordercolor="#CB9696">
		<tr>
			<td class="firstrowcss">刪除</td>	
			<!--<td class="firstrowcss">排序</td>-->
			<td class="firstrowcss">商品主標</td>	
			<td class="firstrowcss">商品副標</td>	
			<td class="firstrowcss">Project Name</td>	
			<td class="firstrowcss">Design Category</td>	
			<td class="firstrowcss">Date</td>	
			<!--<td class="firstrowcss">Description</td>-->	
			<td class="firstrowcss"></td>
		</tr>				
		<?
		$SQL = "SELECT pid, subject1, subject2, name, design_cat, date, description FROM bk_product WHERE cat_id = $cid";
		$res = mysql_query($SQL, $mysql_link);
		//echo $SQL;
		$i = 1;
		while (list($pid, $subject1, $subject2, $name, $design_cat, $date, $description) = mysql_fetch_array($res))
		{
		?>
		<tr>
			<td class="tablecss_c"><input type="checkbox" class="inputcss" name="delid[]" value="<?=$pid?>" id="delid_<?=$i?>"></td>	
			<!--<td class="tablecss_c"><input class="inputcss" type="text" size="3" name="sortno[<?=$id?>]" id="sortid_<?=$i?>" value="<?=$sort?>"></td>-->
			<td class="tablecss_c"><?=$subject1?></td>	
			<td class="tablecss_c"><?=$subject2?></td>	
			<td class="tablecss_c"><?=$name?></td>	
			<td class="tablecss_c"><?=$design_cat?></td>	
			<td class="tablecss_c"><?=$date?></td>	
			<!--<td class="tablecss_c"><?=$description?></td>-->
			<td class="tablecss_c"><a href="product_modify.php?pid=<?=$pid?>" target="main">修改</a></td>
		</tr>
		<?
			$i ++;
		}
		?>
	</table>
	<br>
		<input type="submit" name="submit2" value="刪除商品" class="buttoncss" onclick="return del_item(<?=$i-1?>);">
</form>
</body>
</html>
