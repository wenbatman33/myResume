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
    贊助選手  <a href="content_sponsor_add.asp"><新增></a><a href="content.asp"><回內容管理></a> 
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" width="10%" >編號</td>
	  <td ALIGN="LEFT">姓名</td>
	  <td ALIGN="LEFT">出身地</td>	  	  
	  <td ALIGN="LEFT">大圖示</td>	  	  
	  <td ALIGN="LEFT">小圖示</td>	  
	  <td ALIGN="LEFT" width="10%">修改</td>
	  <td ALIGN="LEFT" width="10%">刪除</td>
    </tr>  
<%
   SQL = "Select SID,Name,BirthPlace,BigPic,SmallPic From Sponsor"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

do while not RS.eof
   SID = RS("SID")
   pic1 = "upload/" & RS("BigPic")
   pic2 = "upload/" & RS("SmallPic")   
%>
  <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" ><%=SID%></td>
	  <td ALIGN="LEFT"><%=RS("Name")%></td>
	  <td ALIGN="LEFT"><%=RS("BirthPlace")%></td>
	  <td ALIGN="LEFT"><img src="<%=pic1%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><img src="<%=pic2%>"  width=100 height=75 border=0></td>	  
	  <td ALIGN="LEFT" ><a href="content_sponsor_mod.asp?SID=<%=SID%>">修改</a></td>
	  <td ALIGN="LEFT" ><a href="content_sponsor_del.asp?SID=<%=SID%>">刪除</a></td>
  </tr>
<%
	RS.movenext
loop
  RS.Close
  oConn.Close
%>
</table>     

