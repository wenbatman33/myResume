<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
FindSession()
%>
<%
    Response.Buffer = True
    Response.Expires = 0

   Show = trim(request("Show"))
   HID = trim(request("HID"))
   SQL = "Update HomePage Set Show=" & Show & " where HID = " & HID
   'response.write SQL
  
   oConn.open connection_str
   oConn.Execute(SQL)	
   oConn.Close
   Call recorduse(2,"Homepage_"& HID)
%>
<%
   if (Show = 1) then
%>
<script>
  alert("�s�W�����������T��");
	location.href="content_index_mod.asp";
</script>
<%
else
%>
<script>
  alert("���������������T��");
	location.href="content_index_mod.asp";
</script>
<%
end if
%>
