<!--#INCLUDE FILE="common/dbconn.asp" -->
<!--#include file="common/function.asp"-->
<script type="text/javascript" src="prototype.js"></script>
<%
'�v���ˬd
FindSession()
%>
<%
    Response.Buffer = True
    Response.Expires = 0

%>
<script language="JavaScript">
function NewCheck()
{
    location.href="content_index_add.asp";
}
function ReleaseCheck()
{
    location.href="content_index_addRelease.asp";
}
function CheckShow(HID)
{
   if (!eval("document.form" + HID + ".Config" + HID + ".checked"))
      location.href="content_index_Show.asp?HID=" + HID + "&Show=0";
   else
<%
   Set oConn1 = Server.CreateObject("ADODB.Connection")
   
   SQL = "Select count(*) as HCount From HomePage Where Show = 1"
   oConn1.open connection_str
   Set RS1 = Server.CreateObject("ADODB.RecordSet")
   RS1.Open SQL,oConn1,3,3

   if (not RS1.eof) then
      HCount = RS1("HCount")
      if (HCount >=3) then
         RS1.Close
         oConn1.Close
%>
          alert("�����T���w��ܤT�h,���i�A�]�����");
          eval("document.form" + HID + ".Config" + HID + ".checked = false");
<%    
      else
         RS1.Close
         oConn1.Close
%>
         location.href="content_index_Show.asp?HID=" + HID + "&Show=1";
<%
      end if
   end if
%>
}
</script>
    ����  <a href="content.asp"><�^���e�޲z></a> <br>
    <form name=1><input type="button" name="New" value="�ۦ�s�W�T��" onClick="NewCheck();"><input type="button" name="New" value="�s�D�Z���" onClick="ReleaseCheck();"> </form>
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" width="10%" >�s��</td>
	  <td ALIGN="LEFT">���e</td>
	  <td ALIGN="LEFT">�Ϥ�</td>
	  <td ALIGN="LEFT">�s��</td>	  	  
	  <td ALIGN="LEFT">�}�ҵ�����k</td>
	  <td ALIGN="LEFT">�ק�</td>
	  <td ALIGN="LEFT">�R��</td>
	  <td ALIGN="LEFT" width="10%"><font color=red>�b�e�����</font></td>
    </tr>  
    
    �ۦ�s�W�������T��<br>
<%
   SQL = "Select HID,Content,Pic,Link,Method,Show From HomePage where RID=0"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

do while not RS.eof
   HID = RS("HID")
   pic = "upload/" & RS("Pic")
%>
  <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" ><%=HID%></td>
	  <td ALIGN="LEFT"><%=RS("Content")%></td>
	  <td ALIGN="LEFT" ><img src="<%=pic%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><%=RS("Link")%></td>
	  <td ALIGN="LEFT"><%=RS("Method")%></td>
	  <td ALIGN="LEFT"><a href="content_index_modself.asp?HID=<%=HID%>">�ק�<a></td>
	  <td ALIGN="LEFT"><a href="content_index_del.asp?HID=<%=HID%>">�R��<a></td>	  
	  <td ALIGN="LEFT" ><form name=form<%=HID%>><input type="checkbox" name="Config<%=HID%>" <%if RS("Show")=True then%> checked <%end if%>  onClick="CheckShow(<%=HID%>);"></form></td>
  </tr>
<%
	RS.movenext
loop
  RS.Close
%>
</table> 
   �q�s�D�Z�s�W�������T��<br>
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" width="10%" >�s��</td>
	  <td ALIGN="LEFT">���D</td>
	  <td ALIGN="LEFT">�Ϥ�</td>
	  <td ALIGN="LEFT">�}�ҵ�����k</td>
	  <td ALIGN="LEFT">�ק�</td>
	  <td ALIGN="LEFT">�R��</td>	  
	  <td ALIGN="LEFT" width="10%"><font color=red>�b�e�����</font></td>
    </tr>    
<%
  '========================================================================
   SQL = "Select HID,Content,Method,Pic,Show From HomePage Where RID <> 0"
   RS.Open SQL,oConn,3,3

do while not RS.eof
   HID = RS("HID")
   pic = "upload/" & RS("Pic")
%>
  <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" ><%=HID%></td>
	  <td ALIGN="LEFT"><%=RS("Content")%></td>
	  <td ALIGN="LEFT" ><img src="<%=pic%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><%=RS("Method")%></td>
	  <td ALIGN="LEFT"><a href="content_index_modrelease.asp?HID=<%=HID%>">�ק�<a></td>
	  <td ALIGN="LEFT"><a href="content_index_del.asp?HID=<%=HID%>">�R��<a></td>	  	  
	  <td ALIGN="LEFT" ><form name=form<%=HID%>><input type="checkbox" name="Config<%=HID%>"  <%if RS("Show")=True then%> checked <%end if%> onClick="CheckShow(<%=HID%>);"></form></td>
  </tr>
<%
	RS.movenext
loop
  RS.Close  
  oConn.Close
%>
    


