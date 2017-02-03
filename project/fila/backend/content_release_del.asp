<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<%
'權限檢查
FindSession()
%>
<%
    Response.Buffer = True
    Response.Expires = 0
    
   RID = request("RID")
   SQL = "Delete From Release Where RID = " & RID
   oConn.open connection_str
   oConn.Execute(SQL)	
   oConn.Close
   Call recorduse(3,"Release_"& RID)
%>
<script>
  alert("刪除完成");
	location.href="content_release_view.asp";
</script>