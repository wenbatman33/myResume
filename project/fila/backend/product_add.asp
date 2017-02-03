<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%


'定義上傳目錄
const dirUpload = "upload\"

set objUpload = Server.CreateObject("AspSmartUpload.SmartUpload")
'限制最大上傳Size
objUpload.TotalMaxFileSize = 300000

'文件上傳
objUpload.Upload

'保存文件在upload目錄，同時取得上傳的文件數
'intNo = objUpload.save(dirUpload)

'如果Err值=0，則說明上傳成功
if Err <> 0 then
%>
	<script>
		alert("檔案上傳失敗!請重新上傳");
		history.go(-1);
	</script>
<%	
	response.end
else
	'取出所有上傳文件的屬性
	for each thefile in objUpload.files
		'如果上傳文件不為空
		if thefile.fileName <> Empty then
			'取得亂數與日期			
			randomize
			ranNum=int(90000*rnd)+10000
			Nowran=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum   				
			newfilename = dirUpload&Nowran&"."&thefile.FileExt
			'重新命名
			thefile.saveas server.mappath(newfilename) 
			if thefile.Name = "p_image_b" then
				imageurl_b = urlpath & newfilename
				sql_b = ",p_image_b='"& imageurl_b &"'"
			else
				imageurl_s = urlpath & newfilename
				sql_s = ",p_image_s='"& imageurl_s &"'"
			end if
		end if
	Next	
	t_seq = trim(objUpload.Form.Item("t_seq"))
	p_name = trim(objUpload.Form.Item("p_name"))
	p_type = trim(objUpload.Form.Item("p_type"))
	p_price = trim(objUpload.Form.Item("p_price"))
	p_material = trim(objUpload.Form.Item("p_material"))
	p_size = trim(objUpload.Form.Item("p_size"))
	p_detail = trim(objUpload.Form.Item("p_detail"))
	p_notes = trim(objUpload.Form.Item("p_notes"))
	excutetype = trim(objUpload.Form.Item("excutetype"))
	if p_detail <> Empty then
		p_detail = Replace(p_detail,chr(10),"")
		p_detail = Replace(p_detail,chr(13),"<br/>")
	end if
	oConn.Open connection_str
	dim NewID
	if excutetype = "adds" then
		SQL = "insert into Product(p_name,p_type,p_price,p_material,p_size,p_detail,p_image_b,p_image_s,p_notes,t_seq) values ('"& p_name &"','"& p_type &"','"& p_price &"','"& p_material &"','"& p_size &"','"& p_detail &"','"& imageurl_b &"','"& imageurl_s &"','"& p_notes &"',"& t_seq &")"
		oConn.Execute(SQL)
		strSQL = "SELECT @@IDENTITY AS NewID"
		Set Rs = oConn.Execute(strSQL)
		NewID = Rs.Fields("NewID").value	
	else
		p_seq = trim(objUpload.Form.Item("p_seq"))
		SQL = "update Product set p_name='"& p_name &"',p_type='"& p_type &"',p_price='"& p_price &"',p_material='"& p_material &"',p_size='"& p_size &"',p_detail='"& p_detail & "'"& sql_b & sql_s &",p_notes='"& p_notes &"' where p_seq="& p_seq	
		Set InsertUser = oConn.Execute(SQL)		
	end if
	'response.write SQL	
	
	oConn.Close
	'記錄使用狀況
	if excutetype = "adds" then '新增
		Call recorduse(1,"Product_"& NewID)
	else	'修改
		Call recorduse(2,"Product_"& p_seq)	
	end if
	response.redirect "product_content.asp?level2="&t_seq	
end if
%>
