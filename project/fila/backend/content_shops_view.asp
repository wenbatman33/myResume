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
   �P����I  <a href="content_shops_add.asp"><�s�W></a><a href="content.asp"><�^���e�޲z></a> 
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" width="10%" >�s��</td>
	  <td ALIGN="LEFT">�d�I�W��</td>
	  <td ALIGN="LEFT">�q��</td>	  	  
	  <td ALIGN="LEFT">�a�}</td>
	  <td ALIGN="LEFT">�a�Ϥ��G</td>
	  <td ALIGN="LEFT">����</td>
	  <td ALIGN="LEFT" width="10%">�ק�</td>
	  <td ALIGN="LEFT" width="10%">�R��</td>
    </tr>  
<%
   SQL = "Select SID,Name,PhoneNumber,Address,ShopsCategory.Category as Category,ShopsDistribution.Distribution as Distribution From Shops,ShopsDistribution,ShopsCategory where Shops.Category=ShopsCategory.SCID and Shops.Distribution=ShopsDistribution.SDID"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

do while not RS.eof
   SID = RS("SID")
%>
  <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" ><%=SID%></td>
	  <td ALIGN="LEFT"><%=RS("Name")%></td>
	  <td ALIGN="LEFT"><%=RS("PhoneNumber")%></td>
	  <td ALIGN="LEFT"><%=RS("Address")%></td>
	  <td ALIGN="LEFT"><%=RS("Category")%></td>
	  <td ALIGN="LEFT"><%=RS("Distribution")%></td>
	  <td ALIGN="LEFT" ><a href="content_shops_mod.asp?SID=<%=SID%>">�ק�</a></td>
	  <td ALIGN="LEFT" ><a href="content_shops_del.asp?SID=<%=SID%>">�R��</a></td>
  </tr>
<%
	RS.movenext
loop
  RS.Close
  oConn.Close
%>
</table>     

