<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<%
'權限檢查
FindSession()
%>
<%
    Response.Buffer = True
    Response.Expires = 0

   SID = request("SID")
   SQL = "Delete From Sponsor Where SID = " & SID
   oConn.open connection_str
   oConn.Execute(SQL)	
   oConn.Close
   Call recorduse(3,"Sponsor_"& SID)
%>
<script>
  alert("刪除完成");
	location.href="content_sponsor_view.asp";
</script>