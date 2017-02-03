<%
   nCount = 1
   Url = "http://wbs.standard.bz/fila/backend/upload/"
   connection_str = "Driver={SQL Server};Server=.;Database=wbevent;Uid=iamhcf;Pwd=zaq12wsx;"
   Set oConn = Server.CreateObject("ADODB.Connection")

   SQL = "Select Topic,Content,Pic1,Pic2,Pic3,Show From Release Where Show=1 Order by RID DESC"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

   Response.write "<?xml version=""1.0"" encoding=""big5""?>"
   Response.write "<root>"
   do while not RS.eof
   		If RS("Pic1") = "" then 
   			urlpic1 = "undefined"
   		Else
   			urlpic1 = Url & RS("Pic1")
   		End If
   		If RS("Pic2") = "" then 
   			urlpic2 = "undefined"
   		Else
   			urlpic2 = Url & RS("Pic2")
   		End If
   		If RS("Pic3") = "" then 
   			urlpic3 = "undefined"
   		Else
   			urlpic3 = Url & RS("Pic3")
   		End If   		
      Response.write "<L" & nCount & ">"
      Response.write "<topic><![CDATA[" & RS("Topic") & "]]></topic>"
      Response.write "<content><![CDATA[" & RS("Content") & "]]></content>"
      Response.write "<pic1>" & urlpic1 & "</pic1>"
      Response.write "<pic2>" & urlpic2 & "</pic2>"
      Response.write "<pic3>" & urlpic3 & "</pic3>"
      Response.write "</L" & nCount & ">"
      nCount = nCount + 1
	    RS.movenext
   loop
   Response.write "</root>"
   RS.Close
   oConn.Close
%>