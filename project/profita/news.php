<?php 
	$webrootpath = $_SERVER["DOCUMENT_ROOT"];
	include_once $webrootpath."/_config.php";
	
	$SQL = "SELECT * FROM `news` WHERE 1 ORDER BY id DESC";
	$result = mysql_query($SQL);
     
    echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
	echo "<news>";
	while ($row = mysql_fetch_array($result))
	{
		echo "<new>";
			echo "<title><![CDATA[".$row["title"]."]]></title>";
			echo "<Description><![CDATA[".$row["description"]."]]></Description>";
			echo "<pic><![CDATA[/upload_img/".$row["pic"]."]]></pic>";
			echo "<link><![CDATA[".$row["link"]."]]></link>";
		echo "</new>";
	}
	echo "</news>";
?>
