<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
FindSession()
%>
<body OnLoad="setDefault();">
<script language="JavaScript">
function setDefault()
{
    document.form1.pic1.disabled = true;
    document.form1.pic2.disabled = true;
}
function check()
{
	if (document.form1.name.value == "")
	{
		alert("�п�J�m�W");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.modPic2.checked && document.form1.pic2.value == "")
	{
		alert("�п�J�p�Ϫ��W�Ǹ��|");
		document.form1.pic2.focus();
		return false;
	}		
	if (textCounter(document.form1.motto,50))
	{
		alert("�y�k�ʦr�ƤӦh�I�б���b50�Ӧr�C");
		document.form1.motto.focus();
		return false;
	}		
	if (textCounter(document.form1.grade,500))
	{
		alert("���Z�r�ƤӦh�I�б���b500�Ӧr�C");
		document.form1.grade.focus();
		return false;
	}	
	if (textCounter(document.form1.note,500))
	{
		alert("NOTE�r�ƤӦh�I�б���b500�Ӧr�C");
		document.form1.note.focus();
		return false;
	}			
	if(document.form1.height.value != "" && isNaN(document.form1.height.value)) 
	{
		 alert("�п�J�Ʀr�I");
		 document.form1.height.focus();
		 return false;
	}
	if(document.form1.weight.value != "" && isNaN(document.form1.weight.value)) 
	{
		 alert("�п�J�Ʀr�I");
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
		 alert("\n\n�п�J���T�Ʀr�I\n\n");
		 eval("document.form1." + name + ".focus()");	
		 return false;   
   }
   else
     return true;
}
function enable(checkname,inputname)
{
  if (eval("document.form1." + checkname + ".checked"))
	   eval("document.form1." + inputname + ".disabled = false");
	else
	   eval("document.form1." + inputname + ".disabled = true");
}
</script>
<%
   SID = request("SID")
   SQL = "Select Name,Birth,BirthPlace,Height,Weight,Education,Motto,Grade,Note,BigPic,SmallPic From Sponsor where Sponsor.SID=" & SID
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

   if not (RS.eof or RS.bof) then

	    
%>
<a href="content_sponsor_view.asp"><<<�^�s����>>></a> 
<form name="form1" method="post" action="content_sponsor_mod1.asp"  enctype="multipart/form-data" onSubmit="return check();">
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�m�W(5�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><input type="text" name="name"  size="30" maxlength=5 value="<%=RS("Name")%>" ></td>	  	  
    </tr>     
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�ͤ�(20�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><input type="text" name="birthday"  size="10" maxlength=20 value="<%=RS("Birth")%>" ></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�X���a(8�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><input type="text" name="place"  size="5" maxlength=8 value="<%=RS("BirthPlace")%>" ></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">����(3�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><input type="text" name="height"  size="10" maxlength=3 value="<%=RS("Height")%>" >cm</td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�魫(3�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><input type="text" name="weight"  size="10" maxlength=3 value="<%=RS("Weight")%>" >kg</td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�NŪ�Ǯ�(25�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><input type="text" name="education"  size="30" maxlength=25 value="<%=RS("Education")%>" ></td>	  	  
    </tr>      
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�y�k��(50�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><TEXTAREA NAME="motto" ROWS=8 COLS=42><%=RS("Motto")%></TEXTAREA></td>	  	  
    </tr>       
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">���~���Z(500�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><TEXTAREA NAME="grade" ROWS=8 COLS=42><%=RS("Grade")%></TEXTAREA></td>	  	  
    </tr>      
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">FILA NOTE(500�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><TEXTAREA NAME="note" ROWS=8 COLS=42><%=RS("Note")%></TEXTAREA></td>	  	  
    </tr>    
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�j�ϥ�(�ФW��"240*178����",200K�H�U���Ϥ�)</td>
	  <td ALIGN="LEFT"><%=RS("BigPic")%><br><input type="checkbox" name="modPic1" value=1 onclick="enable('modPic1','pic1');"><input type="file" name="pic1" size="30"></td>	  	  
    </tr>  
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�p�ϥ�(�ФW��"155*98����",200K�H�U���Ϥ�)</td>
	  <td ALIGN="LEFT"><%=RS("SmallPic")%><br><input type="checkbox" name="modPic2" value=1 onclick="enable('modPic2','pic2');"><input type="file" name="pic2" size="30"></td>	  	  
    </tr>      
    </table>                     
    <input type="hidden" name="SID" value=<%=SID%>>
		<input type="submit" value="�T�w�ק�">
</form>
<%
   end if
   RS.Close      
 
   oConn.Close
%>

   
    