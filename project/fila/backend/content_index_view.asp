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
    ����  <a href="content.asp"><�^���e�޲z></a> <br>

<%
   SQL = "Select HID,Content,Pic,Link,Method From HomePage where RID=0 and Show=1"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3
   
   if (RS.RecordCount <> 0) then
%>
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" width="10%" >�s��</td>
	  <td ALIGN="LEFT">���e</td>
	  <td ALIGN="LEFT">�Ϥ�</td>
	  <td ALIGN="LEFT">�s��</td>	  	  
	  <td ALIGN="LEFT">�}�ҵ�����k</td>
    </tr>  
    
    <br>�ۦ�s�W�������T��<br>
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
   �q�s�D�Z�s�W�������T��<br>
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" width="10%" >�s��</td>
	  <td ALIGN="LEFT">���D</td>
	  <td ALIGN="LEFT">�Ϥ�</td>
	  <td ALIGN="LEFT">�}�ҵ�����k</td>
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
    


