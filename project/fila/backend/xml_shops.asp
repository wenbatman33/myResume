<%
    Response.Buffer = True
    Response.Expires = 0
    
   nCount = 1
   tag1 = ""
   tag2 = ""
   connection_str = "Driver={SQL Server};Server=.;Database=wbevent;Uid=iamhcf;Pwd=zaq12wsx;"
   Set oConn = Server.CreateObject("ADODB.Connection")

   SQL = "Select Name,PhoneNumber,Address,ShopsCategory.Category as Category,ShopsDistribution.Distribution as Distribution From Shops,ShopsDistribution,ShopsCategory where Shops.Category=ShopsCategory.SCID and Shops.Distribution=ShopsDistribution.SDID Order by ShopsDistribution.SDID,ShopsCategory.SCID"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

   Response.write "<?xml version=""1.0"" encoding=""big5""?>"
   Response.write "<root>"
   do while not RS.eof
      if (tag1 <> RS("Distribution")) then
          if (tag1 <> "") then
             Response.write "</" & tag2 & ">"
             Response.write "</" & tag1 & ">"    
             tag2 = ""
          end if
          nCount = 1
          tag1 = RS("Distribution")
          Response.write "<" & tag1 & ">"
      end if
      if (tag2 <> RS("Category")) then
          if (tag2 <> "") then
             Response.write "</" & tag2 & ">"    
          end if
          nCount = 1
          tag2 = RS("Category")
          Response.write "<" & tag2 & ">"
      end if      
      Response.write "<L" & nCount & ">"
      Response.write "<Name><![CDATA[" & RS("Name") & "]]></Name>"
      Response.write "<PhoneNumber><![CDATA[" & RS("PhoneNumber") & "]]></PhoneNumber>"
      Response.write "<Address><![CDATA[" & RS("Address") & "]]></Address>"
      Response.write "</L" & nCount & ">"
      nCount = nCount + 1
	    RS.movenext
   loop
   Response.write "</" & tag2 & ">"
   Response.write "</" & tag1 & ">"
   Response.write "</root>"
   RS.Close
   oConn.Close
%>