<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
FindSession()
%>
<%
    Response.Buffer = True
    Response.Expires = 0
    
   HID = request("HID")
   SQL = "Delete From HomePage Where HID = " & HID
   oConn.open connection_str
   oConn.Execute(SQL)	
   oConn.Close
   Call recorduse(3,"Homepage_"& HID)
%>
<script>
  alert("�R������");
	location.href="content_index_mod.asp";
</script>