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
function add(nCount,Rid)
{
   var openmethod;
   eval("openmethod = document.form1.method" + nCount + ".value");
   location.href="content_index_add1Release.asp?openmethod=" + openmethod + "&RID=" + Rid;
}
</script>
    新聞稿 <a href="content_index_mod.asp"><<<回首頁訊息修改>>></a>
    <form name=form1>
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" width="10%" >編號</td>
	  <td ALIGN="LEFT">標題</td>
	  <td ALIGN="LEFT">內容</td>
	  <td ALIGN="LEFT">圖片1</td>	  	  
	  <td ALIGN="LEFT">圖片2</td>
	  <td ALIGN="LEFT">圖片3</td>
	  <td ALIGN="LEFT">顯示</td>
    <td ALIGN="LEFT" width="15%" >設為首頁訊息</td>	  
    </tr>  
<%
   SQL = "Select RID,Topic,Content,Pic1,Pic2,Pic3,Show From Release Where RID not in (Select RID From HomePage Where RID is Not Null)"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

   nCount = 1
do while not RS.eof
   Rid = RS("RID")
   pic1 = "upload/" & RS("pic1")
   pic2 = "upload/" & RS("pic2")
   pic3 = "upload/" & RS("pic3")
%>
  <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" ><%=Rid%></td>
	  <td ALIGN="LEFT"><%=RS("topic")%></td>
	  <td ALIGN="LEFT" ><textarea  cols="20" rows="3" readonly ><%=RS("Content")%></textarea></td>
	  <td ALIGN="LEFT"><img src="<%=pic1%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><img src="<%=pic2%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><img src="<%=pic3%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><%=RS("Show")%></td>
    <td ALIGN="LEFT" ><select name="method<%=nCount%>"><option value="_self" selected>原視窗開啟</option><option value="_blank">另開視窗</option></select><input type="button" value="確定" onclick="add(<%=nCount%>,<%=Rid%>);"> </td>	  
  </tr>
<%
	RS.movenext
	nCount = nCount + 1
loop
  RS.Close
  oConn.Close
  
%>
</table>   
</form>

