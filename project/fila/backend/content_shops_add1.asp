<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
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
   
   phoneNumber = zip & "-" & number

   SQL = "Insert into Shops (Name,PhoneNumber,Address,Distribution,Category) values ('" & name & "','" & phoneNumber & "','" & address & "'," & distribution & "," & category & ")"
   'response.write SQL
  
   oConn.open connection_str
   oConn.Execute(SQL)	
   strSQL = "SELECT @@IDENTITY AS NewID"
	 Set Rs = oConn.Execute(strSQL)
	 NewID = Rs.Fields("NewID").value	
   oConn.Close
   Call recorduse(1,"Shops_"& NewID)

%>
<script>
  alert("�s�W����");
	location.href="content_shops_view.asp";
</script>