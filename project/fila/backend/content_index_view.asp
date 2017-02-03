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
    首頁  <a href="content.asp"><回內容管理></a> <br>

<%
   SQL = "Select HID,Content,Pic,Link,Method From HomePage where RID=0 and Show=1"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3
   
   if (RS.RecordCount <> 0) then
%>
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" width="10%" >編號</td>
	  <td ALIGN="LEFT">內容</td>
	  <td ALIGN="LEFT">圖片</td>
	  <td ALIGN="LEFT">連結</td>	  	  
	  <td ALIGN="LEFT">開啟視窗方法</td>
    </tr>  
    
    <br>自行新增的首頁訊息<br>
<%
    do while not RS.eof
       HID = RS("HID")
       pic = "upload/" & RS("Pic")
%>
  <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" ><%=HID%></td>
	  <td ALIGN="LEFT"><%=RS("Content")%></td>
	  <td ALIGN="LEFT" ><img src="<%=pic%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><%=RS("Link")%></td>
	  <td ALIGN="LEFT"><%=RS("Method")%></td>
  </tr>
<%
	     RS.movenext
    loop
    response.write "</table>"
    end if
  RS.Close
%>
 
   
<%
  '========================================================================
   SQL = "Select HID,Content,Method,Pic From HomePage where RID <> 0 and Show = 1"
   RS.Open SQL,oConn,3,3
   
   if (RS.RecordCount <> 0) then
%>
   <br>
   從新聞稿新增的首頁訊息<br>
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" width="10%" >編號</td>
	  <td ALIGN="LEFT">標題</td>
	  <td ALIGN="LEFT">圖片</td>
	  <td ALIGN="LEFT">開啟視窗方法</td>
    </tr> 
<%
   do while not RS.eof
      HID = RS("HID")
      pic = "upload/" & RS("Pic")
%>
  <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" ><%=HID%></td>
	  <td ALIGN="LEFT"><%=RS("Content")%></td>
	  <td ALIGN="LEFT" ><img src="<%=pic%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><%=RS("Method")%></td>
  </tr>
<%
	    RS.movenext
   loop
   response.write "</table>"
   end if
  RS.Close  
  oConn.Close
%>
    


