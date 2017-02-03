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
    document.form1.Link1.disabled = true;
    document.form1.Link2.disabled = false;    
}
function check()
{
	if (document.form1.content.value == "")
	{
		alert("請輸入內容");
		document.form1.content.focus();
		return false;
	}
	if (document.form1.modLink2.checked && document.form1.Link2.value == "")
	{
		alert("請輸入連結");
		document.form1.Link2.focus();
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
   SQL = "Select Content,Pic,Link,Method From Homepage Where HID = " & HID
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3
   
   if RS.RecordCount = 0 then
      RS.Close
      oConn.Close
      Response.End
   end if
	    
%>
<form name="form1" method="post" action="content_index_modself1.asp"  enctype="multipart/form-data" onSubmit="return check();">
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">內容(25個字以內)<br><font color=red>前端顯示可以顯示10個中文字</font></td>
	  <td ALIGN="LEFT"><input type="text" name="content" size="30" maxlength=25 value="<%=RS("Content")%>"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">圖片(請上傳"170*100像素",200K以下的圖片)</td>
	  <td ALIGN="LEFT"><%=RS("Pic")%><br><input type="checkbox" name="modPic" value=1 onclick="enable('modPic','pic');"><input type="file" name="pic" size="30"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">連結(256個字以內)</td>
	  <td ALIGN="LEFT">
	      <input type="checkbox" name="modLink1" value=1 onclick="enable('modLink1','Link1');">
	      <select name="Link1">
	           <option value="http://wbs.standard.bz/fila/0314/index.asp?pages=1" selected>網球首頁連結</option>
	           <option value="http://wbs.standard.bz/fila/0314/index.asp?pages=1&pages_itme=1" >網球當季風格連結</option>
	           <option value="http://wbs.standard.bz/fila/0314/index.asp?pages=2" >瑜珈健身首頁連結</option>
	           <option value="http://wbs.standard.bz/fila/0314/index.asp?pages=2&pages_itme=1" >瑜珈健身當季風格連結</option>
	           <option value="http://wbs.standard.bz/fila/0314/index.asp?pages=3" >休閒生活首頁連結</option>
	           <option value="http://wbs.standard.bz/fila/0314/index.asp?pages=3&pages_itme=1" >休閒生活當季風格連結</option>
	           <option value="http://wbs.standard.bz/fila/0314/index.asp?pages=4" >品味經典首頁連結</option>
	           <option value="http://wbs.standard.bz/fila/0314/index.asp?pages=4&pages_itme=1" >品味經典當季風格連結</option>
	           <option value="http://wbs.standard.bz/fila/0314/index.asp?pages=6" >銷售據點首頁連結</option>
	      </select>
	      <br>
	      <input type="checkbox" name="modLink2" value=1 onclick="enable('modLink2','Link2');">	      
	      <input type="text" name="Link2" size="30" maxlength=256 value="<%=RS("Link")%>">
	  </td>	  	  
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

   
    