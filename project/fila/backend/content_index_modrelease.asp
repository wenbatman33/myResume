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
    document.form1.pic.disabled = true;
}
function check()
{
	if (document.form1.topic.value == "")
	{
		alert("�п�J���D");
		document.form1.topic.focus();
		return false;
	}
	if (document.form1.topic.value.length > 12)
	{
		alert("���D����b12�Ӧr����");
		document.form1.topic.focus();
		return false;
	}	
	if (document.form1.modPic.checked && document.form1.pic.value == "")
	{
		alert("�п�J�Ϥ����|");
		document.form1.pic.focus();
		return false;
	}
}
function enable(checkname,inputname)
{
  if (eval("document.form1." + checkname + ".checked"))
	   eval("document.form1." + inputname + ".disabled = false");
	else
	   eval("document.form1." + inputname + ".disabled = true");
}
</script>
<a href="content_index_mod.asp"><<<�^�����T���ק�>>></a>
<%
   HID = request("HID")
   SQL = "Select Content,Pic,Method From Homepage Where HID = " & HID
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3
   
   if RS.RecordCount = 0 then
      RS.Close
      oConn.Close
      Response.End
   end if
	    
%>
<form name="form1" method="post" action="content_index_modrelease1.asp"  enctype="multipart/form-data" onSubmit="return check();">
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">���D(12�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><input type="text" name="topic" size="30" maxlength=12 value="<%=RS("Content")%>"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�Ϥ�(�ФW��"170*100����",200K�H�U���Ϥ�)</td>
	  <td ALIGN="LEFT"><%=RS("Pic")%><br><input type="checkbox" name="modPic" value=1 onclick="enable('modPic','pic');"><input type="file" name="pic" size="30"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�}�ҵ�����k</td>
<%
    if (RS("Method") = "_self") then
%>	  
	  <td ALIGN="LEFT"><select name="method"><option value="_self" selected>������}��</option><option value="_blank">�t�}����</option></select></td>	  	  
<%
    else	  
%>
	  <td ALIGN="LEFT"><select name="method"><option value="_self">������}��</option><option value="_blank" selected>�t�}����</option></select></td>	  	  
<%
    end if
    RS.Close
    oConn.Close
%>      
    </tr>       
    </table>        
    <input type="hidden" name="HID" value=<%=HID%>>
		<input type="submit" value="�T�w�ק�">
</form>

   
    