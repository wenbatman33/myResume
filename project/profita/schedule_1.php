<?php 
	$webrootpath = $_SERVER["DOCUMENT_ROOT"];
	include_once $webrootpath."/_config.php";
	
	$SQL = "SELECT * FROM `artist` WHERE 1 ORDER BY id DESC";
	$result = mysql_query($SQL);
     
    echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
	echo "<Root>";
	echo "<Artists>";
	while ($row = mysql_fetch_array($result))
	{
		echo "<artist artistID=\"".$row["id"]."\">";
			echo "<ID><![CDATA[".$row["name"]."]]></ID>";
			echo "<s_pic><![CDATA[/upload_img/".$row["s_img"]."]]></s_pic>";
			echo "<l_pic><![CDATA[/upload_img/".$row["b_img"]."]]></l_pic>";			
		echo "</artist>";
	}
	echo "</Artists>";
	
	$SQL = "SELECT SUBSTRING(event_date, 1, 7) AS d FROM `calendar` WHERE 1 GROUP BY d ORDER BY d ASC";
	$result = mysql_query($SQL);
	
	echo "<Date>";
	while ($row = mysql_fetch_array($result))
	{
		echo "<date><![CDATA[".$row["d"]."]]></date>";
	}
	echo "</Date>";
	echo "</Root>";
?>
