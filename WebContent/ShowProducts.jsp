<%@ page language="java" import="com.shopping.product.*"
	pageEncoding="GBK"%>
<%@ page import="java.util.*"%>

<%
	final int PAGE_SIZE = 8;
	int pageNo = 1;
	String strPageNo = request.getParameter("pageNo");
	if (strPageNo != null && !strPageNo.trim().equals("")) {
		try {
			pageNo = Integer.parseInt(strPageNo);
		} catch (NumberFormatException e) {
			pageNo = 1;
		}
	}
	if (pageNo <= 0)
		pageNo = 1;
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	List<Product> products = new ArrayList<Product>();
	int totalRecords = ProductMgr.getInstance().find(products, pageNo, PAGE_SIZE, categoryId);

	int totalPages = (totalRecords + PAGE_SIZE - 1) / PAGE_SIZE;

	if (pageNo > totalPages)
		pageNo = totalPages;
%>

<html>
<head>

<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>- New Products</title>

<link href="images/new.css" rel="stylesheet" type="text/css">
<script language="javascript1.2">
	
function js_callpage(htmlurl)
{
	var newwin=window.open(htmlurl,'','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,top=2,width=360,height=470');
	return false;
}
function js_callpage1(htmlurl)
{
	var newwin=window.open(htmlurl,'','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,top=2,width=100,height=100');
	return false;
}

</script>




</head>
<body>
	<table align="left" border="0" cellpadding="0" cellspacing="0"
		width="980">
		<tbody>


			<tr>
				<td bgcolor="#dadce8" height="1"><img src="images/line.gif"
					height="1" width="1"></td>
			</tr>

			<tr>
				<td>
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td bgcolor="#e5e5f0" valign="top" width="190">
									<table border="0" cellpadding="0" cellspacing="0" width="100%">
										<tbody>
											<tr>
												<td>
													<table border="0" cellpadding="0" cellspacing="0"
														width="100%">
														<tbody>
															<tr>
																<td align="center" height="40"><img
																	src="images/login.gif" height="39" width="190"></td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td>
													<table border="0" cellpadding="0" cellspacing="0"
														width="100%">
														<tbody>
															<tr>
																<td rowspan="3" bgcolor="#aab3d5" width="1"><img
																	src="images/line.gif" height="1" width="1"></td>
																<td width="176"><img src="images/loginbg1.gif"
																	height="19" width="188"></td>
																<td rowspan="3" bgcolor="#aab3d5" width="1"><img
																	src="images/line.gif" height="1" width="1"></td>
															</tr>
															<tr>
																<td align="center" bgcolor="#e2e4f0">
																	<table border="0" cellpadding="0" cellspacing="0"
																		width="95%">
																		<form method="post" action="login.php"></form>
																		<tbody>
																			<tr>
																				<td align="left" height="25" width="73%">
																					member card： <input name="cardnumber" size="10"
																					style="font-size: 12px;" type="text">
																				</td>
																				<td rowspan="2" width="27%"><input
																					src="images/down.gif" name="B1" border="0"
																					height="45" type="image" width="45"></td>
																			</tr>
																			<tr>
																				<td align="left">Password： <input name="passwd"
																					size="10" style="font-size: 11px;" type="password">
																				</td>
																			</tr>
																			<tr>
																				<td colspan="2" height="30">
																					<p align="center">
																						[ <a href="extend.phptype=regtop.htm">new
																							register</a>] &nbsp;[ <a href="passwdview.php.htm"
																							onClick="js_callpage(href);return false">forget
																							password</a>]
																					</p>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</td>
															</tr>
															<tr>
																<td bgcolor="#aab3d5" height="1"><img
																	src="images/line.gif" height="1" width="1"></td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>















											<!--ad-->


											<!--ad end-->


										</tbody>
									</table>
								</td>
								<td width="10"></td>
								<td valign="top" width="780">
									<table style="border-collapse: collapse;" border="0"
										bordercolor="#111111" cellpadding="0" cellspacing="0"
										height="417" width="100%">
										<tbody>


											<tr>
												<td height="119">
													<table style="border-collapse: collapse;" border="0"
														bordercolor="#111111" cellpadding="0" cellspacing="0"
														width="100%">
														<tbody>
															<tr>
																<td width="100%"><input name="nowpcd" value=""
																	type="hidden">
																	<table border="0" cellpadding="0" cellspacing="0"
																		width="100%">

																		<form method="post"
																			action="index_catalog.php?pma_code=21&amp;cat_code=107&amp;sub_cat_code=&amp;onepcd="
																			name="glform"></form>
																		<tbody>



																			<tr>
																				<td bgcolor="#e5e5f0" height="25">
																					<table style="border-collapse: collapse;"
																						border="0" cellpadding="0" cellspacing="0"
																						width="100%">
																						<tbody>
																							<tr>
																								<td>&nbsp; <img src="images/m_33.gif"
																									height="10" width="10"> &nbsp; <strong><a
																										href="http://www.thinkshop.cn/index_catalog.php?pma_code=21&amp;cat_code=107">cookie</a>
																								</strong> &nbsp;
																								</td>

																								<form method="post"
																									action="index_catalog.php?pma_code=21&amp;cat_code=107&amp;sub_cat_code=&amp;mfname_sel=&amp;sortby=pdate&amp;onepcd=&amp;nowpcd="></form>
																								<td align="right">All <b><%=totalRecords%>
																								</b>products count <b><%=totalPages%> </b>page <b><%=pageNo%>
																								</b>&nbsp;&nbsp; <select size="1" name="pagenum"
																									class="input" onChange="submit()">
																										<option value="1" selected="selected">
																											first page</option>
																								</select>
																								</td>
																							</tr>


																						</tbody>
																					</table>
																				</td>

																			</tr>

																			<%
																				for (int i = 0; i < products.size(); i++) {
																					Product p = products.get(i);
																			%>

																			<tr>
																				<td align="center" height="100">
																					<table style="border-collapse: collapse;"
																						bgcolor="#ffffff" border="0" cellpadding="0"
																						cellspacing="0" width="95%">
																						<tbody>
																							<tr>
																								<td rowspan="3" width="108"><a
																									href="ShowProductDetail.jsp?id=<%=p.getId()%>"
																									class="mingcheng1"> <img
																										src="images/product/<%=p.getId() + ".jpg"%>"
																										border="0" height="90" width="75">
																								</a></td>
																								<td width="492"><a href=""
																									class="mingcheng1"><%=p.getName()%></a>&nbsp;</td>
																								<td rowspan="2" align="center" width="141">
																									<a href="Buy.jsp?id=<%=p.getId()%>&action=add"
																									target="cart"> <img
																										src="images/buy_mof.gif" border="0">
																								</a>
																									<form
																										action="https://www.paypal.com/cgi-bin/webscr"
																										method="post" target="_top">
																										<input type="hidden" name="cmd"
																											value="_s-xclick"> <input
																											type="hidden" name="encrypted"
																											value="-----BEGIN PKCS7-----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-----END PKCS7-----
">
																										<input type="image"
																											src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif"
																											border="0" name="submit"
																											alt="PayPal - The safer, easier way to pay online!">
																										<img alt="" border="0"
																											src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif"
																											width="1" height="1">
																									</form>

																								</td>
																							</tr>
																							<tr>
																								<td width="492">product id：<%=p.getId()%>
																									&nbsp; normal price： <font color="#cc0000">￥<%=p.getNormalPrice()%></font>&nbsp;
																									memeber price： <font color="#0000ff">￥<%=p.getMemberPrice()%></font>
																								</td>
																							</tr>
																							<tr>
																								<td colspan="2" width="633"><%=p.getDescr()%>
																								</td>
																							</tr>
																						</tbody>
																					</table>
																				</td>
																			</tr>
																			<tr>
																				<td align="center" height="20" valign="middle">
																					<img src="images/3j_line_2.gif" height="3"
																					width="744">
																				</td>
																			</tr>

																			<%
																				} // end for
																			%>

																			<form method="post"
																				action="index_catalog.php?pma_code=21&amp;cat_code=107&amp;sub_cat_code=&amp;mfname_sel=&amp;sortby=pdate&amp;onepcd=&amp;nowpcd="></form>



																		</tbody>
																	</table></td>
															</tr>

														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td height="30"></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td width="100%">
					<!--底部INC-->
					<br>
				</td>
			</tr>
		</tbody>
	</table>

</body>
</html>
