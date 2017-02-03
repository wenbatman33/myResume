<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<%
'權限檢查
FindSession()
%>
<%
    Response.Buffer = True
    Response.Expires = 0

%>
<script language="JavaScript">
function check()
{
	if (document.form1.topic.value == "")
	{
		alert("請輸入標題");
		document.form1.topic.focus();
		return false;
	}
	if (document.form1.content.value == "")
	{
		alert("請輸入內容");
		document.form1.content.focus();
		return false;
	}
	if (textCounter(document.form1.topic,38))
	{
		alert("標題字數太多！請控制在38個字。");
		document.form1.topic.focus();
		return false;
	}	
	if (textCounter(document.form1.content,500))
	{
		alert("內容字數太多！請控制在500個字。");
		document.form1.content.focus();
		return false;
	}
}

function textCounter(field, maxlimit) 
{
	if (Strlength(field.value) > maxlimit) 
	{
		return true;
	}
}

function Strlength(str)
{
	var Strlength = 0;
	for (i=0;i<str.length;i++)
	{
		if (str.charCodeAt(i) > 127)
		{
		 	Strlength = Strlength + 2;
		}else
		{
			Strlength = Strlength + 1;
		}
	}
		return Strlength;
}
</script>
<a href="content_release_view.asp"><<<回瀏覽頁>>></a> 
<form name="form1" method="post" action="content_release_add1.asp"  enctype="multipart/form-data" onSubmit="return check();">
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">標題(38個字以內)<br><font color=red>前端顯示可以顯示38個中文字</font></td>
	  <td ALIGN="LEFT"><TEXTAREA NAME="topic" ROWS=5 COLS=50></TEXTAREA></td>	  	  
    </tr>     
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">內容(500個字以內)</td>
	  <td ALIGN="LEFT"><TEXTAREA NAME="content" ROWS=5 COLS=50></TEXTAREA></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">圖片1(請上傳"170*100像素",200K以下的圖片)</td>
	  <td ALIGN="LEFT"><input type="file" name="pic1" size="30"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">圖片2(請上傳"170*100像素",200K以下的圖片)</td>
	  <td ALIGN="LEFT"><input type="file" name="pic2" size="30"></td>	  	  
    </tr>   
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">圖片3(請上傳"170*100像素",200K以下的圖片)</td>
	  <td ALIGN="LEFT"><input type="file" name="pic3" size="30"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">顯示在前端</td>
	  <td ALIGN="LEFT"><input type="checkbox" name="show" value=1></td>	  	  
    </tr>   
    </table>        
		<input type="submit" value="確定新增">
</form>

   
    