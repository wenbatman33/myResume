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
	response.write "上傳文件錯誤： <font color=ff0000>"&Err.Description&"</font>"
else
	'response.write "共上傳了 <font color=ff0000><b>"&intNo&"</b></font> 個文件！<p>"
	response.write "分別是：<br>"
	nPoint = 1

	'取出所有上傳文件的屬性
	for each thefile in objUpload.files
		'如果上傳文件不為空
		if thefile.fileName <> Empty then	
	randomize   
  ranNum=int(90000*rnd)+10000   
  Nowran=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum   				
  newfilename = dirUpload&Nowran&"."&thefile.FileExt
  thefile.saveas   server.mappath(newfilename) 
  	
			response.write thefile.Name&" = <font color=0000ff><b>"		'先輸出FORM中的input名，如file01、file02等
			'輸出文件名（不含路徑）
			response.write thefile.fileName&" </b></font>("		
			'輸出各個文件的Size
			response.write FormatNumber(thefile.size,0)&"bytes)<br>"
			response.write "說明：<font color=silver>"&objUpload.Form.Item("disc"&nPoint)&"</font><p>"
			nPoint = nPoint + 1
		end if
	Next

	response.write "<p>上傳總字節數："&"<font color=0000ff><b>"&objUpload.files.Totalbytes&"</b></font><br>"
	response.write "可上傳的最大文件數："&"<font color=0000ff><b>"&objUpload.files.count&"</b></font><br>"
	response.write "<hr>"
	
	
end if
%>
