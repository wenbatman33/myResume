<html>
<link rel="stylesheet" href="css.css" type="text/css">
<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<title></title>
<script language="JavaScript" type="text/JavaScript">
function del_award(objno)
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
		alert("請選擇想要刪除的作品!");
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
			$sql = "DELETE FROM bk_award WHERE aid = '$delvalues' LIMIT 1";
			$rtndel = mysql_query($sql, $mysql_link);
			//echo $sql."<br>";
		}
	
		if (!mysql_error($mysql_link))
		{	
			?>
			<script>
				alert("刪除成功!");
				location.href="award_mng.php";
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
<form name="frm" action="" method="post" target="main">
	<input type="hidden" name="changetype" value="del">
	<table border="1" cellspacing="0" cellpadding="2" style="border-collapse: collapse" bordercolor="#CB9696">
		<tr>
			<td class="firstrowcss">刪除</td>	
			<td class="firstrowcss">得獎年份</td>	
			<td class="firstrowcss">作品小圖</td>	
			<td class="firstrowcss">作品大圖</td>	
			<td class="firstrowcss"></td>
		</tr>
		<?
		$webrootpath = $_SERVER["DOCUMENT_ROOT"];
		include_once $webrootpath."/_inc/_config.php";
		
		$SQL = "SELECT aid, year, s_img, l_img FROM bk_award ORDER BY year ASC";
		$res = mysql_query($SQL, $mysql_link);
		//echo $SQL;
		$i = 1;
		while (list($aid, $year, $s_img, $l_img) = mysql_fetch_array($res))
		{
		?>
		<tr>
			<td class="tablecss_c"><input type="checkbox" class="inputcss" name="delid[]" value="<?=$aid?>" id="delid_<?=$i?>"></td>	
			<td class="tablecss_c"><?=$year?></td>	
			<td class="tablecss_c"><?=$s_img?></td>	
			<td class="tablecss_c"><?=$l_img?></td>	
			<td class="tablecss_c"><a href="award_modify.php?aid=<?=$aid?>">修改</a></td>
		</tr>
		<?
			$i ++;
		}
		?>
	</table>
	<br>
		<input type="submit" name="submit2" value="刪除作品" class="buttoncss" onclick="return del_award(<?=$i-1?>);">
</form>
</body>
</html>
