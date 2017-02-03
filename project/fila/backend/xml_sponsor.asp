<%
    Response.Buffer = True
    Response.Expires = 0
    
   start = trim(request("start"))
   Url = "http://wbs.standard.bz/fila/backend/upload/"
   connection_str = "Driver={SQL Server};Server=.;Database=wbevent;Uid=iamhcf;Pwd=zaq12wsx;"
   Set oConn = Server.CreateObject("ADODB.Connection")

   '=========================================================================
   SQL = "Select count(*) as SponsorCount From Sponsor"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3
   if not RS.eof then
      SponsorCount = RS("SponsorCount")
   end if
   RS.Close
   '=========================================================================
   startCount = 8 * (start-1) + 1
   SQL = "Select top 8 Name,Birth,BirthPlace,Height,Weight,Education,Motto,Grade,Note,BigPic,SmallPic From Sponsor Where SID not in (Select Top " & startCount-1 & " SID From Sponsor Order by SID DESC) Order by SID DESC"
   RS.Open SQL,oConn,3,3
   Response.write "<?xml version=""1.0"" encoding=""big5""?>"
   Response.write "<root num=""" & SponsorCount & """>"
   nCount = 1
   
   do while not RS.eof
      Response.write "<L" & nCount & ">"
      Response.write "<BigPic><![CDATA[" & Url & RS("BigPic") & "]]></BigPic>"
      Response.write "<SmallPic><![CDATA[" & Url & RS("SmallPic") & "]]></SmallPic>"
      Response.write "<Name><![CDATA[" & RS("Name") & "]]></Name>"
      Response.write "<Birthday><![CDATA[" & RS("Birth") & "]]></Birthday>"
      Response.write "<BirthPlace><![CDATA[" & RS("BirthPlace") & "]]></BirthPlace>"
      Response.write "<Height><![CDATA[" & RS("Height") & "cm" & "]]></Height>"
      Response.write "<Weight><![CDATA[" & RS("Weight") & "kg" & "]]></Weight>"
      Response.write "<Education><![CDATA[" & RS("Education") & "]]></Education>"
      Response.write "<Motto><![CDATA[" & RS("Motto") & "]]></Motto>"
      Response.write "<Grade><![CDATA[" & RS("Grade") & "]]></Grade>"
      Response.write "<Note><![CDATA[" & RS("Note") & "]]></Note>"
      Response.write "</L" & nCount & ">"
      nCount = nCount + 1
	    RS.movenext
   loop
   Response.write "</root>"
   RS.Close
   oConn.Close
%>