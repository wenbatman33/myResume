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
			thefile.saveas   server.mappath(newfilename) 							
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

	excutetype = trim(objUpload.Form.Item("excutetype"))
	oConn.Open connection_str
	dim NewID
	if excutetype = "adds" then
		SQL = "insert into SeasonProduct(p_image_b,p_image_s,t_seq,isshow) values('"& imageurl_b &"','"& imageurl_s &"',"& t_seq &",'"& objUpload.Form.Item("isshow") &"')"
		oConn.Execute(SQL)
		strSQL = "SELECT @@IDENTITY AS NewID"
		Set Rs = oConn.Execute(strSQL)
		NewID = Rs.Fields("NewID").value		
		'商品detail新增		
			for i = 1 to 8
				pstr = "p_"& i
				mstr = "m_"& i
				pstr = objUpload.Form.Item(pstr)
				mstr = objUpload.Form.Item(mstr)
				if pstr <> "" then
					SQL = "insert into SeasonDetail(p_seq,p_name,p_price,p_location) values("& NewID &",'"& pstr &"',"& mstr &","& i &")"
					response.write SQL
					Set InsertDetail = oConn.Execute(SQL)
				end if
			Next		
	else
		p_seq = trim(objUpload.Form.Item("p_seq"))
		isshow = trim(objUpload.Form.Item("isshow"))		
		SQL = "update SeasonProduct set isshow='"& isshow &"'" & sql_b & sql_s &" where p_seq="& p_seq	
		Set InsertUser = oConn.Execute(SQL)
		'刪除商品明細
		SQL = "delete from SeasonDetail where p_seq = "& p_seq
		oConn.Execute(SQL)
		'商品detail新增		
		for i = 1 to 8
			pstr = "p_"& i
			mstr = "m_"& i
			pstr = objUpload.Form.Item(pstr)
			mstr = objUpload.Form.Item(mstr)
			if pstr <> "" then
				SQL = "insert into SeasonDetail(p_seq,p_name,p_price,p_location) values("& p_seq &",'"& pstr &"',"& mstr &","& i &")"
				response.write SQL
				Set InsertDetail = oConn.Execute(SQL)
			end if
		Next
	end if
	'response.write SQL
	
	oConn.Close
	'記錄使用狀況
	if excutetype = "adds" then '新增
		Call recorduse(1,"SeasonProduct_"& NewID)
	else	'修改
		Call recorduse(2,"SeasonProduct_"& p_seq)
	end if
	response.redirect "season_content.asp?t_seq="&t_seq	
end if
%>
