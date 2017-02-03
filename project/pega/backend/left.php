<?
	$webrootpath = $_SERVER["DOCUMENT_ROOT"];
	include_once $webrootpath."/_inc/_config.php";
	
	checklogin();
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="JSCookMenu/ThemeNavy/theme.css" type="text/css">
<link rel="stylesheet" href="css.css" type="text/css">
<script type="text/javascript" src="JSCookMenu/JSCookTree.js"></script>
<script type="text/javascript" src="JSCookMenu/ThemeNavy/theme.js"></script>
<title></title>
</head>
<body>
<table border="0" width="100%" cellspacing="0" cellpadding="0">	
<tr>
	<td>
	<table border="0" width="100%" cellspacing="0" cellpadding="0">	
	<tr>
		<td align="center"><a class="copy">使用者：<?=$_SESSION['username']?></a></td>			
	</tr>	
	<tr>
		<td><div id="myMenuID"></div></td>				
	</tr>
	<tr>
		<td align="center">&nbsp;</td>
	</tr>
	<tr>
		<td align="center"><a href="index.php" target="_parent" class="copy">登出</a></td>
	</tr>
	</table>
	</td>
	<td width="3%">&nbsp;</td>
</tr>
</table>


<script type="text/javascript"><!--
var myMenu =
[
	//[null,'後台使用者管理','privilege.php','main','使用者管理'],
	[null,'商品管理',null,null,'商品管理',
		['→','商品類別','product_cat.php','main','商品類別'],
		['→','商品上架','product_new.php','main','商品上架'],
		['→','商品修改','product_list.php','main','商品修改']
	],
	[null,'得獎管理',null,null,'得獎管理',
		['→','作品上架','award_new.php','main','作品上架'],
		['→','作品修改','award_mng.php','main','作品修改']
	]
];

	ctDraw ('myMenuID', myMenu, ctThemeNavy, 'ThemeNavy', 0, 0);
--></script>
</body>
</html>