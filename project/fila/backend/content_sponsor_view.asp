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
    �٧U���  <a href="content_sponsor_add.asp"><�s�W></a><a href="content.asp"><�^���e�޲z></a> 
   <table border="2" cellspacing="3" cellpadding="2" bordercolor="white">
    <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" width="10%" >�s��</td>
	  <td ALIGN="LEFT">�m�W</td>
	  <td ALIGN="LEFT">�X���a</td>	  	  
	  <td ALIGN="LEFT">�j�ϥ�</td>	  	  
	  <td ALIGN="LEFT">�p�ϥ�</td>	  
	  <td ALIGN="LEFT" width="10%">�ק�</td>
	  <td ALIGN="LEFT" width="10%">�R��</td>
    </tr>  
<%
   SQL = "Select SID,Name,BirthPlace,BigPic,SmallPic From Sponsor"
   oConn.open connection_str
   Set RS = Server.CreateObject("ADODB.RecordSet")
   RS.Open SQL,oConn,3,3

do while not RS.eof
   SID = RS("SID")
   pic1 = "upload/" & RS("BigPic")
   pic2 = "upload/" & RS("SmallPic")   
%>
  <tr ALIGN="LEFT">
	  <td ALIGN="LEFT" ><%=SID%></td>
	  <td ALIGN="LEFT"><%=RS("Name")%></td>
	  <td ALIGN="LEFT"><%=RS("BirthPlace")%></td>
	  <td ALIGN="LEFT"><img src="<%=pic1%>"  width=100 height=75 border=0></td>
	  <td ALIGN="LEFT"><img src="<%=pic2%>"  width=100 height=75 border=0></td>	  
	  <td ALIGN="LEFT" ><a href="content_sponsor_mod.asp?SID=<%=SID%>">�ק�</a></td>
	  <td ALIGN="LEFT" ><a href="content_sponsor_del.asp?SID=<%=SID%>">�R��</a></td>
  </tr>
<%
	RS.movenext
loop
  RS.Close
  oConn.Close
%>
</table>     

