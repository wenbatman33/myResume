<?php 
	$webrootpath = $_SERVER["DOCUMENT_ROOT"];
	include_once $webrootpath."/_config.php";
	
	$artistID 	= $_GET["artistID"];
	$monthID	= $_GET["monthID"];
	
	$sd = $monthID."-01";
	$ed = $monthID."-31";
		
	list($yy, $mm) = split("-", $monthID);	
	
	//Number of days in the given month
	$t = date("t", mktime(0, 0, 0, $mm, 1, $yy));
	
	$SQL = "SELECT * FROM `calendar` WHERE artist_id = '".$artistID."' AND event_date >= '".$sd."' AND event_date <= '".$ed."' ORDER BY id ASC";
	//echo $SQL;exit;
	$result = mysql_query($SQL);	
	$row = mysql_fetch_array($result);
     
    echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
	echo "<schedule>";	
		
	for ($i = 0; $i < $t; $i ++)
	{		
		$weekday = date("D", mktime(0, 0, 0, $mm, $i + 1, $yy));
		echo "<point Date=\"".($i + 1)."\" Day=\"".$weekday."\">";
		
		$dd = $monthID."-".sprintf("%02d", $i + 1);		
			
		while ($dd == $row["event_date"])	
		{
			echo "<Activity><![CDATA[".$row["event"]."]]></Activity>";			
			$row = mysql_fetch_array($result);
		}
		
		echo "</point>";
	}
	
	echo "</schedule>";
?>
