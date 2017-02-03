<?php 
	$webrootpath = $_SERVER["DOCUMENT_ROOT"];
	include_once $webrootpath."/_config.php";
	
	$artistID 	= $_GET["artistID"];
	$monthID	= $_GET["monthID"];
	
	list($yy, $mm) = split("-", $monthID);	
	
	//Number of days in the given month
	$t = date("t", mktime(0, 0, 0, $mm, 1, $yy));
     
    echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
	echo "<schedule>";	
		
	for ($i = 0; $i < $t; $i ++)
	{		
		$weekday = date("D", mktime(0, 0, 0, $mm, $i + 1, $yy));
		echo "<point Date=\"".($i + 1)."\" Day=\"".$weekday."\">";
		
		$dd = $monthID."-".sprintf("%02d", $i + 1);
		$SQL = "SELECT * FROM `calendar` WHERE artist_id = '".$artistID."' AND event_date = '".$dd."' ORDER BY id ASC";
		//echo $SQL."<br>";
		$result = mysql_query($SQL);	
		while ($row = mysql_fetch_array($result))
		{
			echo "<Activity><![CDATA[".$row["event"]."]]></Activity>";			
		}
		
		/*
		while ($dd == $row["event_date"])	
		{
			echo "<Activity><![CDATA[".$row["event"]."]]></Activity>";			
			$row = mysql_fetch_array($result);
		}
		*/
		echo "</point>";
	}
	
	echo "</schedule>";
?>
