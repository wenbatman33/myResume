<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
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
		alert("�п�J���D");
		document.form1.topic.focus();
		return false;
	}
	if (document.form1.content.value == "")
	{
		alert("�п�J���e");
		document.form1.content.focus();
		return false;
	}
	if (textCounter(document.form1.topic,38))
	{
		alert("���D�r�ƤӦh�I�б���b38�Ӧr�C");
		document.form1.topic.focus();
		return false;
	}	
	if (textCounter(document.form1.content,500))
	{
		alert("���e�r�ƤӦh�I�б���b500�Ӧr�C");
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
<a href="content_release_view.asp"><<<�^�s����>>></a> 
<form name="form1" method="post" action="content_release_add1.asp"  enctype="multipart/form-data" onSubmit="return check();">
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">���D(38�Ӧr�H��)<br><font color=red>�e����ܥi�H���38�Ӥ���r</font></td>
	  <td ALIGN="LEFT"><TEXTAREA NAME="topic" ROWS=5 COLS=50></TEXTAREA></td>	  	  
    </tr>     
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">���e(500�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><TEXTAREA NAME="content" ROWS=5 COLS=50></TEXTAREA></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�Ϥ�1(�ФW��"170*100����",200K�H�U���Ϥ�)</td>
	  <td ALIGN="LEFT"><input type="file" name="pic1" size="30"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�Ϥ�2(�ФW��"170*100����",200K�H�U���Ϥ�)</td>
	  <td ALIGN="LEFT"><input type="file" name="pic2" size="30"></td>	  	  
    </tr>   
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�Ϥ�3(�ФW��"170*100����",200K�H�U���Ϥ�)</td>
	  <td ALIGN="LEFT"><input type="file" name="pic3" size="30"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">��ܦb�e��</td>
	  <td ALIGN="LEFT"><input type="checkbox" name="show" value=1></td>	  	  
    </tr>   
    </table>        
		<input type="submit" value="�T�w�s�W">
</form>

   
    