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
	if (document.form1.name.value == "")
	{
		alert("�п�J�d�I�W��");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.zip.value == "")
	{
		alert("�п�J�q��");
		document.form1.zip.focus();
		return false;
	}
	if (document.form1.number.value == "")
	{
		alert("�п�J�q��");
		document.form1.number.focus();
		return false;
	}	
	if (document.form1.address.value == "")
	{
		alert("�п�J�a�}");
		document.form1.address.focus();
		return false;
	}
	if(isNaN(document.form1.zip.value)) 
	{
		 alert("\n\n�п�J�Ʀr�I\n\n");
		 document.form1.zip.focus();
		 return false;
	}
	if(isNaN(document.form1.number.value)) 
	{
		 alert("\n\n�п�J�Ʀr�I\n\n");
		 document.form1.number.focus();
		 return false;
	}
}
</script>
<%
   SQL = "Select SDID,Distribution From ShopsDistribution"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

   string_SDistribution = ""
   nCount = 0
   do while not RS.eof
      if (nCount = 0) then
         string_SDistribution = string_SDistribution & "<option value='" & RS("SDID") & "' selected>" & RS("Distribution") & "</option>"
      else
         string_SDistribution = string_SDistribution & "<option value='" & RS("SDID") & "'>" & RS("Distribution") & "</option>"
      end if
      nCount = nCount + 1
	    RS.movenext
   loop
   RS.Close
   
   '=======================================================================================
   SQL = "Select SCID,Category From ShopsCategory"
   RS.Open SQL,oConn,3,3

   string_SCategory = ""
   nCount = 0   
   do while not RS.eof
      if (nCount = 0) then
         string_SCategory = string_SCategory & "<option value='" & RS("SCID") & "' selected>" & RS("Category") & "</option>"
      else
         string_SCategory = string_SCategory & "<option value='" & RS("SCID") & "' >" & RS("Category") & "</option>"
      end if
      nCount = nCount + 1
	    RS.movenext
   loop
   RS.Close
   '=======================================================================================
   oConn.Close   
%>
<a href="content_shops_view.asp"><<<�^�s����>>></a> 
<form name="form1" method="post" action="content_shops_add1.asp" onSubmit="return check();">
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�d�I�W��<br><font color=red>�e����ܥi�H���7�Ӧr</font></td>
	  <td ALIGN="LEFT"><input type="text" name="name"  size="30" maxlength=25></td>	  	  
    </tr>     
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�q��</td>
	  <td ALIGN="LEFT"><input type="text" name="zip"  size="5" maxlength=2>-<input type="text" name="number"  size="25" maxlength=10></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�a�}<br><font color=red>�e����ܥi�H���20�Ӥ���r</font></td>
	  <td ALIGN="LEFT"><input type="text" name="address"  size="30" maxlength=64></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�a�Ϥ��G</td>
	  <td ALIGN="LEFT"><select name="distribution"><%=string_SDistribution%></select></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">����</td>
	  <td ALIGN="LEFT"><select name="category"><%=string_SCategory%></select></td>	  	  
    </tr>         
    </table>        
		<input type="Submit" value="�T�w�s�W">
</form>

   
    