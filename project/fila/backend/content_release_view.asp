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
    �s�D�Z  <a href="content_release_add.asp"><�s�W></a> <a href="content.asp"><�^���e�޲z></a> 
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" width="10%" >�s��</td>
	  <td ALIGN="LEFT">���D</td>
	  <td ALIGN="LEFT">���e</td>
	  <td ALIGN="LEFT">�Ϥ�1</td>	  	  
	  <td ALIGN="LEFT">�Ϥ�2</td>
	  <td ALIGN="LEFT">�Ϥ�3</td>
	  <td ALIGN="LEFT">���</td>
	  <td ALIGN="LEFT" width="10%">�ק�</td>
	  <td ALIGN="LEFT" width="10%">�R��</td>
    </tr>  
<%
   SQL = "Select RID,Topic,Content,Pic1,Pic2,Pic3,Show From Release"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

do while not RS.eof
   Rid = RS("RID")
   pic1 = "upload/" & RS("pic1")
   pic2 = "upload/" & RS("pic2")
   pic3 = "upload/" & RS("pic3")
%>
  <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" ><%=Rid%></td>
	  <td ALIGN="LEFT"><textarea  cols="20" rows="3" readonly ><%=RS("topic")%></textarea></td>
	  <td ALIGN="LEFT" ><textarea  cols="20" rows="3" readonly ><%=RS("Content")%></textarea></td>
	  <td ALIGN="LEFT"><img src="<%=pic1%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><img src="<%=pic2%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><img src="<%=pic3%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><%=RS("Show")%></td>
	  <td ALIGN="LEFT" ><a href="content_release_mod.asp?RID=<%=Rid%>">�ק�</td>
	  <td ALIGN="LEFT" ><a href="content_release_del.asp?RID=<%=Rid%>">�R��</td>
  </tr>
<%
	RS.movenext
loop
  RS.Close
  oConn.Close
%>
</table>     

