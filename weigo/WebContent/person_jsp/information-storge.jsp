<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.etc.weigo.service.StoreService"%>
<%@page import="com.etc.weigo.entity.Store"%>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("path", path);
%>


<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人资料</title>

		<link href="${path}AmazeUI-2.4.2/assets/css/admin2.css" rel="stylesheet" type="text/css">
		<link href="${path}AmazeUI-2.4.2/assets/css/amazeui2.css" rel="stylesheet" type="text/css">

		<link href="${path}css/personal2.css" rel="stylesheet" type="text/css">
		<link href="${path}css/infstyle2.css" rel="stylesheet" type="text/css">
		<script src="${path}AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${path}AmazeUI-2.4.2/assets/js/amazeui.js"></script>	
		<script type="text/javascript">
		
		
		</script>
		
		
				
	</head>
	<!--获取店铺信息-->
	<% List<Store> lt= new ArrayList<Store>();
	StoreService ss= new StoreService();
	int storeid=1;
	lt= ss.getstoreinfo(storeid);
	
	%>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<a href="#" target="_top" class="h">亲，请登录</a>
									<a href="#" target="_top">免费注册</a>
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
						</ul>
						</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="two/images/mylogo.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form>
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">店铺资料</strong> / <small>store&nbsp;information</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">
								<input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
								<img class="am-circle am-img-thumbnail" style="margin-left:270px;" src="${path}/images/dianpu1.png" alt="" />
							</div>
                                   <!--遍历输出店铺的信息-->
							<p class="am-form-help">我的店铺</p>
                             <a:if test="<%=(lt!=null)%>">
				       	    <a:forEach  items="<%=lt%>"  var="store">
							<div class="info-m" style="margin-left:350px;">
								<div><b>店铺名称：<i>${store.STORENAME}</i></b></div>
								<div class="vip">
                                      <span></span><a href="#">会员专享</a>
								</div>
							</div>
						</div>

						<!--个人信息 -->
						<div class="info-main">
						
							<form class="am-form am-form-horizontal" method="post" action="${path}StoreServlet?op=updStore" >

								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">店铺名字</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" name="storename" value="${store.STORENAME}">
                                          <small>店铺名称不能超过10个汉字</small>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">店铺积分</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" name="storescore" readonly="true" value="${store.STORESCORE}">
                                         
									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">店铺介绍</label>
									
										<div class="am-form-content">
												<textarea class="" rows="3" id="user-intro" name="storeintro" >${store.STOREINTRO}</textarea>
												
											</div>
							
								</div>

								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">店铺联系</label>
									<div class="am-form-content">
										<input id="user-phone" placeholder="手机号" type="tel" name="storephone" value="${store.STOREPHONE}">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">店铺点击量</label>
									<div class="am-form-content">
										<input id="user-click" placeholder="1000" readonly="true" name="storeclick" type="text" value="${store.STORECLICK}">

									</div>
								</div>
								
								
								 </a:forEach>
							</a:if>
								
								<div class="info-btn">
								<input type="submit" value="保存修改" class="am-btn am-btn-danger" />
									
								</div>

							</form>
						</div>

					</div>

				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
						</p>
					</div>
				</div>
			</div>

			<aside class="menu">
					<ul>
					<li class="person active">
						<a href="${path}person_jsp/index-storge.jsp"><i class="am-icon-user"></i>店铺中心</a>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的店铺</p>
						<ul>
							<li class="active"><a href="${path}person_jsp/information-storge.jsp">店铺管理</a></li>
							<li> <a href="${path}person_jsp/goodsmanage.jsp">商品管理</a></li>
							
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>店铺交易</p>
						<ul>
							<li><a href="${path}person_jsp/order-sale.jsp">订单管理</a></li>
							
						</ul>
					</li>
				</ul>
			</aside>
		</div>

	</body>

</html>