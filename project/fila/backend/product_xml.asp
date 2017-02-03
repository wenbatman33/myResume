<%
connection_str = "Driver={SQL Server};Server=.;Database=wbevent;Uid=iamhcf;Pwd=zaq12wsx;"
Set oConn = Server.CreateObject("ADODB.Connection")
t_seq = trim(request("t_seq"))
oConn.Open connection_str
if (t_seq = "1" or t_seq = "7" or t_seq = "13" or t_seq = "19") then	'當季風格
	SQL = "select title_3 from ProductTree where t_seq="& t_seq &" and levels = 9"
	Set SelectT = oConn.Execute(SQL)
	if not SelectT.eof then
		detail = SelectT("title_3")
	else
		detail = ""
	end if
	SQL_1 = "select top 6 p_seq,p_image_b,p_image_s from SeasonProduct where isshow='Y' and t_seq="& t_seq &" order by createtime desc"
	Set SelectS = oConn.Execute(SQL_1)
	counts = 1
	response.write "<?xml version=""1.0"" encoding=""big5""?>"
	response.write "<root>"
	if detail <> "" then
		response.write "<detail><![CDATA["& detail &"]]></detail>"
	end if
	Do Until SelectS.eof	
		p_image_b = SelectS("p_image_b")
		p_image_s = SelectS("p_image_s")
		p_seq = SelectS("p_seq")	
		response.write "<product_"&counts&">"
		response.write "<p_image_b><![CDATA["&p_image_b&"]]></p_image_b>"
		response.write "<p_image_s><![CDATA["&p_image_s&"]]></p_image_s>"
		'商品明細	
		SQL_2 = "select p_name,p_price from SeasonDetail where p_seq="& p_seq
		Set SelectD = oConn.Execute(SQL_2)
		countd = 1
		Do Until SelectD.eof
			p_name = SelectD("p_name")
			p_price = " NT:"&SelectD("p_price")
			response.write "<contents><![CDATA["& p_name & p_price &"]]></contents>"			
			SelectD.Movenext
			countd = countd+1
		Loop		
		if countd <= 6 then
			for j = 1 to (7-countd)
				response.write "<contents><![CDATA[undefined]]></contents>"
			Next
		end if
		
		response.write "</product_"&counts&">"
		SelectS.Movenext
		counts = counts + 1
	Loop
	response.write "</root>"
	oConn.Close
else
	start = trim(request("start"))
	start = start - 1
	'算總數
	SQL = "select count(t_seq) as totalnum from Product where t_seq="& t_seq
	Set CountP = oConn.Execute(SQL)
	totalnum = CountP("totalnum")	
	SQL = "select top 10 p_name,p_type,p_price,p_material,p_size,p_detail,p_image_b,p_image_s from Product where t_seq="& t_seq &" and p_seq not in(select top "&start&" p_seq from Product where t_seq="& t_seq &" order by t_seq desc) order by t_seq desc"
	'response.write SQL
	Set SelectP = oConn.Execute(SQL)
	counts = 1
	response.write "<?xml version=""1.0"" encoding=""big5""?>"
	response.write "<root p_num="""&totalnum&""">"
	Do Until SelectP.eof
		p_name = SelectP("p_name")
		p_type = SelectP("p_type")
		p_price = SelectP("p_price")
		if p_price = "" then
			p_price = "undefined"
		end if
		p_material = SelectP("p_material")
		p_size = SelectP("p_size")
		p_detail = SelectP("p_detail")
		p_image_b = SelectP("p_image_b")
		p_image_s = SelectP("p_image_s")				
		
		'印出xml
		response.write "<product_"&counts&">"
		response.write "<p_image_b><![CDATA["&p_image_b&"]]></p_image_b>"
		response.write "<p_image_s><![CDATA["&p_image_s&"]]></p_image_s>"
		response.write "<p_name><![CDATA["&p_name&"]]></p_name>"
		response.write "<p_type><![CDATA["&p_type&"]]></p_type>"
		response.write "<p_price><![CDATA["&p_price&"]]></p_price>"
		response.write "<p_material><![CDATA["&p_material&"]]></p_material>"
		response.write "<p_size><![CDATA["&p_size&"]]></p_size>"
		response.write "<p_detail><![CDATA["&p_detail&"]]></p_detail>"
		response.write "</product_"&counts&">"
		SelectP.Movenext
		counts = counts + 1
	Loop
	response.write "</root>"
	oConn.Close
end if
%>