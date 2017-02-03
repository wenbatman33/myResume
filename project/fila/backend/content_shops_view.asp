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
   銷售據點  <a href="content_shops_add.asp"><新增></a><a href="content.asp"><回內容管理></a> 
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" width="10%" >編號</td>
	  <td ALIGN="LEFT">櫃點名稱</td>
	  <td ALIGN="LEFT">電話</td>	  	  
	  <td ALIGN="LEFT">地址</td>
	  <td ALIGN="LEFT">地區分佈</td>
	  <td ALIGN="LEFT">種類</td>
	  <td ALIGN="LEFT" width="10%">修改</td>
	  <td ALIGN="LEFT" width="10%">刪除</td>
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
	  <td ALIGN="LEFT" ><a href="content_shops_mod.asp?SID=<%=SID%>">修改</a></td>
	  <td ALIGN="LEFT" ><a href="content_shops_del.asp?SID=<%=SID%>">刪除</a></td>
  </tr>
<%
	RS.movenext
loop
  RS.Close
  oConn.Close
%>
</table>     

