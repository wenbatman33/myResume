<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css.css" type="text/css">
<script language="JavaScript" type="text/JavaScript">
function add_product()
{
	if (document.frm.cat_id.value == "0")
	{
		alert("請選擇類別！");
		document.frm.cat_id.focus();
		return false;
	}
	
	if (document.frm.product_subject1.value == "")
	{
		alert("請輸入商品主標！");
		document.frm.product_subject1.focus();
		return false;
	}
	
	if (document.frm.product_subject2.value == "")
	{
		alert("請輸入商品副標！");
		document.frm.product_subject2.focus();
		return false;
	}
	
	if (document.frm.product_name.value == "")
	{
		alert("請輸入Project Name！");
		document.frm.product_name.focus();
		return false;
	}
	
	if (document.frm.design_cat.value == "")
	{
		alert("請輸入Design Category！");
		document.frm.design_cat.focus();
		return false;
	}
	/*
	if (document.frm.date.value == "")
	{
		alert("請輸入Date！");
		document.frm.date.focus();
		return false;
	}
	
	if (document.frm.description.value == "")
	{
		alert("請輸入Description！");
		document.frm.description.focus();
		return false;
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
	*/	
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
	
	$pid = $_REQUEST['pid'];
	
	if ($_POST["modify"] == "Y")
	{		
		$cat_id 		= $_POST['cat_id'];
		$subject1 		= $_POST['product_subject1'];
		$subject2 		= $_POST['product_subject2'];
		$name			= $_POST['product_name'];
		$design_cat 	= $_POST['design_cat'];
		$date 			= $_POST['date'];
		$description 	= $_POST['description'];
		//$description = str_replace(chr(13).chr(10), "<br>", $description);
		if (!empty($s_filename))
		{
			//check檔案格式是否為圖檔	
			$s_thetype = $_FILES['s_img']['type'];
			$s_thetype = explode("/", $s_thetype);
			if ($s_thetype[0] != "image")
			{
				?>
				<script>
	    			alert("所上傳的檔案不是圖片！請重新上傳...");
					location.href = "product_list.php";
				</script>		
				<?
				exit;
			}
		
			//檔案大小不得超過500K
			$s_thesize = $_FILES['s_img']['size'];
			if ($s_thesize > 500000)
			{
				?>
	    		<script>
	    			alert("檔案大小不得超過500K！請重新上傳...");
					location.href = "product_list.php";
				</script>		
				<?
				exit;
			}
					
			//檔案上傳		
			$s_filename = "s_".str_replace(substr($s_filename, 0, strrpos($s_filename, ".")), time(), $s_filename);
			$s_link = $path.$s_filename;			
			if (!copy($_FILES['s_img']['tmp_name'], $s_link))
			{
				?>
		  		<script>
		    		alert("圖片上傳失敗！請重新上傳...");
					location.href = "product_list.php";
				</script>		
				<?
				exit;
			}						
		}
		
		if (!empty($l_filename))
		{
			//check檔案格式是否為圖檔	
			$l_thetype = $_FILES['l_img']['type'];
			$l_thetype = explode("/", $l_thetype);
			if ($l_thetype[0] != "image")
			{
				?>
				<script>
	    			alert("所上傳的檔案不是圖片！請重新上傳...");
					location.href = "product_list.php";
				</script>		
				<?
				exit;
			}
		
			//檔案大小不得超過500K
			$l_thesize = $_FILES['l_img']['size'];			
			if ($l_thesize > 500000)
			{
				?>
	    		<script>
	    			alert("檔案大小不得超過500K！請重新上傳...");
					location.href = "product_list.php";
				</script>		
				<?
				exit;
			}
					
			$l_filename = "l_".str_replace(substr($l_filename, 0, strrpos($l_filename, ".")), time(), $l_filename);
			$l_link = $path.$l_filename;
			if (!copy($_FILES['l_img']['tmp_name'], $l_link))
			{	
				?>
		  		<script>
		    		alert("圖片上傳失敗！請重新上傳....");
					location.href = "product_list.php";
				</script>		
				<?
				exit;
			}						
		}	
		
		if (!empty($s_filename) && !empty($l_filename))
			$sql = "UPDATE bk_product SET cat_id = '$cat_id', subject1 = '$subject1', subject2 = '$subject2', name = '$name', design_cat = '$design_cat', date = '$date', description = '$description', s_img = '$s_filename', l_img = '$l_filename'
					WHERE pid = $pid LIMIT 1";			
		else if (empty($s_filename) && !empty($l_filename))
			$sql = "UPDATE bk_product SET cat_id = '$cat_id', subject1 = '$subject1', subject2 = '$subject2', name = '$name', design_cat = '$design_cat', date = '$date', description = '$description', l_img = '$l_filename'
					WHERE pid = $pid LIMIT 1";	
		else if (!empty($s_filename) && empty($l_filename))
			$sql = "UPDATE bk_product SET cat_id = '$cat_id', subject1 = '$subject1', subject2 = '$subject2', name = '$name', design_cat = '$design_cat', date = '$date', description = '$description', s_img = '$s_filename'
					WHERE pid = $pid LIMIT 1";	
		else
			$sql = "UPDATE bk_product SET cat_id = '$cat_id', subject1 = '$subject1', subject2 = '$subject2', name = '$name', design_cat = '$design_cat', date = '$date', description = '$description'
					WHERE pid = $pid LIMIT 1";	
		$rtn = mysql_query($sql, $mysql_link);
		//echo $sql."<br>";
	
		if (!mysql_error($mysql_link))
		{	
			?>
			<script>
				alert("修改成功!");
				location.href = "product_list.php";
			</script>
			<?
			exit;
		}
		else
		{
			echo "修改失敗!<br>$sql";
			exit;
		}							
	}	
?>
<body>
<form name="frm" action="" method="post" target="main" enctype="multipart/form-data">
<input type="hidden" name="modify" value="Y">
<table border="1" cellspacing="0" cellpadding="2" style="border-collapse: collapse" bordercolor="#CB9696">
	<tr>
		<td class="firstrowcss">類別</td>	
		<td class="tablecss_c">
			<select name="cat_id" class="inputcss">
            	<option value="0">請選擇</option>
                <?
                	$SQL = "SELECT pid, cat_id, subject1, subject2, name, design_cat, date, description, s_img, l_img FROM bk_product WHERE pid = $pid";
					$res = mysql_query($SQL, $mysql_link);
					list($pid, $cat_id, $subject1, $subject2, $name, $design_cat, $date, $description, $s_img, $l_img) = mysql_fetch_array($res);
		
                	$sql = "SELECT id, cat_name FROM bk_product_cat ORDER BY sort ASC";
                	//echo $sql;				
					$rtn = mysql_query($sql, $mysql_link);
                    while (list($id, $cat_name) = mysql_fetch_array($rtn))
                    {                    	
                    	if ($cat_id == $id)
                    		$str = "selected";
                    	else
                    		$str = "";
                    	echo "<option value=\"$id\" ".$str.">$cat_name</option>";
                    }
                 ?>
        	</select>      
		</td>			
	</tr>
	<tr>
		<td class="firstrowcss">商品主標</td>
		<td class="tablecss_c"><input type="text" name="product_subject1" size="40" class="inputcss" value="<?=$subject1?>"></td>
	</tr>
	<tr>
		<td class="firstrowcss">商品副標</td>
		<td class="tablecss_c"><input type="text" name="product_subject2" size="40" class="inputcss" value="<?=$subject2?>"></td>
	</tr>
	<tr>
		<td class="firstrowcss">Project Name</td>
		<td class="tablecss_c"><input type="text" name="product_name" size="40" class="inputcss" value="<?=$name?>"></td>
	</tr>
	<tr>
		<td class="firstrowcss">Design Category</td>
		<td class="tablecss_c"><input type="text" name="design_cat" size="40" class="inputcss" value="<?=$design_cat?>"></td>
	</tr>
	<tr>
		<td class="firstrowcss">Date</td>
		<td class="tablecss_c"><input type="text" name="date" size="40" class="inputcss" value="<?=$date?>"></td>
	</tr>
	<tr>
		<td class="firstrowcss">Description</td>
		<td class="tablecss_c"><textarea name="description" cols="40" rows="10" class="inputcss"><?=$description?></textarea></td>
	</tr>
	<tr>
		<td class="firstrowcss">小圖</td>
		<td class="tablecss_c">
			<img src="/uploadfile/<?=$s_img?>"><br>
			<input type="file" name="s_img" class="inputcss">
		</td>		
	</tr>
	<tr>
		<td class="firstrowcss">大圖</td>
		<td class="tablecss_c">
			<img src="/uploadfile/<?=$l_img?>"><br>
			<input type="file" name="l_img" class="inputcss">
		</td>		
	</tr>
</table>
		<br>
		<input type="submit" name="submit2" value="修改" class="buttoncss" onclick="return add_product();">		
</form>
</body>
</html>