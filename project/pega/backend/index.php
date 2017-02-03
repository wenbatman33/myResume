<?
	session_start();
	session_destroy();
	
	$webrootpath = $_SERVER["DOCUMENT_ROOT"];
	include_once $webrootpath."/_inc/_config.php";		
	
	$username = $_POST['username'];
	$password = $_POST['password'];
	
	if ($username != "" && $password != "")
	{
		if ($username == "administrator" && $password == "zaq12wsx")
		{
			session_start();
			$_SESSION['username'] = $username;
			$_SESSION['password'] = $password;				
			?>
			<script>
				location.href="backend.php";
			</script>
			<?
			exit;			
		}
	}
?>
<html>
<head>
<title>PEGA Design 後台</title>
<link href="css.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<style type="text/css">
<!--
body {
	background-color: #000000;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
function submitform()
{
	if (document.form1.username.value == "") 
	{
		alert("請輸入您的帳號！！");
		document.form1.username.focus();
		return false;
	}
	
	if (document.form1.password.value == "") 
	{
		alert("請輸入您的密碼！！");
		document.form1.password.focus();
		return false;
	}
	
	document.form1.submit();
	//return true;
}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- ImageReady Slices (未命名 -1) -->
<table width="100%" height="385" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
<form name="form1" method="post" action="index.php">
  <tr>
    <td align="center" valign="middle"><table id="___01" width="1009" height="717" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="9"><img src="images/login_01.jpg" width="1009" height="169" alt=""></td>
      </tr>
      <tr>
        <td colspan="2" rowspan="7"><img src="images/login_02.jpg" width="379" height="376" alt=""></td>
        <td colspan="5"><img src="images/login_03.jpg" width="240" height="149" alt=""></td>
        <td colspan="2" rowspan="7"><img src="images/login_04.jpg" width="390" height="376" alt=""></td>
      </tr>
      <tr>
        <td><img src="images/login_05.jpg" width="53" height="25" alt=""></td>
        <!--<td colspan="3"><img src="images/login_06.jpg" width="149" height="25" alt=""></td>-->
        <td colspan="3"><input type="text" name="username" size="19" class="inputcss"></td>
        <td rowspan="6"><img src="images/login_07.jpg" width="38" height="227" alt=""></td>
      </tr>
      <tr>
        <td colspan="4"><img src="images/login_08.jpg" width="202" height="13" alt=""></td>
      </tr>
      <tr>
        <td><img src="images/login_09.jpg" width="53" height="25" alt=""></td>
        <!--<td colspan="3"><img src="images/login_10.jpg" width="149" height="25" alt=""></td>-->
        <td colspan="3"><input type="password" name="password" size="19" class="inputcss"></td>
      </tr>
      <tr>
        <td colspan="4"><img src="images/login_11.jpg" width="202" height="18" alt=""></td>
      </tr>
      <tr>
        <td colspan="2" rowspan="2"><img src="images/login_12.jpg" width="141" height="146" alt=""></td>
        <td><a href="#" onClick="submitform();"><img src="images/login_13.jpg" width="60" height="22" border="0" alt=""></a></td>
        <td rowspan="2"><img src="images/login_14.jpg" width="1" height="146" alt=""></td>
      </tr>
      <tr>
        <td><img src="images/login_15.jpg" width="60" height="124" alt=""></td>
      </tr>
      <tr>
        <td rowspan="2"><img src="images/login_16.jpg" width="338" height="171" alt=""></td>
        <td colspan="7"><img src="images/login_17.jpg" width="333" height="65" alt=""></td>
        <td rowspan="2"><img src="images/login_18.jpg" width="338" height="171" alt=""></td>
      </tr>
      <tr>
        <td colspan="7"><img src="images/login_19.jpg" width="333" height="106" alt=""></td>
      </tr>
      <tr>
        <td><img src="images/間距.gif" width="338" height="1" alt=""></td>
        <td><img src="images/間距.gif" width="41" height="1" alt=""></td>
        <td><img src="images/間距.gif" width="53" height="1" alt=""></td>
        <td><img src="images/間距.gif" width="88" height="1" alt=""></td>
        <td><img src="images/間距.gif" width="60" height="1" alt=""></td>
        <td><img src="images/間距.gif" width="1" height="1" alt=""></td>
        <td><img src="images/間距.gif" width="38" height="1" alt=""></td>
        <td><img src="images/間距.gif" width="52" height="1" alt=""></td>
        <td><img src="images/間距.gif" width="338" height="1" alt=""></td>
      </tr>
    </table></td>
  </tr>
</form>
</table>
<!-- End ImageReady Slices -->
</body>
</html>