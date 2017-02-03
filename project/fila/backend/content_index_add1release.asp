<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<%
'權限檢查
FindSession()
%>
<%
    Response.Buffer = True
    Response.Expires = 0
    
    openmethod = trim(request("openmethod"))
    RID = trim(request("RID"))

   SQL = "Select HID From HomePage Where RID =" & RID
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

   if (RS.RecordCount <> 0) then
%>   
<script>
  alert("已新增過此則新聞");
	location.href="content_index_addRelease.asp";
</script>
<%
   end if
   RS.Close   
   '=================================================================================================
   SQL = "Select Topic,Pic1 From Release Where RID = " & RID
   Dim Topic,Pic
   RS.Open SQL,oConn,3,3
   if (RS.RecordCount <> 0) then
      Topic = RS("Topic")
      Pic = RS("Pic1")
   end if
   RS.Close
   '=================================================================================================
   SQL = "Insert into Homepage (Content,Pic,Method,Rid) values ('" & Topic & "','" & Pic & "','" & openmethod & "'," & RID & ")"
   oConn.Execute(SQL)	
   strSQL = "SELECT @@IDENTITY AS NewID"
	 Set Rs = oConn.Execute(strSQL)
	 NewID = Rs.Fields("NewID").value	
   oConn.Close
   Call recorduse(1,"Homepage_"& NewID)  
%>

<script>
  alert("完成");
	location.href="content_index_addRelease.asp";
</script>