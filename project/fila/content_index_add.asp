<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<%
'�v���ˬd
FindSession()
%>
<%
    Response.Buffer = True
    Response.Expires = 0
%>
<script language="JavaScript">
function check()
{
	if (document.form1.content.value == "")
	{
		alert("�п�J���e");
		document.form1.content.focus();
		return false;
	}
	if (document.form1.link.value == "")
	{
		alert("�п�J�s��");
		document.form1.link.focus();
		return false;
	}
	if (document.form1.pic.value == "")
	{
		alert("�п�J�Ϥ����|");
		document.form1.pic.focus();
		return false;
	}
}
</script>
<a href="content_index_mod.asp"><<<�^�����T���ק�>>></a>
<form name="form1" method="post" action="content_index_add1.asp"  enctype="multipart/form-data" onSubmit="return check();">
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">���e(25�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><input type="text" name="content" size="30" maxlength=25></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�Ϥ�(�ФW��"170*100����",200K�H�U���Ϥ�)</td>
	  <td ALIGN="LEFT"><input type="file" name="pic" size="30"></td>	  	  
    </tr> 
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�s��(256�Ӧr�H��)</td>
	  <td ALIGN="LEFT"><input type="text" name="link" size="30" maxlength=256></td>	  	  
    </tr>     
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT">�}�ҵ�����k</td>
	  <td ALIGN="LEFT"><select name="method"><option value="_self" selected>������}��</option><option value="_blank">�t�}����</option></select></td>	  	  
    </tr>       
  </table>        
		<input type="submit" value="�T�w�s�W">
</form>

   
    <table width="1036" border="1">
      <tr>
        <td width="443" align="left" valign="middle">���y�����s��:<a href="http://wbs.standard.bz/fila/0314/index.asp?pages=1" target="_blank">http://wbs.standard.bz/fila/0314/index.asp?pages=1</a>      
        <br /></td>
        <td width="577" align="left" valign="middle">���y��u����s��:<a href="http://wbs.standard.bz/fila/0314/index.asp?pages=1&amp;pages_itme=1" target="_blank">http://wbs.standard.bz/fila/0314/index.asp?pages=1&amp;pages_itme=1</a></td>
      </tr>
      <tr>
        <td align="left" valign="middle">���ɰ��������s��:<a href="http://wbs.standard.bz/fila/0314/index.asp?pages=2" target="_blank">http://wbs.standard.bz/fila/0314/index.asp?pages=2</a></td>
        <td align="left" valign="middle">���ɰ�����u����s��:<a href="http://wbs.standard.bz/fila/0314/index.asp?pages=2&amp;pages_itme=1" target="_blank">http://wbs.standard.bz/fila/0314/index.asp?pages=2&amp;pages_itme=1</a></td>
      </tr>
      <tr>
        <td align="left" valign="middle">�𶢥ͬ������s��::<a href="http://wbs.standard.bz/fila/0314/index.asp?pages=3" target="_blank">http://wbs.standard.bz/fila/0314/index.asp?pages=3</a></td>
        <td align="left" valign="middle">�𶢥ͬ���u����s��:<a href="http://wbs.standard.bz/fila/0314/index.asp?pages=3&amp;pages_itme=1" target="_blank">http://wbs.standard.bz/fila/0314/index.asp?pages=3&amp;pages_itme=1</a></td>
      </tr>
      <tr>
        <td align="left" valign="middle">�~���g�孺���s��::<a href="http://wbs.standard.bz/fila/0314/index.asp?pages=4" target="_blank">http://wbs.standard.bz/fila/0314/index.asp?pages=4</a></td>
        <td align="left" valign="middle">�~���g���u����s��:<a href="http://wbs.standard.bz/fila/0314/index.asp?pages=4&amp;pages_itme=1" target="_blank">http://wbs.standard.bz/fila/0314/index.asp?pages=4&amp;pages_itme=1</a></td>
      </tr>
      <tr>
        <td align="left" valign="middle">�P����I�����s��::<a href="http://wbs.standard.bz/fila/0314/index.asp?pages=6" target="_blank">http://wbs.standard.bz/fila/0314/index.asp?pages=6</a></td>
        <td align="left" valign="middle">&nbsp;</td>
      </tr>
</table>
    <p>&nbsp;</p>
