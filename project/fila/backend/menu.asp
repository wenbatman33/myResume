<!--#include file="./inc/chkid.inc" -->
<!--#include file="./inc/condb.inc" -->
<%
Set sql = Server.CreateObject("ADODB.Command")
sql.CommandType = 1
sql.ActiveConnection = connExplorer
sql.CommandText = "Select * From [Root]"
set Root_Object = Server.CreateObject("ADODB.Recordset")
Root_Object.Open sql, , 1, 1
RootName=Root_Object("根目錄名稱")
set Root_Object = nothing

sql.CommandText = "Select * From [Folder] Where 上層代碼='000000000000' Order By 目錄名稱"
set Root_Folder = Server.CreateObject("ADODB.Recordset")
Root_Folder.Open sql, , 1, 1
%>
<html>
<head>
<title>Menu</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<style>
body,td   {font-family:細明體;font-size:12px;cursor:default;}
span      {height:16px;padding-top:2px;}
img       {border:none;}
.FdRoot   {height:16px;padding:2px 0px 0px 2px;}
.FdText   {font-family:新細明體;font-size:12px;}
.FdWait   {width:100px;padding-left:8px;background:#f8fcff;color:#0066dd;}
.FdTemp   {left:0px;}
a         {text-decoration:none}
a:visited {color:#000000;}
a:link    {color:#000000;}
a:hover   {color:#0066dd;}
a:active  {color:#000000;}
</style>
<script>
var arrpos="",tmppos="",arrfsn="000000000000",arrtxt="<%=RootName%>"
var isLoading=false
top.document.title=arrtxt
function GetSubFolder(fid,fsn,v,f){//fid=物件編號 fsn=目錄代碼 v=目錄屬性 v=階層
if(eval('fd_'+f+'_'+fid+'a').className=="FdReady"){//取得樹狀結構
if(isLoading){ //system is busy
return
}
eval('fd_'+f+'_'+fid).innerHTML="<span class=FdWait>載入資料中...</span>"
eval('fd_'+f+'_'+fid+'a').className="FdOpen"
eval('fd_'+f+'_'+fid+'a').src="./pict/fd_line_"+v+"1.gif"
top.Explorer_Temp.location.replace("./temp.asp?fid="+fid+"&fsn="+fsn+"&fpv="+f);
isLoading=true

}else
if(eval('fd_'+f+'_'+fid+'a').className=="FdOpen"){//關閉樹狀結構
eval('fd_'+f+'_'+fid+'a').className="FdClose"
eval('fd_'+f+'_'+fid+'a').src="./pict/fd_line_"+v+"0.gif"
eval('fd_'+f+'_'+fid).style.position="absolute"
eval('fd_'+f+'_'+fid).style.visibility="hidden"
tmppos=eval('"_'+f+fid+'"')
if(tmppos!=arrpos){
if(arrpos.indexOf(tmppos)==0){
GetFolderItem(fid,fsn,f);
}
}
}else
if(eval('fd_'+f+'_'+fid+'a').className=="FdClose"){//開啟樹狀結構
eval('fd_'+f+'_'+fid+'a').className="FdOpen"
eval('fd_'+f+'_'+fid+'a').src="./pict/fd_line_"+v+"1.gif"
eval('fd_'+f+'_'+fid).style.position=""
eval('fd_'+f+'_'+fid).style.visibility=""
}
}
function GetFolderItem(fid,fsn,f){//開啟選取的物件
if(arrpos!=eval('"_'+f+fid+'"')){
var imgx=document.images;
for(i = 0; i < imgx.length; i++){
if(imgx(i).src.indexOf('fd1.gif')>0)
imgx(i).src="./pict/fd0.gif"
}
top.Explorer_Main.location.replace("main.asp?fsn="+fsn);
eval('fd_'+f+'_'+fid+'b').src="./pict/fd1.gif"
arrtxt=eval('fd_'+f+'_'+fid+'c').innerText
arrpos=eval('"_'+f+fid+'"')
arrfsn=fsn
top.document.title=arrtxt
}
}
function GetRootItem(){//開啟根目錄物件
var imgx=document.images;
for(i = 0; i < imgx.length; i++){
if(imgx(i).src.indexOf('fd1.gif')>0)
imgx(i).src="./pict/fd0.gif"
}
top.Explorer_Main.location.replace("main.asp?fsn=000000000000");
arrtxt="<%=RootName%>"
arrfsn="000000000000"
top.document.title=arrtxt
}
</script>
</head>
<body bgcolor="#ffffff" leftmargin=4 topmargin=4 onSelectStart="return false;" onDragStart="return false;">
<table border=0 cellpadding=0 cellspacing=0>
<tr><td width=19 height=16><img id=root src=./pict/root0.gif onClick="GetRootItem();"></td><td colspan=2 nowrap><span class=FdRoot onClick="root.click();"><%=RootName%></span></td></tr>
<%
fd_fid=0
fd_cnt=Root_Folder.RecordCount
do while not Root_Folder.eof
fd_fid=fd_fid+1
fd_fsn=Root_Folder("資料代碼")
fd_txt=Root_Folder("目錄名稱")
fd_sub="n"
if Root_Folder("子目錄數")>0 then
fd_sub="s"
end if

fd_cnt=fd_cnt-1
fd_end="0"
if fd_cnt=0 then
fd_end="1"
end if
%><tr><td width=19 height=16 valign=top<%if fd_cnt>0 then%> background=./pict/line.gif<%end if%>><img id="fd_1_<%=fd_fid%>a" class="FdReady" src=./pict/fd_line_<%=fd_sub&fd_end%>0.gif<%if fd_sub="s" then%> onclick="GetSubFolder('<%=fd_fid%>','<%=fd_fsn%>','<%=fd_sub&fd_end%>','1');"<%end if%>></td>
<td height=16 nowrap><img id="fd_1_<%=fd_fid%>b" src=./pict/fd0.gif align=top onclick="GetFolderItem('<%=fd_fid%>','<%=fd_fsn%>','1');"<%if fd_sub="s" then%> onDblClick="fd_1_<%=fd_fid%>a.click();"<%end if%>><span id="fd_1_<%=fd_fid%>c"
 class=FdText onclick="fd_1_<%=fd_fid%>b.click();"<%if fd_sub="s" then%> onDblClick="fd_1_<%=fd_fid%>a.click();"<%end if%>><%=fd_txt%></span>
<div id="fd_1_<%=fd_fid%>" class=FdTemp></div></td></tr>
<%
Root_Folder.MoveNext
loop
%></table>
</body>
</html>
