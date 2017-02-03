<%@LANGUAGE="VBSCRIPT"   CODEPAGE="65001"%>
<%
connection_str = "Driver={SQL Server};Server=.;Database=wbevent;Uid=iamhcf;Pwd=zaq12wsx;"
Set oConn = Server.CreateObject("ADODB.Connection")
urlpath = "http://wbs.standard.bz/fila/backend/"
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="common/Bcss.css" rel="stylesheet" type="text/css">
<title>FILA後台</title>
</head>

<body bgcolor="#CCCCCC">