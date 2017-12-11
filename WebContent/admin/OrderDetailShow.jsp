<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import=" com.shopping.order.*, java.util.*" %>


<%
int id = Integer.parseInt(request.getParameter("id"));
SalesOrder so = OrderMgr.getInstance().loadById(id); 
%>

<script type="text/javascript">
	function showProductInfo(descr) {
		document.getElementById("productInfo").innerHTML="<font size=3 color=red>" + descr + "</font>";
	}
</script>

<center>
	User��<%=so.getUser().getUsername() %>
	detail��<br>
	<table border=1 align="center">
		<tr>
			<td>product name</td>
			<td>product price</td>
			<td>count</td>
			<td></td>
		</tr>
		<%
		List<SalesItem> items = OrderMgr.getInstance().getSalesItems(so);
		for(int i=0; i<items.size(); i++) {
			SalesItem si = items.get(i);
			%>
			<tr>
				
				<td onmouseover="showProductInfo('<%=si.getProduct().getDescr()%>')"><%=si.getProduct().getName() %></td>
				<%--
				<td><%=si.getProduct().getName() %></td>
				--%>
				<td><%=si.getUnitPrice() %></td>
				<td><%=si.getCount() %></td>
				
				<td></td>
			</tr>
			<%
		}
		%>
	</table>
	
	<div style="border:5px double purple;width:400;" id="productInfo">
		&nbsp;
	</div>

</center>