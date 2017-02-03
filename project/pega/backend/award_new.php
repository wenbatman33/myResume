<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css.css" type="text/css">
<script language="JavaScript" type="text/JavaScript">
function isNum(N)
{
	numtype = "0123456789";
	for (i = 0; i < N.length; i ++)
	{ 	//檢查是否有不在 0123456789之內的字
   		if (numtype.indexOf(N.substring(i, i + 1)) < 0)
     		return false;     //是的話....結束迴圈;傳回false
 	}
 	return true;
} 

function add_award()
{	
	if (document.frm.yy.value == "")
	{
		alert("請輸入得獎年份！");
		document.frm.yy.focus();
		return false;
	}
	else
	{
		if (document.frm.yy.value.length != 4 || !isNum(document.frm.yy.value))
		{
			alert("請輸入正確得獎年份！");
			document.frm.yy.focus();
			return false;
		}		
	}
	
	if (document.frm.s_img.value == "")
	{
		alert("請上傳產品小圖！");
		document.frm.s_img.focus();
		return false;
	}
	
	if (document.frm.l_img.value == "")
	{
		alert("請上傳產品大圖！");
		document.frm.l_img.focus();
		return false;
	}

	document.frm.submit();
}
</script>
<title></title>
</head>
<?
	$webrootpath = $_SERVER["DOCUMENT_ROOT"];
	include_once $webrootpath."/_inc/_config.php";
	$s_filename = $_FILES['s_img']['name'];
	$l_filename = $_FILES['l_img']['name'];
	$path = $webrootpath."/uploadfile/";
	
	if ($_POST["new_award"] == "new")
	{		
		$yy = $_POST['yy'];
		
		if (!empty($s_filename) && !empty($l_filename))
		{
			//check檔案格式是否為圖檔	
			$s_thetype = $_FILES['s_img']['type'];
			$l_thetype = $_FILES['l_img']['type'];
			$s_thetype = explode("/", $s_thetype);
			$l_thetype = explode("/", $l_thetype);
			if ($s_thetype[0] != "image" || $l_thetype[0] != "image")
			{
				?>
				<script>
	    			alert("所上傳的檔案不是圖片！請重新上傳...");
					location.href = "award_new.php";
				</script>		
				<?
				exit;
			}
		
			//檔案大小不得超過500K
			$s_thesize = $_FILES['s_img']['size'];
			$l_thesize = $_FILES['l_img']['size'];			
			if ($s_thesize > 500000 || $l_thesize > 500000)
			{
				?>
	    		<script>
	    			alert("檔案大小不得超過500K！請重新上傳...");
					location.href = "award_new.php";
				</script>		
				<?
				exit;
			}
					
			//檔案上傳		
			$s_filename = "award_s_".str_replace(substr($s_filename, 0, strrpos($s_filename, ".")), time(), $s_filename);
			$s_link = $path.$s_filename;			
			if (!copy($_FILES['s_img']['tmp_name'], $s_link))
			{
				?>
		  		<script>
		    		alert("圖片上傳失敗！請重新上傳...");
					location.href = "award_new.php";
				</script>		
				<?
				exit;
			}

			$l_filename = "award_l_".str_replace(substr($l_filename, 0, strrpos($l_filename, ".")), time(), $l_filename);
			$l_link = $path.$l_filename;
			if (!copy($_FILES['l_img']['tmp_name'], $l_link))
			{	
				?>
		  		<script>
		    		alert("圖片上傳失敗！請重新上傳....");
					location.href = "award_new.php";
				</script>		
				<?
				exit;
			}
			
			$sql = "INSERT INTO bk_award (year, s_img, l_img) VALUES ('$yy', '$s_filename', '$l_filename')";
			$rtn = mysql_query($sql, $mysql_link);
			//echo $sql."<br>";
	
			if (!mysql_error($mysql_link))
			{	
				?>
				<script>
					alert("新增成功!");
					location.href = "award_new.php";
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
	}	
?>
<body>
<form name="frm" action="" method="post" target="main" enctype="multipart/form-data">
<input type="hidden" name="new_award" value="new">
<table border="1" cellspacing="0" cellpadding="2" style="border-collapse: collapse" bordercolor="#CB9696">	
	<tr>
		<td class="firstrowcss">得獎年份</td>
		<td class="tablecss_c"><input type="text" name="yy" size="20" class="inputcss" maxlength="4"></td>
	</tr>	
	<tr>
		<td class="firstrowcss">小圖</td>
		<td class="tablecss_c"><input type="file" name="s_img" class="inputcss"></td>		
	</tr>
	<tr>
		<td class="firstrowcss">大圖</td>
		<td class="tablecss_c"><input type="file" name="l_img" class="inputcss"></td>		
	</tr>
</table>
		<br>
		<input type="button" name="submit2" value="新增" class="buttoncss" onclick="return add_award();">		
</form>
</body>
</html>