<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>首页</title>

<!-- <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css" />

<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="../css/hmstyle.css" rel="stylesheet" type="text/css" />
<link href="../css/skin.css" rel="stylesheet" type="text/css" />
<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script> -->

<script src="${path}js/login.js"></script>

</head>

<body>
		<!--顶部导航条 -->
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<a href="login.jsp" target="_top" class="welcome" id="please_login">亲，请登录</a> 
						<a href="register.jsp" target="_top" class="welcome" id="please_regid">免费注册</a> 
						<a id="wel_user" target="_top">欢迎，<span id="user">${sessionScope.user}</span></a>
					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="home.jsp" target="_top" class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage shop">
					<div class="menu-hd">
						<!-- 跳转到开店页面 -->
						<a href="${path}home_jsp/apply1.jsp" target="_top" id="openStore">免费开店</a> 
						<a href="${path}person_jsp/information-sale.jsp" target="_top" id="myStore" value="${sessionScope.user}">我的店铺</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="#" target="_top" id="personcCenter">
							<i class="am-icon-user am-icon-fw"></i>个人中心
						</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="#" target="_top">
							<i class="am-icon-shopping-cart  am-icon-fw"> </i>
							<span>购物车</span>
							<strong id="J_MiniCartNum" class="h">${sessionScope.buyCount}</strong>
						</a>
					</div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd">
						<a href="#" target="_top" id="myWallect">
							<i class="am-icon-heart am-icon-fw"></i>
							<span>我的钱包</span>
						</a>
					</div>
				</div>
			</ul>
</body>

</html>