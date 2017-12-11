<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.shopping.category.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		

		<title>My JSP 'ProductSearch.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
function check() {
	var selectedCategory = document.complex.categoryId.options[document.complex.categoryId.selectedIndex];
	var selectedValue = selectedCategory.value;
	if(selectedValue.split("|")[1] == "1") {
		alert("Please select child category£¡");
		document.complex.categoryId.focus();
		return false;
	} else {
		selectedCategory.value = selectedValue.split("|")[0];
	}
	return true;
}
</script>
	</head>

	<body>
		<center>
			simple search
			<form name="simple" action="SearchResult.jsp" method="get">
				<input type="text" size="10" name="keyword" />
				search
				<input value="submit" type="submit">
			</form>
			<br>
			<form name="complex" action="ComplexSearchResult.jsp" method="post"
				onsubmit="return check()">
				<table width="750" align="center" border="2">
					<tr>
						<td colspan="2" align="center">
							Complex search
						</td>
					</tr>
					<tr>
						<td>
							categoty£º
						</td>
						<td>
							<select name="categoryId"
								style="font-size: 9pt; color: rgb(85, 85, 85);">
								<option selected="selected" value="-1">
									--all products--
								</option>
								<%
											List<Category> categories = CategoryService.getInstance()
											.getCategories();
									for (int i = 0; i < categories.size(); i++) {
										Category c = categories.get(i);
										String preStr = "";
										for (int j = 1; j < c.getGrade(); j++) {
											preStr += "--";
										}
								%>
								<option value="<%=c.getId()%>|<%=c.getGrade()%>">
									<%=preStr + c.getName()%>
								</option>
								<%
								}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							product name£º
						</td>
						<td>
							<input type=text name="name" size="15" maxlength="12">
						</td>
					</tr>
					<tr>
						<td>
							normal price
						</td>
						<td>
							From:
							<input type=text name="lowNormalPrice" size="15" maxlength="12">
							To
							<input type=text name="highNormalPrice" size="15" maxlength="12">
						</td>
					</tr>
					<tr>
						<td>
							member price
						</td>
						<td>
							From:
							<input type=text name="lowMemberPrice" size="15" maxlength="12">
							To
							<input type=text name="highMemberPrice" size="15" maxlength="12">
						</td>
					</tr>
					<tr>
						<td>
							date
						</td>
						<td>
							From:
							<input type=text name="startDate" size="15" maxlength="12">
							To
							<input type=text name="endDate" size="15" maxlength="12">
						</td>
					</tr>

					<tr>
						<td></td>
						<td>
							<input type="submit" value="submit">
							<input type="reset" value="reset">
						</td>
					</tr>

				</table>
			</form>
		</center>
	</body>
</html>
