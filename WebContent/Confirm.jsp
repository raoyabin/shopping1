<%@ page language="java" contentType="text/html; charset=GB18030" import="java.util.*"
	pageEncoding="GB18030"%>
	
<%@ page import="com.shopping.product.*, com.shopping.user.*, com.shopping.client.*" %>


<%
User u = (User)session.getAttribute("user");
if(u == null) {
	response.sendRedirect("UserLogin.jsp");
	return;
}

Cart c = (Cart)session.getAttribute("cart");
if(c == null) {
	c = new Cart();
	session.setAttribute("cart", c);
}
%>


<%
List<CartItem> items = c.getItems();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>final confirm</title>

</head>
<body>

<table align="center" border="1">
	<tr>
		<td>product ID</td>
		<td>product name</td>
		<td>buy count</td>
		<td>price</td>
		<td>total price</td>

	</tr>
	<%
	for(Iterator<CartItem> it = items.iterator(); it.hasNext(); ) {
		CartItem ci = it.next();
		%>
		<tr>
			<td><%=ci.getProduct().getId() %></td>
			<td><%=ci.getProduct().getName() %></td>
			<td><%=ci.getCount() %></td>
			<td><%=ci.getProduct().getMemberPrice() %></td>
			<td><%=ci.getProduct().getMemberPrice() * ci.getCount() %></td>
			
		</tr>
		<%
	}
	%>
	<tr>
		<td colspan=4>
			
		</td>
		<td>
			total price: <%=c.getTotalMemberPrice()%>
		</td>
	</tr>
	<tr>
		<td colspan=5>
			<form action="Order.jsp" method="post">
			welcome: <%=u.getUsername() %> <br>
			phone: <%=u.getPhone() %> <br>
			Addr : <textarea name="addr"><%=u.getAddr() %></textarea>
			<input type="submit" value="confirm order"> 
			</form>
		</td>
	</tr>
</table>

</body>
</html>
