<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.shopping.product.*"%>

<%
int id = Integer.parseInt(request.getParameter("id"));

ProductMgr.getInstance().delete(id);
%>

<html>
	<head>
		<title>Delete product</title>
	</head>
	<center>
		delete successfully£¡
	</center>
	<body>
		<script type="text/javascript">	
			parent.main.location.reload();
		</script>
	</body>
</html>