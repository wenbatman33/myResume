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
	if (document.form1.name.value == "")
	{
		alert("請輸入姓名");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.pic2.value == "")
	{
		alert("請輸入小圖的上傳路徑");
		document.form1.pic2.focus();
		return false;
	}	
	if (textCounter(document.form1.motto,50))
	{
		alert("座右銘字數太多！請控制在50個字。");
		document.form1.motto.focus();
		return false;
	}		
	if (textCounter(document.form1.grade,500))
	{
		alert("成績字數太多！請控制在500個字。");
		document.form1.grade.focus();
		return false;
	}	
	if (textCounter(document.form1.note,500))
	{
		alert("NOTE字數太多！請控制在500個字。");
		document.form1.note.focus();
		return false;
	}		
	if(document.form1.height.value != "" && isNaN(document.form1.height.value)) 
	{
		 alert("請輸入數字！");
		 document.form1.height.focus();
		 return false;
	}
	if(document.form1.weight.value != "" && isNaN(document.form1.weight.value)) 
	{
		 alert("請輸入數字！");
		 document.form1.weight.focus();
		 return false;
	}
	if (document.form1.height.value != "" && !checkNum(0,999,'height'))
	{
		 return false;
	}
	if (document.form1.weight.value != "" && !checkNum(0,999,'weight'))
	{
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
function checkNum(minNum,maxNum,name)
{
   eval("num = document.form1." + name + ".value");
   if (num < minNum || num > maxNum)
   {
		 alert("\n\n請輸入正確數字！\n\n");
		 eval("document.form1." + name + ".focus()");	
		 return false;   
   }
   else
     return true;
}
</script>
<a href="content_sponsor_view.asp"><<<回瀏覽頁>>></a> 
<form name="form1" method="post" action="content_sponsor_add1.asp"  enctype="multipart/form-data" onSubmit="return check();">
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">姓名(5個字以內)</td>
	  <td ALIGN="LEFT"><input type="text" name="name"  size="30" maxlength=5></td>	  	  
    </tr>     
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">生日(20個字以內)</td>
	  <td ALIGN="LEFT"><input type="text" name="birthday"  size="10" maxlength=20></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">出身地(8個字以內)</td>
	  <td ALIGN="LEFT"><input type="text" name="place"  size="5" maxlength=8></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">身高(3個字以內)</td>
	  <td ALIGN="LEFT"><input type="text" name="height"  size="10" maxlength=3>cm</td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">體重(3個字以內)</td>
	  <td ALIGN="LEFT"><input type="text" name="weight"  size="10" maxlength=3>kg</td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">就讀學校(25個字以內)</td>
	  <td ALIGN="LEFT"><input type="text" name="education"  size="30" maxlength=25></td>	  	  
    </tr>      
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">座右銘(50個字以內)</td>
	  <td ALIGN="LEFT"><TEXTAREA NAME="motto" ROWS=8 COLS=42></TEXTAREA></td>	  	  
    </tr>       
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">歷年成績(500個字以內)</td>
	  <td ALIGN="LEFT"><TEXTAREA NAME="grade" ROWS=8 COLS=42></TEXTAREA></td>	  	  
    </tr>      
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">FILA NOTE(500個字以內)</td>
	  <td ALIGN="LEFT"><TEXTAREA NAME="note" ROWS=8 COLS=42></TEXTAREA></td>	  	  
    </tr>     
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">大圖示(請上傳"240*178像素",200K以下的圖片)</td>
	  <td ALIGN="LEFT"><input type="file" name="pic1"  size="30"></td>	  	  
    </tr>   
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">小圖示(請上傳"155*98像素",200K以下的圖片)</td>
	  <td ALIGN="LEFT"><input type="file" name="pic2"  size="30"></td>	  	  
    </tr>                         
    </table>        
		<input type="Submit" value="確定新增">
</form>

   
    