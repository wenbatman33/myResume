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
<body OnLoad="setDefault();">
<script language="JavaScript">
function setDefault()
{
    document.form1.topic.disabled = true;
    document.form1.content.disabled = true;
    document.form1.pic1.disabled = true;
    document.form1.pic2.disabled = true;
    document.form1.pic3.disabled = true;
    document.form1.show.disabled = true;
}

function check()
{
	if (document.form1.modTopic.checked && document.form1.topic.value == "")
	{
		alert("�п�J���D");
		document.form1.topic.focus();
		return false;
	}
	if (document.form1.modContent.checked && document.form1.content.value == "")
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

function enable(checkname,inputname)
{
  if (eval("document.form1." + checkname + ".checked"))
	   eval("document.form1." + inputname + ".disabled = false");
	else
	   eval("document.form1." + inputname + ".disabled = true");
}
</script>
<%
   RID = request("RID")
   SQL = "Select Topic,Content,Pic1,Pic2,Pic3,Show From Release Where RID =" & RID
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

   if not (RS.eof or RS.bof) then
%>
<a href="content_release_view.asp"><<<�^�s����>>></a> 
<form name="form1" method="post" action="content_release_mod1.asp"  enctype="multipart/form-data" onSubmit="return check();">
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
    <td ALIGN="LEFT">�קﶵ�ؽФĿ�</td>
	  <td ALIGN="LEFT">����</td>
	  <td ALIGN="LEFT">��l���</td>
	  <td ALIGN="LEFT">�ק���</td>	  	  
    </tr>  
    <tr ALIGN="LEFT">
    <td ALIGN="LEFT"><input type="checkbox" name="modTopic" value=1 onclick="enable('modTopic','topic');"></td>
	  <td ALIGN="LEFT">���D(38�Ӧr�H��)<br><font color=red>�e����ܥi�H���38�Ӥ���r</font></td>
	  <td ALIGN="LEFT"><%=RS("Topic")%></td>
	  <td ALIGN="LEFT"><TEXTAREA NAME="topic" ROWS=5 COLS=50></TEXTAREA></td>	  	  
    </tr>     
    <tr ALIGN="LEFT">
    <td ALIGN="LEFT"><input type="checkbox" name="modContent" value=1 onclick="enable('modContent','content');"></td>
	  <td ALIGN="LEFT">���e(500�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><%=RS("Content")%></td>
	  <td ALIGN="LEFT"><TEXTAREA NAME="content" ROWS=5 COLS=50></TEXTAREA></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
    <td ALIGN="LEFT"><input type="checkbox" name="modPic1" value=1 onclick="enable('modPic1','pic1');"></td>
	  <td ALIGN="LEFT">�Ϥ�1(�ФW��"170*100����",200K�H�U���Ϥ�)</td>
	  <td ALIGN="LEFT"><%=RS("Pic1")%></td>
	  <td ALIGN="LEFT"><input type="file" name="pic1" size="30"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
    <td ALIGN="LEFT"><input type="checkbox" name="modPic2" value=1 onclick="enable('modPic2','pic2');"></td>
	  <td ALIGN="LEFT">�Ϥ�2(�ФW��"170*100����",200K�H�U���Ϥ�)</td>
	  <td ALIGN="LEFT"><%=RS("Pic2")%></td>
	  <td ALIGN="LEFT"><input type="file" name="pic2" size="30"></td>	  	  
    </tr>   
    <tr ALIGN="LEFT">
    <td ALIGN="LEFT"><input type="checkbox" name="modPic3" value=1 onclick="enable('modPic3','pic3');"></td>
	  <td ALIGN="LEFT">�Ϥ�3(�ФW��"170*100����",200K�H�U���Ϥ�)</td>
	  <td ALIGN="LEFT"><%=RS("Pic3")%></td>
	  <td ALIGN="LEFT"><input type="file" name="pic3" size="30"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
    <td ALIGN="LEFT"><input type="checkbox" name="modShow" value=1 onclick="enable('modShow','show');"></td>
	  <td ALIGN="LEFT">��ܦb�e��</td>
	  <td ALIGN="LEFT"><%=RS("Show")%></td>
	  <td ALIGN="LEFT"><input type="checkbox" name="show"></td>	  	  
    </tr>   
    </table>                     
    <input type="hidden" name="RID" value=<%=RID%>>
		<input type="submit" value="�T�w�ק�">
</form>
<%
   end if
   RS.Close
   oConn.Close
%>

   
    