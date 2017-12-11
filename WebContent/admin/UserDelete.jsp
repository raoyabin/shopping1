<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.shopping.user.*"%>

<%
int id = Integer.parseInt(request.getParameter("id"));
String url = request.getParameter("from");
User.delete(id);
%>

<html>
	<head>
		<title>Delete User</title>
	</head>
	<body>
		<center>
			Delete Successfully!
			<br>
			<span id="delay" style="background:red">3</span>seconds after would turn into previous page or click link
			<br>
			<a href="<%=url%>"><%=url%></a>
		</center>
		<script type="text/javascript">	
			
			//var delay = 3;
			//function goBack() {
			//	document.getElementById("delay").innerHTML=delay;
			//	delay --;
			//	if(delay == 0) 
			//		document.location.href='<%=url%>';
			//	else 
			//		setTimeout(goBack, 1000);
			//}
			//goBack();
			
			parent.main.location.reload();
			
		</script>
	</body>
</html>