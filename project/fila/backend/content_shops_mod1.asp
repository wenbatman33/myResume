<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<%
'Åv­­ÀË¬d
FindSession()
%>
<%
    Response.Buffer = True
    Response.Expires = 0
  
   name = trim(request("name"))
   zip = trim(request("zip"))
   number = trim(request("number"))
   address = trim(request("address"))
   distribution = trim(request("distribution"))
   category = trim(request("category"))   
   SID = trim(request("SID"))  
   
   phoneNumber = zip & "-" & number

   SQL = "UPDATE Shops Set Name='" & name & "',PhoneNumber='" & phoneNumber & "',Address='" & address & "',Distribution=" & distribution & ",Category=" & category & " Where SID=" & SID
   'response.write SQL
  
   oConn.open connection_str
   oConn.Execute(SQL)	
   oConn.Close
   Call recorduse(2,"Shops_"& SID)

%>
<script>
  alert("OK");
	location.href="content_shops_view.asp";
</script>
