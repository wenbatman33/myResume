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
    新聞稿  <a href="content_release_add.asp"><新增></a> <a href="content.asp"><回內容管理></a> 
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" width="10%" >編號</td>
	  <td ALIGN="LEFT">標題</td>
	  <td ALIGN="LEFT">內容</td>
	  <td ALIGN="LEFT">圖片1</td>	  	  
	  <td ALIGN="LEFT">圖片2</td>
	  <td ALIGN="LEFT">圖片3</td>
	  <td ALIGN="LEFT">顯示</td>
	  <td ALIGN="LEFT" width="10%">修改</td>
	  <td ALIGN="LEFT" width="10%">刪除</td>
    </tr>  
<%
   SQL = "Select RID,Topic,Content,Pic1,Pic2,Pic3,Show From Release"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

do while not RS.eof
   Rid = RS("RID")
   pic1 = "upload/" & RS("pic1")
   pic2 = "upload/" & RS("pic2")
   pic3 = "upload/" & RS("pic3")
%>
  <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" ><%=Rid%></td>
	  <td ALIGN="LEFT"><textarea  cols="20" rows="3" readonly ><%=RS("topic")%></textarea></td>
	  <td ALIGN="LEFT" ><textarea  cols="20" rows="3" readonly ><%=RS("Content")%></textarea></td>
	  <td ALIGN="LEFT"><img src="<%=pic1%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><img src="<%=pic2%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><img src="<%=pic3%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><%=RS("Show")%></td>
	  <td ALIGN="LEFT" ><a href="content_release_mod.asp?RID=<%=Rid%>">修改</td>
	  <td ALIGN="LEFT" ><a href="content_release_del.asp?RID=<%=Rid%>">刪除</td>
  </tr>
<%
	RS.movenext
loop
  RS.Close
  oConn.Close
%>
</table>     

