<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<%


'�w�q�W�ǥؿ�
const dirUpload = "upload\"

set objUpload = Server.CreateObject("AspSmartUpload.SmartUpload")
'����̤j�W��Size
objUpload.TotalMaxFileSize = 300000

'���W��
objUpload.Upload

'�O�s���bupload�ؿ��A�P�ɨ��o�W�Ǫ�����
'intNo = objUpload.save(dirUpload)

'�p�GErr��=0�A�h�����W�Ǧ��\
if Err <> 0 then
%>
	<script>
		alert("�ɮפW�ǥ���!�Э��s�W��");
		history.go(-1);
	</script>
<%	
	response.end
else
	'���X�Ҧ��W�Ǥ���ݩ�
	for each thefile in objUpload.files
		'�p�G�W�Ǥ�󤣬���
		if thefile.fileName <> Empty then
			'���o�üƻP���			
			randomize
			ranNum=int(90000*rnd)+10000
			Nowran=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum   				
			newfilename = dirUpload&Nowran&"."&thefile.FileExt
			'���s�R�W
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
		'�ӫ~detail�s�W		
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
		'�R���ӫ~����
		SQL = "delete from SeasonDetail where p_seq = "& p_seq
		oConn.Execute(SQL)
		'�ӫ~detail�s�W		
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
	'�O���ϥΪ��p
	if excutetype = "adds" then '�s�W
		Call recorduse(1,"SeasonProduct_"& NewID)
	else	'�ק�
		Call recorduse(2,"SeasonProduct_"& p_seq)
	end if
	response.redirect "season_content.asp?t_seq="&t_seq	
end if
%>
