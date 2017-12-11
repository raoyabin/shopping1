<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.shopping.product.*"%>

<%
String[] idArray = request.getParameterValues("id");
if(idArray == null || idArray.length == 0) {
	out.println("wrong ID£¡");
	return;
}
ProductMgr.getInstance().delete(idArray);
%>

<html>
	<head>
		<title>delete product</title>
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