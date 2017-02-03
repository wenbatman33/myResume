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
		alert("請輸入標題");
		document.form1.topic.focus();
		return false;
	}
	if (document.form1.topic.value.length > 12)
	{
		alert("標題限制在12個字之內");
		document.form1.topic.focus();
		return false;
	}	
	if (document.form1.modPic.checked && document.form1.pic.value == "")
	{
		alert("請輸入圖片路徑");
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
<a href="content_index_mod.asp"><<<回首頁訊息修改>>></a>
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
	  <td ALIGN="LEFT">標題(12個字以內)</td>
	  <td ALIGN="LEFT"><input type="text" name="topic" size="30" maxlength=12 value="<%=RS("Content")%>"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">圖片(請上傳"170*100像素",200K以下的圖片)</td>
	  <td ALIGN="LEFT"><%=RS("Pic")%><br><input type="checkbox" name="modPic" value=1 onclick="enable('modPic','pic');"><input type="file" name="pic" size="30"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">開啟視窗方法</td>
<%
    if (RS("Method") = "_self") then
%>	  
	  <td ALIGN="LEFT"><select name="method"><option value="_self" selected>原視窗開啟</option><option value="_blank">另開視窗</option></select></td>	  	  
<%
    else	  
%>
	  <td ALIGN="LEFT"><select name="method"><option value="_self">原視窗開啟</option><option value="_blank" selected>另開視窗</option></select></td>	  	  
<%
    end if
    RS.Close
    oConn.Close
%>      
    </tr>       
    </table>        
    <input type="hidden" name="HID" value=<%=HID%>>
		<input type="submit" value="確定修改">
</form>

   
    