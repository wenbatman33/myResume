<%
   nCount = 1
   Url = "http://wbs.standard.bz/fila/backend/upload/"
   connection_str = "Driver={SQL Server};Server=.;Database=wbevent;Uid=iamhcf;Pwd=zaq12wsx;"
   Set oConn = Server.CreateObject("ADODB.Connection")

   SQL = "Select Top 3 HomePage.RID,HomePage.Content as Topic2,HomePage.Pic,HomePage.Link,HomePage.Method,Release.Topic as Topic1,Release.Content as Content2,Release.Pic2,Release.Pic3 From HomePage left join Release on HomePage.RID=Release.RID Where HomePage.Show = 1 Order by HID DESC"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

   Response.write "<?xml version=""1.0"" encoding=""big5""?>"
   Response.write "<root>"
   do while not RS.eof
      Response.write "<L" & nCount & ">"
      if (RS("RID") = 0) then
            Response.write "<topic><![CDATA[" & RS("Topic2") & "]]></topic>"
            Response.write "<content><![CDATA[]]></content>"
            Response.write "<pic1><![CDATA[" & Url & RS("Pic") & "]]></pic1>"
            Response.write "<pic2><![CDATA[]]></pic2>"
            Response.write "<pic3><![CDATA[]]></pic3>"
            Response.write "<link><![CDATA[" & RS("Link") & "]]></link>"
            Response.write "<topic2><![CDATA[" & RS("Topic2") & "]]></topic2>"
            Response.write "<open><![CDATA[" & RS("Method") & "]]></open>"      
            Response.write "</L" & nCount & ">"
      else
            Response.write "<topic><![CDATA[" & RS("Topic1") & "]]></topic>"
            Response.write "<content><![CDATA[" & RS("Content2") & "]]></content>"
            Response.write "<pic1><![CDATA[" & Url & RS("Pic") & "]]></pic1>"
            Response.write "<pic2><![CDATA[" & Url & RS("Pic2") & "]]></pic2>"
            Response.write "<pic3><![CDATA[" & Url & RS("Pic3") & "]]></pic3>"
            Response.write "<link><![CDATA[]]></link>"
            Response.write "<topic2><![CDATA[" & RS("Topic2") & "]]></topic2>"
            Response.write "<open><![CDATA[" & RS("Method") & "]]></open>"      
            Response.write "</L" & nCount & ">"
      end if
      nCount = nCount + 1
	    RS.movenext
   loop
   Response.write "</root>"
   RS.Close
   oConn.Close
%>