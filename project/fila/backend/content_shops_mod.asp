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
		alert("請輸入櫃點名稱");
		document.form1.name.focus();
		return false;
	}
	if (document.form1.zip.value == "")
	{
		alert("請輸入電話");
		document.form1.zip.focus();
		return false;
	}
	if (document.form1.number.value == "")
	{
		alert("請輸入電話");
		document.form1.number.focus();
		return false;
	}	
	if (document.form1.address.value == "")
	{
		alert("請輸入地址");
		document.form1.address.focus();
		return false;
	}
	if(isNaN(document.form1.zip.value)) 
	{
		 alert("\n\n請輸入數字！\n\n");
		 document.form1.zip.focus();
		 return false;
	}
	if(isNaN(document.form1.number.value)) 
	{
		 alert("\n\n請輸入數字！\n\n");
		 document.form1.number.focus();
		 return false;
	}
}
</script>
<%
   Dim zip
   Dim number
   Dim name
   Dim address
   Dim SCID
   Dim SDID
      
   SID = request("SID")
   SQL = "Select Name,PhoneNumber,Address,SCID,SDID,ShopsCategory.Category as Category,ShopsDistribution.Distribution as Distribution From Shops,ShopsDistribution,ShopsCategory where Shops.Category=ShopsCategory.SCID and Shops.Distribution=ShopsDistribution.SDID and Shops.SID=" & SID
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

   if not (RS.eof or RS.bof) then
      phoneNumber = split(RS("PhoneNumber"),"-")
      zip = phoneNumber(0)
      number = phoneNumber(1)
      name = RS("Name")
      address = RS("Address")
      SCID = RS("SCID")
      SDID = RS("SDID")
   end if
   RS.Close  
   '=======================================================================================   
   SQL = "Select SDID,Distribution From ShopsDistribution"
   RS.Open SQL,oConn,3,3

   string_SDistribution = ""
   do while not RS.eof
      if (SDID = RS("SDID")) then
         string_SDistribution = string_SDistribution & "<option value='" & RS("SDID") & "' selected>" & RS("Distribution") & "</option>"
      else
         string_SDistribution = string_SDistribution & "<option value='" & RS("SDID") & "'>" & RS("Distribution") & "</option>"
      end if
	    RS.movenext
   loop
   RS.Close
   
   '=======================================================================================
   SQL = "Select SCID,Category From ShopsCategory"
   RS.Open SQL,oConn,3,3

   string_SCategory = ""
   do while not RS.eof
      if (SCID = RS("SCID")) then
         string_SCategory = string_SCategory & "<option value='" & RS("SCID") & "' selected>" & RS("Category") & "</option>"
      else
         string_SCategory = string_SCategory & "<option value='" & RS("SCID") & "' >" & RS("Category") & "</option>"
      end if
	    RS.movenext
   loop
   RS.Close  
   '=======================================================================================
   oConn.Close   
%>
<a href="content_shops_view.asp"><<<回瀏覽頁>>></a> 
<form name="form1" method="post" action="content_shops_mod1.asp" onSubmit="return check();">
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">項目</td>
	  <td ALIGN="LEFT">資料</td>	  	  
    </tr>  
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">櫃點名稱<br><font color=red>前端顯示可以顯示7個中文字</font></td>
	  <td ALIGN="LEFT"><input type="text" name="name" size="30" maxlength=25 value="<%=name%>"></td>	  	  
    </tr>     
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">電話</td>
	  <td ALIGN="LEFT"><input type="text" name="zip" size="5" maxlength=2 value="<%=zip%>">-<input type="text" name="number" size="25" maxlength=10 value="<%=number%>"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">地址<br><font color=red>前端顯示可以顯示20個中文字</font></td>
	  <td ALIGN="LEFT"><input type="text" name="address" size="30" maxlength=64 value="<%=address%>"></td>	  	  
    </tr>   
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">地區分佈</td>
	  <td ALIGN="LEFT"><select name="distribution"><%=string_SDistribution%></select></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">種類</td>
	  <td ALIGN="LEFT"><select name="category"><%=string_SCategory%></select></td>	  	  
    </tr>    
    </table>                     
    <input type="hidden" name="SID" value=<%=SID%>>
		<input type="submit" value="確定修改">
</form>

   
    