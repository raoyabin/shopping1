<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="com.shopping.category.*"%>

<%!
private List<Category> getTopCategories(List<Category> categories) {
	List<Category> topCategories = new ArrayList<Category>();
	for(int i=0; i<categories.size(); i++) {
		Category c = categories.get(i);
		if(c.getGrade() == 1) {
			topCategories.add(c);
		}
	}
	return topCategories;
}

private List<Category> getChilds(Category parent, List<Category> categories) {
	List<Category> childs = new ArrayList<Category>();
	for(int i=0; i<categories.size(); i++) {
		Category c = categories.get(i);
		if(c.getPid() == parent.getId()) {
			childs.add(c);
		}
	}
	return childs;
}

private String getChildsStr(List<Category> childs) {
	StringBuffer buf = new StringBuffer();
	for(int i=0; i<childs.size(); i++) {
		Category c = childs.get(i);
		buf.append("<a href='ShowProducts.jsp?categoryId=" + c.getId() + "'>")
		   .append(c.getName()).append("</a>")
		   .append("-");
	}
	return buf.toString();
}
 %>

<%
List<Category> categories = CategoryService.getInstance().getCategories();
List<Category> topCategories = getTopCategories(categories);
 %>
<html>
<head>
<me content="zh-cn"></me>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>online mall</title>
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
<script language="JavaScript">
function MM_swapImgRestore() { //v3.0
var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_findObj(n, d) { //v4.01
var p,i,x;if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_swapImage() { //v3.0
var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
 if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function on_trview(trname,enforce)
{
	
	<%
	for(int i=0; i<topCategories.size(); i++) {
		Category c = topCategories.get(i);	
	%>
		document.all.pma_<%=c.getId()%>.style.display="none";
	<%
	}
	%>
	
	
	if (enforce=="in")
	{
		eval("document.all.pma_"+trname+".style.display=''");
		//eval("alert()");
		//ruby on rails
	}
	/*
	else
	{
		var pma_code,pma_serial;
		pma_code="";
		if (pma_code!="") /////////////二级分类默认打开层
		{
			if (pma_code=="21"){pma_serial=0;}
			if (pma_code=="5"){pma_serial=1;}
			if (pma_code=="4"){pma_serial=2;}
			if (pma_code=="2"){pma_serial=3;}
			if (pma_code=="20"){pma_serial=4;}
			if (pma_code=="22"){pma_serial=5;}
			if (pma_code=="12"){pma_serial=6;}
			if (pma_code=="3"){pma_serial=7}
			if (pma_code=="8"){pma_serial=8;}
			if (pma_code=="24"){pma_serial=9;}
			if (pma_code=="23"){pma_serial=10;}
			if (pma_code=="1"){pma_serial=11;}
			if (pma_code=="26"){pma_serial=12;}
			if (pma_serial!="")
			{
				eval("document.all.pma_"+pma_serial+".style.display=''");
				eval("MM_swapImage('images"+pma_serial+"','','images/0"+pma_serial+"-2.gif',1)");
			}
		}
		
	}
	*/
}


function MM_reloadPage(init) {//reloads the window if Nav4 resized
if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
function MM_showHideLayers() { //v6.0
var i,p,v,obj,args=MM_showHideLayers.arguments;
for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
obj.visibility=v; }
}
</script>
<script language="JavaScript">
var imgUrl=new Array();
var imgLink=new Array();
var imgTitle=new Array();
var imgPrice1=new Array();
var imgPrice2=new Array();
var adNum=0;imgUrl[1]='https://www3.lenovo.com/medias/lenovo-laptop-thinkpad-25-retro-1.jpg?context=bWFzdGVyfHJvb3R8OTg4NzR8aW1hZ2UvanBlZ3xoOWQvaDg2Lzk1MzU0MTYwNDE1MDIuanBnfDVlZmQ5YTZhNjVhNWU4M2Q0OGZmYTkyZTFkNWE2YTAyZmY0ZjQ2Y2I1NTBjZDIwYTExYWFhMDFhN2VjZjA5N2Q';
	imgLink[1]='index_pi.php?productcode=BR0465';
	imgTitle[1]='ThinkPad1）';
	imgPrice1[1]='价格：￥339.00';
	imgPrice2[1]='会员价格：￥319.00';imgUrl[2]='https://www3.lenovo.com/medias/lenovo-laptop-thinkpad-25-retro-1.jpg?context=bWFzdGVyfHJvb3R8OTg4NzR8aW1hZ2UvanBlZ3xoOWQvaDg2Lzk1MzU0MTYwNDE1MDIuanBnfDVlZmQ5YTZhNjVhNWU4M2Q0OGZmYTkyZTFkNWE2YTAyZmY0ZjQ2Y2I1NTBjZDIwYTExYWFhMDFhN2VjZjA5N2Q';
	imgLink[2]='index_pi.php?productcode=BR0461';
	imgTitle[2]='ThinkPAd2';
	imgPrice1[2]='价格：￥339.00';
	imgPrice2[2]='会员价格：￥319.00';imgUrl[3]='https://www3.lenovo.com/medias/lenovo-laptop-thinkpad-25-retro-1.jpg?context=bWFzdGVyfHJvb3R8OTg4NzR8aW1hZ2UvanBlZ3xoOWQvaDg2Lzk1MzU0MTYwNDE1MDIuanBnfDVlZmQ5YTZhNjVhNWU4M2Q0OGZmYTkyZTFkNWE2YTAyZmY0ZjQ2Y2I1NTBjZDIwYTExYWFhMDFhN2VjZjA5N2Q';
	imgLink[3]='index_pi.php?productcode=GT1176';
	imgTitle[3]='ThinkPad3';
	imgPrice1[3]='价格：￥369.00';
	imgPrice2[3]='会员价格：￥359.00';imgUrl[4]='https://www3.lenovo.com/medias/lenovo-laptop-thinkpad-25-retro-1.jpg?context=bWFzdGVyfHJvb3R8OTg4NzR8aW1hZ2UvanBlZ3xoOWQvaDg2Lzk1MzU0MTYwNDE1MDIuanBnfDVlZmQ5YTZhNjVhNWU4M2Q0OGZmYTkyZTFkNWE2YTAyZmY0ZjQ2Y2I1NTBjZDIwYTExYWFhMDFhN2VjZjA5N2Q';
	imgLink[4]='index_pi.php?productcode=GT0873';
	imgTitle[4]='ThinkPad44';
	imgPrice1[4]='价格：￥459.00';
	imgPrice2[4]='会员价格：￥449.00';var imgPre=new Array();
var j=0;
for (i=1;i<imgUrl.length;i++) {
if( (imgUrl[i]!="") && (imgLink[i]!="") ) {
j++;
} else {
break;
}
}

function playTran(){
	if (document.all)
	imgInit.filters.revealTrans.play();
}

var key=0;

function nextAd(){
	if(adNum<j)adNum++ ;
	else adNum=1;

	if( key==0 ){
		key=1;
	} else if (document.all){
		imgInit.filters.revealTrans.Transition=10;
		imgInit.filters.revealTrans.apply();
 		playTran();
	}
	document.images.imgInit.src=imgUrl[adNum];
	document.images.imgInit.title=imgTitle[adNum];
	img_title.innerHTML='<font color=#FFFFff>'+imgTitle[adNum]+'</font>';
	img_price1.innerHTML=imgPrice1[adNum];
	img_price2.innerHTML=imgPrice2[adNum];
	theTimer=setTimeout("nextAd()", 6000);
}

function goUrl(){
jumpUrl=imgLink[adNum];
jumpTarget='_blank';
if (jumpUrl != ''){
if (jumpTarget != '')
window.open(jumpUrl,jumpTarget);
else
location.href=jumpUrl;
}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/new.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="MM_preloadImages('images/00-2.gif','images/01-2.gif','images/02-2.gif','images/03-2.gif','images/04-2.gif','images/05-2.gif','images/06-2.gif','images/07-2.gif','images/08-2.gif','images/09-2.gif')">
<script src="images/piaochuang.js"></script>
<table align="left" border="0" cellpadding="0" cellspacing="0" width="980">
  <tbody>
    <tr>
      <td><!--显示头部信息程序-->
        <table style="border-collapse: collapse;" border="0" cellpadding="0" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td width="10"></td>
              <td width="135"><a href="thinkshop.cn.htm"></a></td>
              <td width="50"></td>
              <td align="right" valign="bottom"><map name="FPMap_inctop">
                  <area href="point_exg.php.htm" shape="rect" coords="13,2,81,16" target="_blank">
                  <area href="my_thinkshop.php.htm" shape="rect" coords="92, 1, 158, 15" target="_blank">
                  <area href="extend.php.htm" shape="rect" coords="170, 0, 233, 16" target="_blank">
                </map>
               
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td height="61"><table border="0" cellpadding="0" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td width="6"><img src="images/left.gif" height="35" width="6"></td>
              <td align="left" background="images/topbg.gif" valign="middle" width="897"><table align="left" border="0" cellpadding="0" cellspacing="0" width="713">
                  <tbody>
                    <tr class="style1" align="center">
					
                      <td align="left">
                      <%
                      	for(int i=0; i<topCategories.size(); i++) {
                      		Category c = topCategories.get(i);
                      	%>
					  		<a href="" onMouseOver="on_trview(<%=c.getId()%>,'in')">
								<!--<img src="images/00.gif" name="Image0" border="0">-->
								<span style="color:#FFFFFF"><%=c.getName()%></span>
							</a>
						<%
						}
						 %>
					  </td>
					  
                    </tr>
                  </tbody>
                </table></td>
              <td rowspan="2" align="right" width="77"><a href="shoppingpricebuy.php.htm" target="_blank"><img src="images/gouwu_new.gif" border="0" height="61" width="77"></a></td>
            </tr>
            <tr>
              <td colspan="2"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                    <tr>
                      <td rowspan="2" bgcolor="#ededed" width="1"><img src="images/line.gif" height="1" width="1"></td>
                      <td bgcolor="#ffffff" height="1" width="850"><img src="images/line.gif" height="1" width="1"></td>
                    </tr>
                    <tr>
                      <td background="images/topbg2.gif" height="25"><table style="border-collapse: collapse;" class="twoji" border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                          <%
                          for(int i=0; i<topCategories.size(); i++) {
                          	Category parent = topCategories.get(i);
                          	List<Category> childs = getChilds(parent, categories);
                          	
                           %>
	                            <tr id="pma_<%=parent.getId()%>" style="display: none;">
	                              <td style="position: relative; left: 0pt;" height="25" width="100%">
	                              	&nbsp; 
	                              	<%=getChildsStr(childs)%>
								  </td>	                              	
	                            </tr>
                          <%
                          }
                           %> 
                          </tbody>
                        </table></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td bgcolor="#dadce8" height="1"><img src="images/line.gif" height="1" width="1"></td>
    </tr>
    <tr>
      <td><table border="0" cellpadding="0" cellspacing="0" width="980">
          <tbody>
            <tr>
              <td bgcolor="#ededed" width="1"><img src="images/line.gif" height="1" width="1"></td>
              <td background="images/topbg3.gif" height="31" width="123">　</td>
              <td align="center" background="images/topbg3.gif" width="28"><img src="images/zoom.gif" height="31" width="20"></td>
              <script>
function Validator_s(theForm)
{
	if (theForm.searchproducttype1.value=="all" && (theForm.searchname.value=="" || theForm.searchname.value=="please eneter product name") && (theForm.searchcode.value=="" || theForm.searchcode.value=="product number"))
	{
		alert(" enter to search ");
		theForm.searchname.focus();
		return (false);
	}
}
</script>
              <form method="post" action="product_search.php" onSubmit="return Validator_s(this)">
              </form>
              <td background="images/topbg3.gif" valign="middle" width="521"><input name="Bsearch" value="Y" type="hidden">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                    <tr>
                      <td align="left" valign="middle" width="83%"><select name="searchproducttype1" style="font-size: 9pt; color: rgb(85, 85, 85);">
                          <option selected="selected" value="all">--all products--</option>
                          <option value="21">ThinkPad</option>
                          <option value="5">pad accessories</option>
                          <option value="4">pad cover</option>
                          <option value="2">computer sets</option>
                          <option value="20">internet product</option>
                        </select>
                        <input name="searchname" style="font-size: 9pt; color: rgb(85, 85, 85);" onFocus="if(this.value=='please enter product name'){this.value='';}" onBlur="if(this.value==''){this.value='please enter product name';}" value="please enter product name" size="25" maxlength="30" type="text">
                        <input name="searchcode" style="font-size: 9pt; color: rgb(85, 85, 85);" onFocus="if(this.value=='product id'){this.value='';}" onBlur="if(this.value==''){this.value='product id';}" value="product id" size="8" maxlength="6" type="text">
                        <input src="images/go.gif" style="position: relative; top: 2px;" border="0" height="17" type="image" width="20">
                        &nbsp;<a href="index_search.php.htm"><img src="images/gaoji.gif" style="position: relative; top: 3px;" border="0" height="19" width="66"></a> </td>
                      <td align="left" valign="middle" width="17%"></td>
                    </tr>
                  </tbody>
                </table></td>
              <td align="right" background="images/topbg3.gif" width="306">
              	<!--
              	<iframe name="buysta" src="images/buysta.htm" frameborder="0" height="14" scrolling="no" width="100%"></iframe>
              	-->
              	</td>
              <td bgcolor="#ededed" width="1"></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td valign="top" width="190"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td onMouseOver="on_trview('0','')" align="center" height="40"><img src="images/login.gif" height="39" width="190"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                              <td width="176"><img src="images/loginbg1.gif" height="19" width="188"></td>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td align="center" bgcolor="#e2e4f0"><table border="0" cellpadding="0" cellspacing="0" width="95%">
                                  <form method="post" action="Login.jsp">
                                  
                                  <tbody>
                                    <tr>
                                      <td align="left" height="25" width="73%">member card：
                                        <input name="username" size="10" style="font-size: 12px;" type="text"></td>
                                      <td rowspan="2" width="27%">
                                      	<input src="images/down.gif" name="B1" border="0" height="45" type="image" width="45"></td>
                                    </tr>
                                    <tr>
                                      <td align="left">Password：
                                        <input name="password" size="10" style="font-size: 11px;" type="password"></td>
                                    </tr>
                                    <tr>
                                      <td colspan="2" height="30"><p align="center">[<a href="Register.jsp">New Register</a>] &nbsp;[<a href="passwdview.php.htm" onClick="js_callpage(href);return false">forgot password?</a>]</p></td>
                                    </tr>
                                  </tbody>
                                  </form>
                                </table></td>
                            </tr>
                            <tr>
                              <td bgcolor="#aab3d5" height="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                   
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td colspan="3"><img src="images/news.gif" height="32" width="190"></td>
                            </tr>
                            <tr>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                              <td align="center" bgcolor="#e2e4f0"><table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="90%">
                                  <tbody>
                                    <tr>
                                      <td align="left"> ·<a class="twoji" target="_blank" href="http://www.thinkshop.cn/sales_info.php?slid=86"><font color="#cc0000">Happy work<br>
                                        &nbsp;forever(04.20-04.26)</font></a>&nbsp;<img src="images/hot_gif.gif"><br>
                                        ·<a class="twoji" target="_blank" href="http://www.thinkshop.cn/sales_info.php?slid=85">Happy Study！</a><br>
                                        ·<a class="twoji" target="_blank" href="http://www.thinkshop.cn/sales_info.php?slid=84">Happy enjoy</a><br>
                                        ·<a class="twoji" target="_blank" href="http://www.thinkshop.cn/sales_info.php?slid=83">Happy class.</a><br>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="center" height="10" valign="top"><a href="http://www.thinkshop.cn/sales_info.php?ef=list"><img src="images/more.gif" border="0" height="5" width="158"></a></td>
                                    </tr>
                                  </tbody>
                                </table></td>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#e2e4f0" height="8"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#aab3d5" height="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td colspan="3"><img src="images/jingcai.gif" height="32" width="190"></td>
                            </tr>
                            <tr>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                              <td align="center" bgcolor="#e2e4f0"><table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="90%">
                                  <tbody>
                                    <tr>
                                      <td class="twoji" align="left">·<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=85" target="_blank">news1</a><br>
                                        ·<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=84" target="_blank">news2</a><br>
                                        ·<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=83" target="_blank">new3</a><br>
                                        ·<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=82" target="_blank">news4</a><br>
                                        ·<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=81" target="_blank">new5</a><br>
                                        ·<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=79" target="_blank">new5</a><br>
                                        ·<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=78" target="_blank">new6</a><br>
                                        ·<a class="twoji" href="http://www.thinkshop.cn/extend.php?type=file&amp;fileid=77" target="_blank">new7</a><br></td>
                                    </tr>
                                    <tr>
                                      <td align="center" height="10" valign="top"><a href="http://www.thinkshop.cn/extend.php?type=file"><img src="images/more.gif" border="0" height="5" width="158"></a></td>
                                    </tr>
                                  </tbody>
                                </table></td>
                              <td rowspan="3" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#e2e4f0" height="8"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#aab3d5" height="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td bgcolor="#6874bf" valign="top"><input name="qid" value="7" type="hidden">
                        <input value="Y" name="Bsubmit" type="hidden">
                        <table style="border-collapse: collapse;" bordercolorlight="#FF0000" bordercolordark="#FF0000" border="0" bordercolor="#111111" cellpadding="0" cellspacing="0">
                          <script>function windowOpener0(){controlWindow=window.open('','thinkshop','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=100,height=100');}</script>
                          <form action="question.php" method="post" onSubmit="windowOpener0()" target="thinkshop">
                          </form>
                          <tbody>
                            <tr>
                              <td colspan="5"><img src="images/wen_top.gif" height="17" width="190"></td>
                            </tr>
                            <tr>
                              <td rowspan="2" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                              <td rowspan="2" class="wenjuan" width="10">&nbsp;</td>
                              <td class="twoji" bgcolor="#ffffff" height="24" width="168">How's your shopping experience?</td>
                              <td rowspan="2" class="wenjuan" width="10">&nbsp;</td>
                              <td rowspan="2" bgcolor="#aab3d5" width="1"><img src="images/line.gif" height="1" width="1"></td>
                            </tr>
                            <tr>
                              <td bgcolor="#ffffff" height="80"><input value="22" name="qd_serial" type="radio">
                              ok<br>
                                <input value="23" name="qd_serial" type="radio">
                                bad<br>
                                <input value="24" name="qd_serial" type="radio">
                               good<br>
                                &nbsp;&nbsp;&nbsp;
                                <input src="images/tijiao.gif" border="0" height="20" type="images" width="60">
                                <a href="http://www.thinkshop.cn/question.php?qid=7&amp;Bsubmit=Y" onClick="js_callpage(href);return false"></a></td>
                            </tr>
                            <tr>
                              <td colspan="5"><img src="images/wen_up.gif" height="30" width="190"></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                  </tbody>
                </table></td>
              <td onMouseOver="on_trview('0','')" width="10"></td>
              <td valign="top" width="780"><map name="FPMap_brand">
                  <area coords="5, 6, 65, 29" shape="rect" href="https://www.laptopmag.com/images/wp/purch-api/incontent/2017/04/thinkpad-t470-full-670x382.jpg">
                  <area coords="75, 6, 147, 28" shape="rect" href="https://www.laptopmag.com/images/wp/purch-api/incontent/2017/04/thinkpad-t470-full-670x382.jpg">
                  <area coords="157, 7, 187, 29" shape="rect" href="https://www.laptopmag.com/images/wp/purch-api/incontent/2017/04/thinkpad-t470-full-670x382.jpg">
                  <area coords="194, 6, 277, 30" shape="rect" href="https://www.laptopmag.com/images/wp/purch-api/incontent/2017/04/thinkpad-t470-full-670x382.jpg">
                  <area coords="353, 6, 417, 28" shape="rect" href="https://www.laptopmag.com/images/wp/purch-api/incontent/2017/04/thinkpad-t470-full-670x382.jpg">
                  <area coords="423, 5, 499, 29" shape="rect" href="https://www.laptopmag.com/images/wp/purch-api/incontent/2017/04/thinkpad-t470-full-670x382.jpg">
                  <area coords="507, 5, 597, 28" shape="rect" href="https://www.laptopmag.com/images/wp/purch-api/incontent/2017/04/thinkpad-t470-full-670x382.jpg">
                  <area coords="607, 6, 690, 28" shape="rect" href="https://www.laptopmag.com/images/wp/purch-api/incontent/2017/04/thinkpad-t470-full-670x382.jpg">
                  <area coords="696, 4, 774, 29" shape="rect" href="https://www.laptopmag.com/images/wp/purch-api/incontent/2017/04/thinkpad-t470-full-670x382.jpg">
                  <area coords="283, 6, 349, 28" shape="rect" href="https://www.laptopmag.com/images/wp/purch-api/incontent/2017/04/thinkpad-t470-full-670x382.jpg">
                </map>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tbody>
                    <tr>
                      <td onMouseOver="on_trview('0','')" height="8"></td>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td bgcolor="#4352af" width="519"><table style="border-collapse: collapse;" border="0" bordercolor="#111111" cellpadding="0" cellspacing="0" height="266" width="519">
                                  <tbody>
                                    <tr>
                                      <td width="100%"><a style="left: 518px ! important; top: 0px ! important;" class="abp-objtab visible ontop" href="images/index_banner.swf"></a>
                                        </td>
                                    </tr>
                                  </tbody>
                                </table></td>
                              <td valign="top" width="260"><table bgcolor="#4352af" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
                                  <tbody>
                                    <tr>
                                      <td align="right"><img src="images/newp_top.gif" height="38" width="257"></td>
                                    </tr>
                                    <tr>
                                      <td align="center" bgcolor="#4352af" height="98" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="242">
                                          <tbody>
                                            <tr>
                                              <td align="left" height="118" valign="middle"><span class="white">·<a href="http://www.thinkshop.cn/index_pi.php?productcode=GT1325" class="white">coupon 1</a><br>
                                                ·<a href="http://www.thinkshop.cn/index_pi.php?productcode=GT1323" class="white">coupon 2</a><br>
                                                ·<a href="http://www.thinkshop.cn/index_pi.php?productcode=GT1319" class="white">coupon 3</a><br>
                                                ·<a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0472" class="white">coupon 4</a><br>
                                                ·<a href="http://www.thinkshop.cn/index_pi.php?productcode=GT1318" class="white">coupon5</a><br>
                                                ·<a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0470" class="white">coupon6</a><br>
                                                </span></td>
                                            </tr>
                                          </tbody>
                                        </table></td>
                                    </tr>
                                    <tr>
                                      <td align="center" bgcolor="#4352af"><table background="images/242-98.gif" border="0" cellpadding="0" cellspacing="0" width="242">
                                          <tbody>
                                            <tr>
                                              <td align="center" height="98" width="138"><table style="border-collapse: collapse;" border="0" bordercolor="#111111" cellpadding="0" cellspacing="0" width="90%">
                                                  <tbody>
                                                    <tr>
                                                      <td align="left" height="40"><strong><a href="" onClick="return false"><span id="img_title" onClick="javascript:goUrl()"></span></a></strong></td>
                                                    </tr>
                                                    <tr>
                                                      <td align="left"><p class="white"><span id="img_price1"></span><br>
                                                          <span id="img_price2"></span></p></td>
                                                    </tr>
                                                  </tbody>
                                                </table></td>
                                              <td align="center" height="98" valign="middle" width="104"><span onClick="javascript:goUrl()" style=""> <img src="images/br0465.gif" id="imgInit" style="border-color: black; color: rgb(0, 0, 0);" name="imgInit" border="0" height="90" width="75"></span></td>
                                            </tr>
                                            
                                          </tbody>
                                        </table></td>
                                    </tr>
                                    <tr>
                                      <td align="right"><img src="images/newp_up.gif" height="12" width="260"></td>
                                    </tr>
                                  </tbody>
                                </table></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tbody>
                            <tr>
                              <td width="584" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                  <tbody>
                                    <tr>
                                      <td width="10"></td>
                                      <td width="553" valign="top">
									  
									  
									  
									  <table border="0" cellpadding="0" cellspacing="0" width="553">
                                          <tbody>
                                          
                                          <%
                                          for (int i=0; i<topCategories.size(); i += 2) {
                                          	Category first = topCategories.get(i);
                                          	Category second = null;
                                          	if((i+1) < topCategories.size()) {
                                          		second = topCategories.get(i+1);
                                          	}
                                           %>
	                                            <tr>
	                                              <td width="47%">
	                                              	<a href="">
	                                              		<%=first.getName() %>
	                                              	</a>
	                                              </td>
	                                              <td width="7%"></td>
	                                              <td width="46%">
	                                              	<a href="">
	                                              		<%=second == null ? "" : second.getName() %>
	                                              	</a>
	                                              </td>
	                                            </tr>
	                                            <tr>
	                                              <td class="twoji">
	                                              	<%=getChildsStr(getChilds(first, categories))%>
	                                              </td>
	                                              <td>　</td>
	                                              <td class="twoji">
	                                              	<%=second == null ? "" :  getChildsStr(getChilds(second, categories))%>
	                                              </td>
	                                            </tr>
                                           <%
                                           }
                                            %>
                                          </tbody>
                                        </table>
                                      </td>
                                      <td width="20"></td>
                                    </tr>
                                  </tbody>
                              </table></td>
                              <td align="right" valign="top" width="196"><table border="0" cellpadding="0" cellspacing="0" width="196">
                                  <tbody>
                                    <tr>
                                     
                                    </tr>
                                    <tr>
                                      <td align="center" background="images/paihang_bg.gif"><table style="border-collapse: collapse;" border="0" cellpadding="0" cellspacing="0" width="170">
                                          <tbody>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=GT1025" class="twoji" title="product1">product1</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_03.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=GT0855" class="twoji" title="product1">product2</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=GT0856" class="twoji" title="product1">product2</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0235" class="twoji" title="product1">product2</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=GT0794" class="twoji" title="product1">product23</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0010" class="twoji" title="product1">product24</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0236" class="twoji" title="product1">product26</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0402" class="twoji" title="3product1">product27.</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0013" class="twoji" title="product1">product3</a></td>
                                            </tr>
                                            <tr>
                                              <td height="2"><img src="images/xian.gif" height="1" width="170"></td>
                                            </tr>
                                            <tr>
                                              <td height="25"><img src="images/tou_02.gif"><a href="http://www.thinkshop.cn/index_pi.php?productcode=BR0357" class="twoji" title="product1">product5.</a></td>
                                            </tr>
                                          </tbody>
                                        </table></td>
                                    </tr>
                                    <tr>
                                      <td><img src="images/paihang_up.gif" height="17" width="196"></td>
                                    </tr>
                                    <tr>
                                      <td height="5"></td>
                                    </tr>
                                    <tr>
                                      <td><a title="need career" target="_blank" href="http://www.thinkshop.cn/sales/campus"><img src="images/fcthink2.gif" border="0" height="66" width="194"></a></td>
                                    </tr>
                                  </tbody>
                                </table></td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                    <tr>
                      <td height="35" valign="center"><img src="images/pingpai_new.gif" usemap="#FPMap_brand" border="0" height="31" width="780"></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td width="100%"><!--底部INC-->
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td class="white" target="_blank" align="center" bgcolor="#383eb6" height="25"><a href="http://www.thinkshop.cn/extend.php#%C9%CC%B3%C7%B6%A8%CE%BB" class="white" target="_blank">shopping</a> | <a href="http://www.thinkshop.cn/extend.php#%BB%E1%D4%B1%D3%C5%BB%DD" class="white" target="_blank"><font color="#ffffff">member discount</font></a> | <a href="http://www.thinkshop.cn/extend.php#%B6%A9%B5%A5%B4%A6%C0%ED%B9%FD%B3%CC" class="white" target="_blank">order process</a> | <a href="http://www.thinkshop.cn/extend.php#%D3%D0%B9%D8%BB%FD%B7%D6%B6%D2%BB%BB" class="white" target="_blank">credites exchange</a> | <a href="http://www.thinkshop.cn/extend.php#%B3%A3%BC%FB%CE%CA%CC%E2" class="white" target="_blank">questions</a> | <a href="http://www.thinkshop.cn/extend.php#%D0%D1%BF%CD%C0%F1%C8%AF" class="white" target="_blank">Giftcard</a> | <a href="http://www.thinkshop.cn/extend.php#%B9%BA%C2%F2%B7%BD%CA%BD" class="white" target="_blank">pay mehtod</a> | <a href="http://www.thinkshop.cn/extend.php#%BC%DB%B8%F1%CB%B5%C3%F7" class="white" target="_blank">price detail</a> | <a href="http://www.thinkshop.cn/extend.php#%B8%B6%BF%EE%B7%BD%CA%BD" class="white" target="_blank">pay by</a> | <a href="http://www.thinkshop.cn/extend.php#%C5%E4%CB%CD%B7%BD%CA%BD%D3%EB%B7%D1%D3%C3" class="white" target="_blank">deliver fees</a> | <a href="http://www.thinkshop.cn/extend.php#%B1%A3%D0%DE%D3%EB%CD%CB%BB%BB" class="white" target="_blank">maintainance</a> | <a href="http://www.allsmart.com.cn/ThinkPad/bbs/upload/forumdisplay.php?fid=40" class="white" target="_blank">service</a> | <a href="http://www.thinkshop.cn/searchlist.htm" class="white" target="_blank">explore</a> | <a href="http://www.allsmart.com/about_me/about_9.htm" class="white" target="_blank">career</a> <span class="white">| <a href="http://www.allsmart.com/about_me/about_10.htm" class="white" target="_blank">link</a></span></td>
            </tr>
            <tr>
              <td align="center" height="5"><img src="images/line.gif" height="1" width="1"></td>
            </tr>
            <tr>
              <td align="center"><table style="border-collapse: collapse; font-size: 9pt;" border="0" bordercolor="#111111" cellpadding="0" cellspacing="0">
                  <tbody>
                    <tr>
                      <td width="50" height="38" align="left"><a href="http://www.ebworld.com.cn/html/2006-12-11/2006121183850.asp" target="_blank"><img src="images/2006-TOP100.gif" alt="My favorite Website" border="0" height="43" width="44"></a></td>
                      <td><p align="left"><a href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202006053100022" target="_blank"><img src="images/biaoshi.gif" border="0" height="35" width="28"></a></p></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<script src="images/addnum.htm"></script>
</body>
</html>
