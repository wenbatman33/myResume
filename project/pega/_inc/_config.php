<?php
	function checklogin()
	{
		session_start();
		if ($_SESSION['username'] == "")
		{
			?>
			<script>
				//alert("請先登入");
				top.location.href = "index.php";
			</script>
			<?
			exit;
		}
	}
	
	////////////////////////////////////////////////////////////////////////////////////////////
	$host 	= "localhost";
	$user 	= "dbuser";
	$pwd 	= "zaq12wsx";
	
	$mysql_link = mysql_connect($host, $user, $pwd);
	mysql_select_db("PEGA", $mysql_link) or die('Could not select database.');
	mysql_query('set names "utf8"');
	
	//$websiteurl = "http://".$_SERVER["HTTP_HOST"];

	////////////////////////////////////////////////////////////////////////////////////////////
	function resize_jpg($inputFilename, $new_w, $new_h)
	{		
		$imagedata = getimagesize($inputFilename);
			
		$w = $imagedata[0];
		$h = $imagedata[1];				
		
		$newSize['w']	= 0;
		$newSize['h']	= 0;
		
		if ($h > $w) 
		{
			if ($h > $new_h)
			{
				$newSize['w'] = ($new_h / $h) * $w;
				$newSize['h'] = $new_h;	
				
				if ($newSize['w'] > $new_w)
				{
					$newSize['h'] = ($new_w / $newSize['w']) * $newSize['h'];
					$newSize['w'] = $new_w;
				}
			}
			else
			{
				$newSize['w'] = $w;
				$newSize['h'] = $h;
			}
		} 
		else 
		{
			if ($w > $new_w)
			{
				$newSize['h'] = ($new_w / $w) * $h;
				$newSize['w'] = $new_w;
				
				if ($newSize['h'] > $new_h)
				{
					$newSize['w'] = ($new_h / $newSize['h']) * $newSize['w'];
					$newSize['h'] = $new_h;
				}
			}
			else
			{
				$newSize['w'] = $w;
				$newSize['h'] = $h;
			}
		}
		
		return $newSize;
	}
?>