<!--#include file="common/DBConn.asp"-->
<!--#include file="common/function.asp"-->
<script language="JavaScript" type="text/JavaScript">
function changelevel2(levelseq)
{
	form1.level2.length = 5;
	form1.level2.options[2].value = 888;
	form1.level2.options[2].text = "�k�ͨt�C";
	form1.level2.options[3].value = 999;
	form1.level2.options[3].text = "�k�ͨt�C";			
	switch(levelseq)
	{
		case '1':	//���y			
			form1.level2.options[1].value = 1;
			form1.level2.options[1].text = "��u����";
			form1.level2.options[4].value = 6;
			form1.level2.options[4].text = "�t��ӫ~";												
			break;
		case '2':	//���ɰ���			
			form1.level2.options[1].value = 7;
			form1.level2.options[1].text = "��u����";
			form1.level2.options[4].value = 12;
			form1.level2.options[4].text = "�t��ӫ~";				
			break;	
		case '3':	//�𶢬y��
			form1.level2.options[1].value = 13;
			form1.level2.options[1].text = "��u����";
			form1.level2.options[4].value = 18;
			form1.level2.options[4].text = "�t��ӫ~";	
			break;					
		case '4':	//�~���g��
			form1.level2.options[1].value = 19;
			form1.level2.options[1].text = "��u����";
			form1.level2.options[4].value = 29;
			form1.level2.options[4].text = "�t��ӫ~";	
			break;			
		}			
		form1.level3.disabled = true;
		form1.level2.selectedIndex = 0;
		form1.level3.selectedIndex = 0;
}
function changelevel3(levelseq)
{
	if(levelseq == "888" || levelseq == "999")	
	{	
		form1.level3.disabled = false;	
		var tmp1 = form1.level1.selectedIndex;
		var level1seq = form1.level1.options[tmp1].value;		
		var tmp2 = form1.level2.selectedIndex;
		var level2seq = form1.level2.options[tmp2].value;				
		form1.level3.length = 3;
		if(level2seq == "888") //�k�ͨt�C
		{
			switch(level1seq)
			{
				case '1':			
					form1.level3.options[1].value = 2;
					form1.level3.options[1].text = "�A��";				
					form1.level3.options[2].value = 3;
					form1.level3.options[2].text = "�c��";					
					break;
				case '2':			
					form1.level3.options[1].value = 8;
					form1.level3.options[1].text = "�A��";				
					form1.level3.options[2].value = 9;
					form1.level3.options[2].text = "�c��";					
					break;
				case '3':			
					form1.level3.options[1].value = 14;
					form1.level3.options[1].text = "�A��";				
					form1.level3.options[2].value = 15;
					form1.level3.options[2].text = "�c��";					
					break;
				case '4':			
					form1.level3.options[1].value = 20;
					form1.level3.options[1].text = "�A��";				
					form1.level3.options[2].value = 21;
					form1.level3.options[2].text = "�c��";					
					break;															
			}
		}
		if(level2seq == "999")	//�k�ͨt�C
		{
			switch(level1seq)
			{
				case '1':			
					form1.level3.options[1].value = 4;
					form1.level3.options[1].text = "�A��";				
					form1.level3.options[2].value = 5;
					form1.level3.options[2].text = "�c��";					
					break;
				case '2':			
					form1.level3.options[1].value = 10;
					form1.level3.options[1].text = "�A��";				
					form1.level3.options[2].value = 11;
					form1.level3.options[2].text = "�c��";					
					break;
				case '3':			
					form1.level3.options[1].value = 16;
					form1.level3.options[1].text = "�A��";				
					form1.level3.options[2].value = 17;
					form1.level3.options[2].text = "�c��";					
					break;
				case '4':			
					form1.level3.options[1].value = 24;
					form1.level3.options[1].text = "�A��";				
					form1.level3.options[2].value = 25;
					form1.level3.options[2].text = "�c��";					
					break;															
			}
		}		
	}
	else
	{
		form1.level3.disabled = true;			
		form1.level3.selectedIndex = 0
	}
	
}
function checkselect()
{
	var checkkey = 1;
	var tmp2 = form1.level2.selectedIndex;
	var level2seq = form1.level2.options[tmp2].value;	
	if(level2seq == "888" || level2seq == "999")
	{
		var tmp3 = form1.level3.selectedIndex;
		var level3seq = form1.level3.options[tmp3].value;			
		if(level3seq != 0)
			checkkey = 2;
	}
	else
	{
		if(level2seq != 0)
			checkkey = 2;
	}
	if(checkkey == 1)
	{
		alert("�п�����O!");
		return false;
	}		
}
</script>
<%
'�v���ˬd
FindSession()
%>
<form name="form1" method="post" action="product_content.asp" onsubmit="return checkselect()" target="bottom">
	<select size="1" name="level1" onchange="changelevel2(this.value)">
			<option value="0">�п�ܲĤ@���O</option>
			<option value="1">���y</option>
			<option value="2">���ɰ���</option>
			<option value="3">�𶢬y��</option>
			<option value="4">�~���g��</option>
	</select>
	&nbsp;&nbsp;
	<select size="1" name="level2" onchange="changelevel3(this.value)">
			<option value="0">�п�ܲĤG���O</option>	
	</select>
	&nbsp;&nbsp;
<%
'response.write SQL_2
%>	
	<select size="1" name="level3" disabled>
			<option value="0">�п�ܲĤT���O</option>
	</select>
&nbsp;&nbsp;
<input type="submit" name="submit" value="�T�w">
</form>	
<iframe name="bottom" id="bottom" src="main.asp" scrolling="auto" frameborder="0" STYLE="border: 0px solid black; width=1000px; height=800px;"></iframe>
</body>

</html>
