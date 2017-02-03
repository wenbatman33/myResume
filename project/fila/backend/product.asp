<!--#include file="common/function.asp"-->
<%
	FindSession()
%>
<frameset rows="15%,*" framespacing="1" border="0" frameborder="0">
	<frame name="tree" id="tree" target="bottom" src="product_tree.asp" scrolling="auto">
	<frame name="bottom" id="bottom" src="product_new.asp?menuseq=7" scrolling="auto">
	<noframes>
	<body>

	<p>此網頁使用框架，但是您的瀏覽器不支援框架。</p>

	</body>
	</noframes>
</frameset>
</body>
</html>