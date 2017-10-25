<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("path", path);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>首页</title>

<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css" />
<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="${path}bootstrap/js/bootstrap.js" type="text/javascript"
	charset="utf-8"></script>
<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="${path}css/hmstyle.css" rel="stylesheet" type="text/css" />
<link href="../css/skin.css" rel="stylesheet" type="text/css" />
<script src="${path}js/login.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
		$(function(){
			
			/*分类显示开始*/
			//服装
			$.get("${path}Goodsservlet",{"op":"searchbycloth"},function(mydata,status){
				console.log("类型："+mydata);
				$.each(mydata.data,function(index,data){
					//alert("2");						
					if(index<10){
						 $("#columns").append("<div class='pin1'><a href='${path}Goodsservlet?op=information&goodsid="+data.GOODSID+"'><img src='${path}"+data.GOODSIMG+"' alt='placeholder image' />"
									+"<p class='title fl'>"+data.GOODSNAME+"</p>"
									+"<span class='price fl' style='color: red;'>"
									+"<b>¥</b> <strong>"+data.GOODSPRICE+"</strong></span>"
									+"<span class='number fl'>销量<span>"+data.GOODSSALECOUNT+"</span></span></a></div>");
					}
					
				})
			})
			 //数码
			$.get("${path}Goodsservlet",{"op":"searchbyphone"},function(mydata,status){
				$.each(mydata.data,function(index,data){
					if(index<10){
					$("#columns1").append("<div class='pin2'><img src='"+data.GOODSIMG+"' alt='placeholder image' />"
							+"<p class='title fl'>"+data.GOODSNAME+"</p>"
							+"<span class='price fl' style='color: red;'>"
							+"<b>¥</b> <strong>"+data.GOODSPRICE+"</strong></span>"
							+"<span class='number fl'>销量<span>"+data.GOODSSALECOUNT+"</span></span></div>")
					}
				})
			})
			 //美食
			$.get("${path}Goodsservlet",{"op":"searchbyfoods"},function(mydata,status){
				$.each(mydata.data,function(index,data){
					if(index<10){
					$(".pin3").append("<img src='"+data.GOODSIMG+"' alt='placeholder image' />"
							+"<p class='title fl'>"+data.GOODSNAME+"</p>"
							+"<span class='price fl' style='color: red;'>"
							+"<b>¥</b> <strong>"+data.GOODSPRICE+"</strong></span>"
							+"<span class='number fl'>销量<span>"+data.GOODSSALECOUNT+"</span></span>") 
							$(".pin3").appendTo("#columns2");
					}
				})
			})  
			/*分类显示结束*/
			/*分类侧边栏*/
			//服装分类
	 $(function(){
			$.get("${path}Typeservlet",{"op":"cloth"},function(mydata,status){
				console.log("分类（大中小）："+mydata);
				$.each(mydata.data,function(index,data){
					$(".word1").append("<a class='outer' href=''><span class='inner'><b class='text' name='PARENTSNAME' value='"+data.PARENTSID+"'>"+data.PARENTSNAME+"</b></span></a>");
					})
			})
		
			 //数码分类
			$.get("${path}Typeservlet",{"op":"phone"},function(mydata,status){
				console.log(mydata);
				$.each(mydata.data,function(index,data){
					if(data.PARENTSNAME!=null){
					$(".word2").append("<a class='outer' href=''><span class='inner'><b class='text' name='PARENTSNAME' value='"+data.PARENTSID+"'>"+data.PARENTSNAME+"</b></span></a>");
					}
					})
			})
			//美食分类
			$.get("${path}Typeservlet",{"op":"foods"},function(mydata,status){
				$.each(mydata.data,function(index,data){
					if(data.PARENTSNAME!=null){
					$(".word3").append("<a class='outer' href=''><span class='inner'><b class='text' name='PARENTSNAME' value='"+data.PARENTSID+"'>"+data.PARENTSNAME+"</b></span></a>");
					}
					})
			}) 
		})
		})
			/*最大的分类侧边栏*/
			 //服装内衣
			//查询中类
			$(function(){
				//设置ajax同步
				$.ajaxSetup({
					  async: false
					  });
				$.get("${path}Typeservlet",{"op":"cloth"},function(mydata,status){
				$.each(mydata.data,function(index,data){
				
		$(".sort-side").append("<dl class='dl-sort'><dt><span title='"+data.PARENTSNAME+"' >"+data.PARENTSNAME+"</span></dt>"
								+"<dd class='PARENTSID"+data.PARENTSID+"'></dd></dl>");
		//遍历小类		
		$.get("${path}Typeservlet",{"op":"smallcloth","parentsid":data.PARENTSID},function(mydata,status){
							$.each(mydata.data,function(index,data){
								//alert(data.PARENTSID)
								$(".PARENTSID"+data.PARENTSID).append("<a title='"+data.TYPENAME+"' href='${path}search.jsp'><span>"+data.TYPENAME+"</span></a>");
						})
					});
				})
				})
			})
						
		</script>
		

</head>

<body>
	<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<a href="login.jsp" target="_top" class="welcome" id="please_login">亲，请登录</a> 
						<a href="register.jsp" target="_top" class="welcome" id="please_regid">免费注册</a>
						<a id="wel_user" target="_top" >欢迎，<span id="user" >${sessionScope.user}</span></a>
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
						<a href="${path}GoodsAndOrdersservlet?op=getallbystoreid&storeid=1" target="_top" class="h">免费开店</a>
						<a href="#" target="_top" value="${sessionScope.user }">我的店铺</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="shopcart.html" target="_top"><i
							class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
							id="J_MiniCartNum" class="h">0</strong></a>
					</div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd">
						<a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
					</div>
			</ul>
		</div>

		<!--悬浮搜索框-->

		<div class="nav white">
			<!--<div class="logo"><img src="../images/logo.png" /></div>-->
			<div class="logoBig">
				<li><img src="../images/mylogo.png" /></li>
			</div>

			<div data-toggle="arrowdown" class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form method="post" action="search.html">
					<input id="searchInput" name="index_none_header_sysc" type="text"
						placeholder="搜“蛋糕”试试" " autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
				<div class="other-search">
					<a href="#">女士凉鞋</a> <a href="#">男士T恤</a> <a href="#">连衣裙</a> <a
						href="#">时尚女包</a> <a href="#">女士T恤</a> <a href="#">雪纺衫</a> <a
						href="#">风衣</a> <a href="#">童装</a> <a href="#">运动套装</a> <a
						href="#">打底裤</a> <a href="#">蚊帐</a> <a href="#" class="more-other">更多<i
						class="fa fa-angle-right"></i></a>
				</div>

			</div>
			<!--other-search-->

			<div class="clear"></div>
		</div>
		<div class="banner">

			<!--轮播 -->
			<div class="am-slider am-slider-default scoll" data-am-flexslider
				id="demo-slider-0">
				<ul class="am-slides">
					<li class="banner1"><a href="introduction.html"><img
							src="../images/ad01.jpg" /></a></li>
					<li class="banner2"><a><img src="../images/ad02.jpg" /></a></li>
					<li class="banner3"><a><img src="../images/ad03.jpg" /></a></li>
					<li class="banner4"><a><img src="../images/ad04.jpg" /></a></li>

				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div class="shopNav">
			<div class="slideall">

				<div class="long-title">
					<span class="all-goods">全部分类</span>
				</div>
				<div class="nav-cont">
					<ul>
						<li class="index"><a href="#">首页</a></li>
						<li class="qc"><a href="#">闪购</a></li>
						<li class="qc"><a href="#">限时抢</a></li>
						<li class="qc"><a href="#">团购</a></li>
						<li class="qc last"><a href="#">大包装</a></li>
					</ul>

				</div>

				<!--侧边导航 -->
				<!--
                        	作者：offline
                        	时间：2017-10-13
                        	描述：侧边导航
                        -->
				<div id="nav" class="navfull">
					<div class="area clearfix">
						<div class="category-content" id="guide_2">

							<div class="category">
								<ul class="category-list" id="js_climit_li">
									<li class="appliance js_toggle relative first">
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="../images/001.png"></i><a class="ml-22"
													title="服装" value="1">服装内衣</a>
											</h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side">
															
															

														</div>
														<div class="brand-side">
															<dl class="dl-sort">
																<dt>
																	<span>实力商家</span>
																</dt>
																<dd>
																	<a rel="nofollow" title="呵官方旗舰店" target="_blank"
																		href="#" rel="nofollow"><span class="red">呵官方旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="格瑞旗舰店" target="_blank"
																		href="#" rel="nofollow"><span>格瑞旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="飞彦大厂直供" target="_blank"
																		href="#" rel="nofollow"><span class="red">飞彦大厂直供</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="红e·艾菲妮" target="_blank"
																		href="#" rel="nofollow"><span>红e·艾菲妮</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="本真旗舰店" target="_blank"
																		href="#" rel="nofollow"><span class="red">本真旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="杭派女装批发网" target="_blank"
																		href="#" rel="nofollow"><span class="red">杭派女装批发网</span></a>
																</dd>
															</dl>
														</div>
													</div>
												</div>
											</div>
										</div> <b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="../images/002.png"></i><a class="ml-22"
													title="鞋包配饰" value="2">鞋包配饰</a>
											</h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side1">
															<dl class="dl-sort">
																<dt>
																	<span title="饼干">饼干</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
															</dl>
															<dl class="dl-sort">
																<dt>
																	<span title="薯片">薯片</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
															<dl class="dl-sort">
																<dt>
																	<span title="蛋糕">虾条</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
														</div>
														<div class="brand-side">
															<dl class="dl-sort">
																<dt>
																	<span>实力商家</span>
																</dt>
																<dd>
																	<a rel="nofollow" title="YYKCLOT" target="_blank"
																		href="#" rel="nofollow"><span class="red">YYKCLOT</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="池氏品牌男装" target="_blank"
																		href="#" rel="nofollow"><span class="red">池氏品牌男装</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="男装日志" target="_blank" href="#"
																		rel="nofollow"><span>男装日志</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="索比诺官方旗舰店" target="_blank"
																		href="#" rel="nofollow"><span>索比诺官方旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="onTTno傲徒" target="_blank"
																		href="#" rel="nofollow"><span class="red">onTTno傲徒</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="玛狮路男装旗舰店" target="_blank"
																		href="#" rel="nofollow"><span>玛狮路男装旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="劳威特品牌男装" target="_blank"
																		href="#" rel="nofollow"><span>劳威特品牌男装</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="卡斯郎世家批发城" target="_blank"
																		href="#" rel="nofollow"><span class="red">卡斯郎世家批发城</span></a>
																</dd>
															</dl>
														</div>
													</div>
												</div>
											</div>
										</div> <b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="../images/005.png"></i><a class="ml-22"
													title="手机数码" value="3">手机数码</a>
											</h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side2">
															<dl class="dl-sort">
																<dt>
																	<span title="猪肉脯">猪肉脯</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
															</dl>
															<dl class="dl-sort">
																<dt>
																	<span title="牛肉丝">牛肉丝</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
															</dl>
															<dl class="dl-sort">
																<dt>
																	<span title="小香肠">小香肠</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
														</div>
														<div class="brand-side">
															<dl class="dl-sort">
																<dt>
																	<span>实力商家</span>
																</dt>
																<dd>
																	<a rel="nofollow" title="花颜巧语 " target="_blank"
																		href="#" rel="nofollow"><span class="red">花颜巧语
																	</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="糖衣小屋" target="_blank" href="#"
																		rel="nofollow"><span>糖衣小屋</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="卡拉迪克  " target="_blank"
																		href="#" rel="nofollow"><span class="red">卡拉迪克
																	</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="暖春童话 " target="_blank"
																		href="#" rel="nofollow"><span>暖春童话 </span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="华盛童装批发行 " target="_blank"
																		href="#" rel="nofollow"><span>华盛童装批发行 </span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="奈仕华童装旗舰店" target="_blank"
																		href="#" rel="nofollow"><span>奈仕华童装旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="斑蒂尼BONDYNI" target="_blank"
																		href="#" rel="nofollow"><span class="red">斑蒂尼BONDYNI</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="猫儿朵朵 " target="_blank"
																		href="#" rel="nofollow"><span>猫儿朵朵 </span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="童衣阁" target="_blank" href="#"
																		rel="nofollow"><span class="red">童衣阁</span></a>
																</dd>
															</dl>
														</div>
													</div>
												</div>
											</div>
										</div> <b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="../images/006.png"></i><a class="ml-22"
													title="家电办公" value="4">家电办公</a>
											</h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side3">
															<dl class="dl-sort">
																<dt>
																	<span title="豆干">豆干</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
															<dl class="dl-sort">
																<dt>
																	<span title="干笋">干笋</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
															<dl class="dl-sort">
																<dt>
																	<span title="鸭脖">鸭脖</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
														</div>
														<div class="brand-side">
															<dl class="dl-sort">
																<dt>
																	<span>实力商家</span>
																</dt>
																<dd>
																	<a rel="nofollow" title="歌芙品牌旗舰店" target="_blank"
																		href="#" rel="nofollow"><span class="red">歌芙品牌旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="爱丝蓝内衣厂" target="_blank"
																		href="#" rel="nofollow"><span>爱丝蓝内衣厂</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="香港优蓓尔防辐射" target="_blank"
																		href="#" rel="nofollow"><span>香港优蓓尔防辐射</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="蓉莉娜内衣批发" target="_blank"
																		href="#" rel="nofollow"><span>蓉莉娜内衣批发</span></a>
																</dd>
															</dl>
														</div>
													</div>
												</div>
											</div>
										</div> <b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="../images/010.png"></i><a class="ml-22"
													title="家居建材" value="5">家居建材</a>
											</h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side4">
															<dl class="dl-sort">
																<dt>
																	<span title="蛋糕">坚果</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
															<dl class="dl-sort">
																<dt>
																	<span title="蛋糕">锅巴</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
														</div>
														<div class="brand-side">
															<dl class="dl-sort">
																<dt>
																	<span>实力商家</span>
																</dt>
																<dd>
																	<a rel="nofollow" title="呵呵嘿官方旗舰店" target="_blank"
																		href="#" rel="nofollow"><span class="red">呵呵嘿官方旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="格瑞旗舰店" target="_blank"
																		href="#" rel="nofollow"><span>格瑞旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="飞彦大厂直供" target="_blank"
																		href="#" rel="nofollow"><span class="red">飞彦大厂直供</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="红e·艾菲妮" target="_blank"
																		href="#" rel="nofollow"><span>红e·艾菲妮</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="本真旗舰店" target="_blank"
																		href="#" rel="nofollow"><span class="red">本真旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="杭派女装批发网" target="_blank"
																		href="#" rel="nofollow"><span class="red">杭派女装批发网</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="华伊阁旗舰店" target="_blank"
																		href="#" rel="nofollow"><span>华伊阁旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="独家折扣旗舰店" target="_blank"
																		href="#" rel="nofollow"><span>独家折扣旗舰店</span></a>
																</dd>
															</dl>
														</div>
													</div>
												</div>
											</div>
										</div> <b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="../images/011.png"></i><a class="ml-22"
													title="美食特产" value="6">美食特产</a>
											</h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side5">
															<dl class="dl-sort">
																<dt>
																	<span title="糖果">糖果</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
															<dl class="dl-sort">
																<dt>
																	<span title="蜜饯">蜜饯</span>
																</dt>
																<dd>
																	<a title="猕猴桃干" href="#"><span>猕猴桃干</span></a>
																</dd>
																<dd>
																	<a title="糖樱桃" href="#"><span>糖樱桃</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
														</div>
														<div class="brand-side">
															<dl class="dl-sort">
																<dt>
																	<span>实力商家</span>
																</dt>
																<dd>
																	<a rel="nofollow" title="YYKCLOT" target="_blank"
																		href="#" rel="nofollow"><span class="red">YYKCLOT</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="池氏品牌男装" target="_blank"
																		href="#" rel="nofollow"><span class="red">池氏品牌男装</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="男装日志" target="_blank" href="#"
																		rel="nofollow"><span>男装日志</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="索比诺官方旗舰店" target="_blank"
																		href="#" rel="nofollow"><span>索比诺官方旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="onTTno傲徒" target="_blank"
																		href="#" rel="nofollow"><span class="red">onTTno傲徒</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="卡斯郎世家批发城" target="_blank"
																		href="#" rel="nofollow"><span class="red">卡斯郎世家批发城</span></a>
																</dd>
															</dl>
														</div>
													</div>
												</div>
											</div>
										</div> <b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="../images/004.png"></i><a class="ml-22"
													title="珠宝手表" value="7">珠宝手表</a>
											</h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side6">
															<dl class="dl-sort">
																<dt>
																	<span title="蛋糕">巧克力</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
															<dl class="dl-sort">
																<dt>
																	<span title="蛋糕">果冻</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
														</div>
														<div class="brand-side">
															<dl class="dl-sort">
																<dt>
																	<span>实力商家</span>
																</dt>
																<dd>
																	<a rel="nofollow" title="花颜巧语 " target="_blank"
																		href="#" rel="nofollow"><span class="red">花颜巧语
																	</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="糖衣小屋" target="_blank" href="#"
																		rel="nofollow"><span>糖衣小屋</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="卡拉迪克  " target="_blank"
																		href="#" rel="nofollow"><span class="red">卡拉迪克
																	</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="暖春童话 " target="_blank"
																		href="#" rel="nofollow"><span>暖春童话 </span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="华盛童装批发行 " target="_blank"
																		href="#" rel="nofollow"><span>华盛童装批发行 </span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="奈仕华童装旗舰店" target="_blank"
																		href="#" rel="nofollow"><span>奈仕华童装旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="斑蒂尼BONDYNI" target="_blank"
																		href="#" rel="nofollow"><span class="red">斑蒂尼BONDYNI</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="童衣阁" target="_blank" href="#"
																		rel="nofollow"><span class="red">童衣阁</span></a>
																</dd>
															</dl>
														</div>
													</div>
												</div>
											</div>
										</div> <b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="../images/007.png"></i><a class="ml-22"
													title="护肤彩妆" value="8">护肤彩妆</a>
											</h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side7">
															<dl class="dl-sort">
																<dt>
																	<span title="海带丝">海带丝</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
															<dl class="dl-sort">
																<dt>
																	<span title="小鱼干">小鱼干</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
															</dl>
															<dl class="dl-sort">
																<dt>
																	<span title="鱿鱼丝">鱿鱼丝</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
															</dl>
														</div>
														<div class="brand-side">
															<dl class="dl-sort">
																<dt>
																	<span>实力商家</span>
																</dt>
																<dd>
																	<a rel="nofollow" title="歌芙品牌旗舰店" target="_blank"
																		href="#" rel="nofollow"><span class="red">歌芙品牌旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="爱丝蓝内衣厂" target="_blank"
																		href="#" rel="nofollow"><span>爱丝蓝内衣厂</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="炫点服饰" target="_blank" href="#"
																		rel="nofollow"><span>炫点服饰</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="雪茵美内衣厂批发" target="_blank"
																		href="#" rel="nofollow"><span>雪茵美内衣厂批发</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="金钻夫人" target="_blank" href="#"
																		rel="nofollow"><span>金钻夫人</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="伊美莎内衣" target="_blank"
																		href="#" rel="nofollow"><span class="red">伊美莎内衣</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="粉客内衣旗舰店" target="_blank"
																		href="#" rel="nofollow"><span>粉客内衣旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="泽芳行旗舰店" target="_blank"
																		href="#" rel="nofollow"><span>泽芳行旗舰店</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="彩婷" target="_blank" href="#"
																		rel="nofollow"><span class="red">彩婷</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="黛兰希" target="_blank" href="#"
																		rel="nofollow"><span>黛兰希</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="香港优蓓尔防辐射" target="_blank"
																		href="#" rel="nofollow"><span>香港优蓓尔防辐射</span></a>
																</dd>
																<dd>
																	<a rel="nofollow" title="蓉莉娜内衣批发" target="_blank"
																		href="#" rel="nofollow"><span>蓉莉娜内衣批发</span></a>
																</dd>
															</dl>
														</div>
													</div>
												</div>
											</div>
										</div> <b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative">
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="../images/009.png"></i><a class="ml-22"
													title="家纺居家" value="9">家纺居家</a>
											</h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side8">
															<dl class="dl-sort">
																<dt>
																	<span title="蛋糕">蛋糕</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
															<dl class="dl-sort">
																<dt>
																	<span title="蛋糕">点心</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
														</div>
														<div class="brand-side">
															<dl class="dl-sort">
																<dt>
																	<span>实力商家</span>
																</dt>
																<dd>
																	<a title="今生只围你" target="_blank" href="#"
																		rel="nofollow"><span>今生只围你</span></a>
																</dd>
																<dd>
																	<a title="忆佳人" target="_blank" href="#" rel="nofollow"><span
																		class="red">忆佳人</span></a>
																</dd>
																<dd>
																	<a title="斐洱普斯" target="_blank" href="#" rel="nofollow"><span
																		class="red">斐洱普斯</span></a>
																</dd>
																<dd>
																	<a title="聚百坊" target="_blank" href="#" rel="nofollow"><span
																		class="red">聚百坊</span></a>
																</dd>
																<dd>
																	<a title="朵朵棉织直营店" target="_blank" href="#"
																		rel="nofollow"><span>朵朵棉织直营店</span></a>
																</dd>
															</dl>
														</div>
													</div>
												</div>
											</div>
										</div> <b class="arrow"></b>
									</li>
									<li class="appliance js_toggle relative last">
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="../images/012.png"></i><a class="ml-22"
													title="日用百货" value="10">日用百货</a>
											</h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side9">
															<dl class="dl-sort">
																<dt>
																	<span title="大包装">大包装</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
															<dl class="dl-sort">
																<dt>
																	<span title="两件套">两件套</span>
																</dt>
																<dd>
																	<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
																</dd>
																<dd>
																	<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
																</dd>
																<dd>
																	<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
																</dd>
																<dd>
																	<a title="软面包" href="#"><span>软面包</span></a>
																</dd>
																<dd>
																	<a title="马卡龙" href="#"><span>马卡龙</span></a>
																</dd>
																<dd>
																	<a title="千层饼" href="#"><span>千层饼</span></a>
																</dd>
																<dd>
																	<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
																</dd>
																<dd>
																	<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
																</dd>
																<dd>
																	<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
																</dd>
															</dl>
														</div>
														<div class="brand-side">
															<dl class="dl-sort">
																<dt>
																	<span>实力商家</span>
																</dt>
																<dd>
																	<a title="琳琅鞋业" target="_blank" href="#" rel="nofollow"><span>琳琅鞋业</span></a>
																</dd>
																<dd>
																	<a title="宏利鞋业" target="_blank" href="#" rel="nofollow"><span>宏利鞋业</span></a>
																</dd>
																<dd>
																	<a title="比爱靓点鞋业" target="_blank" href="#"
																		rel="nofollow"><span>比爱靓点鞋业</span></a>
																</dd>
																<dd>
																	<a title="浪人怪怪" target="_blank" href="#" rel="nofollow"><span>浪人怪怪</span></a>
																</dd>
															</dl>
														</div>
													</div>
												</div>
											</div>
										</div>

									</li>
								</ul>
							</div>
						</div>

					</div>
				</div>








				<!--轮播-->

				<script type="text/javascript">
							(function() {
								$('.am-slider').flexslider();
							});
							$(document).ready(function() {
								$("li").hover(function() {
									$(".category-content .category-list li.first .menu-in").css("display", "none");
									$(".category-content .category-list li.first").removeClass("hover");
									$(this).addClass("hover");
									$(this).children("div.menu-in").css("display", "block")
								}, function() {
									$(this).removeClass("hover")
									$(this).children("div.menu-in").css("display", "none")
								});
							})
						</script>



				<!--小导航 -->
				<div class="am-g am-g-fixed smallnav">
					<div class="am-u-sm-3">
						<a href="sort.html"><img src="../images/navsmall.jpg" />
							<div class="title">商品分类</div> </a>
					</div>
					<div class="am-u-sm-3">
						<a href="#"><img src="../images/huismall.jpg" />
							<div class="title">大聚惠</div> </a>
					</div>
					<div class="am-u-sm-3">
						<a href="#"><img src="../images/mansmall.jpg" />
							<div class="title">个人中心</div> </a>
					</div>
					<div class="am-u-sm-3">
						<a href="#"><img src="../images/moneysmall.jpg" />
							<div class="title">投资理财</div> </a>
					</div>
				</div>

				<!--走马灯 -->

				<div class="marqueen">
					<span class="marqueen-title">商城头条</span>
					<div class="demo">

						<ul>
							<li class="title-first"><a target="_blank" href="#"> <img
									src="../images/TJ2.jpg"></img> <span>[特惠]</span>商城爆品1分秒
							</a></li>
							<li class="title-first"><a target="_blank" href="#"> <span>[公告]</span>商城与广州市签署战略合作协议
									<img src="../images/TJ.jpg"></img>
									<p>XXXXXXXXXXXXXXXXXX</p>
							</a></li>

							<div class="mod-vip">
								<div class="m-baseinfo">
									<a href="../person/index.html"> <img
										src="../images/getAvatar.do.jpg">
									</a> <em> Hi,<span class="s-name">小叮当</span> <a href="#"><p>点击更多优惠活动</p></a>
									</em>
								</div>
								<div class="member-logout">
									<a class="am-btn-warning btn" href="login.html">登录</a> <a
										class="am-btn-warning btn" href="register.html">注册</a>
								</div>
								<div class="member-login">
									<a href="#"><strong>0</strong>待收货</a> <a href="#"><strong>0</strong>待发货</a>
									<a href="#"><strong>0</strong>待付款</a> <a href="#"><strong>0</strong>待评价</a>
								</div>
								<div class="clear"></div>
							</div>

							<li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>
							<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
							<li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券
									买1送1！</a></li>

						</ul>
						<div class="advTip">
							<img src="../images/advTip.jpg" />
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>
		</div>
		<div class="shopMainbg">
			<div class="shopMain" id="shopmain">

				<!--今日推荐 -->

				<div class="am-g am-g-fixed recommendation">
					<div class="clock am-u-sm-3"">
						<div class="info ">
							<h3 id="one">囤货小当家</h3>
							<h5 id="oneo">会囤会当家</h5>
						</div>
						<div class="recommendationMain one">
							<a href="introduction.html"><img src="../images/zhuye1.png"></img></a>
						</div>
					</div>
					<div class="am-u-sm-4 am-u-lg-3 ">
						<div class="info ">
							<h3 id="two">吃货的后裔</h3>
							<h5 id="twot">翻滚吧美食君</h5>
						</div>
						<div class="recommendationMain one">
							<a href="introduction.html"><img src="../images/zhuye.png"></img></a>
						</div>
					</div>
					<div class="am-u-sm-4 am-u-lg-3 ">
						<div class="info ">
							<h3 id="three">男神style</h3>
							<h5 id="threet">妹纸收割机</h5>


						</div>
						<div class="recommendationMain one">
							<a><img src="../images/zhuye4.png"></img></a>
						</div>
					</div>
					<div class="am-u-sm-4 am-u-lg-3 ">
						<div class="info ">
							<h3 id="four">萌宠大作战</h3>
							<h5 id="fourf">最温暖的陪伴</h5>
						</div>
						<div class="recommendationMain three">
							<a><img src="../images/zhuye2.png"></img></a>
						</div>
					</div>

				</div>
				<div class="clear "></div>
			
				<div class="accordion">
					<div class="shopTitle ">
						<h4 id="">常驻商家</h4>
						<h3>发现大家都爱的店</h3>
						<!-- <span class="more "> <a href="# ">全部商家<i
								class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
						</span> -->
					</div>
					<ul>
						<li>
							<div>
								<a href="cake_index.html">
									<h2>店铺名字</h2>
									<p>店铺描述</p>
								</a>
							</div>
						</li>
						<li>
							<div>
								<a href="#">
									<h2>店铺名字</h2>
									<p>店铺描述</p>
								</a>
							</div>
						</li>
						<li>
							<div>
								<a href="#">
									<h2>店铺名字</h2>
									<p>店铺描述</p>
								</a>
							</div>
						</li>
						<li>
							<div>
								<a href="#">
									<h2>店铺名字</h2>
									<p>店铺描述</p>
								</a>
							</div>
						</li>
						<li>
							<div>
								<a href="#">
									<h2>店铺名字</h2>
									<p>店铺描述</p>
								</a>
							</div>
						</li>
						<li>
							<div>
								<a href="#">
									<h2>店铺名字</h2>
									<p>店铺描述</p>
								</a>
							</div>
						</li>
						<li>
							<div>
								<a href="#">
									<h2>店铺名字</h2>
									<p>店铺描述</p>
								</a>
							</div>
						</li>

					</ul>
				</div>
				<div class="clear "></div>


				<div id="f1">
					<!--服装-->

					<div class="am-container ">
						<div class="shopTitle ">
							<h4 class="flour-class" value="cloth">服装</h4>
							<h3>一样的流派，不一样的做派。</h3>

							<span class="more "> <a href="# ">更多美衣<i
									class="am-icon-angle-right" style="padding-left: 10px;"></i></a>
							</span>
						</div>
					</div>

					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							<div class="word1">
								
							</div>
							<img src="../images/floor1.png" />

							<div class="triangle-topright"></div>
						</div>

						<div id="wrapper">
							<div id="columns">

							


							</div>
						</div>

						 <div id="f2">
					<!-- 数码 -->
					
					 <div class="am-container ">
						<div class="shopTitle ">
							<h4 class="flour-class" value="phone">数码</h4>
							<h3>数码万千，只为你淘。</h3>
							
							<span class="more ">
                    <a href="# ">更多精品<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					</div>
					
					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							<div class="word2">
							
							</div>
							<a href="# ">
								
                                  <img src="../images/floor2.png" />								
							</a>
							<div class="triangle-topright"></div>						
						</div>
						
<div id="wrapper">
<div id="columns1">


</div>
</div>
 <div id="f3">
					<!--美食  -->
					
					<div class="am-container ">
						<div class="shopTitle ">
							<h4 class="flour-class" value="foods">美食</h4>
							<h3>挡不住的诱惑。</h3>
							
							<span class="more ">
                    <a href="# ">更多美食<i class="am-icon-angle-right" style="padding-left:10px ;" ></i></a>
                        </span>
						</div>
					</div>
					
					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							<div class="word3">
														
							</div>
							<a href="# ">
								
                                  <img src="../images/floor3.png" />								
							</a>
							<div class="triangle-topright"></div>						
						</div>
						
<div id="wrapper">
<div id="columns2">




</div>
</div>  
</div>



					<!--//footer-->
					<div class="footer-bottom">
						<div class="container">
							<p class="footer-copyright">
								Copyright &copy; 2000-2017 HARDEN国际有限公司，保留一切权利。｜ <a
									class="footer-beiAn" target="_blank"
									href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010502032052">京公网安备
									11010502032052号</a>关于我们 |联系我们 |加入我们 |用户帮助 |微店联盟 |隐私声明
							</p>
						</div>
						<div class="footer-i footer-mt15">
							<p>出版物经营许可证 ｜ 互联网药品信息服务资格证书编号(京) - 非经营性-2015-0087</p>
						</div>
						<div class="footer-check">
							<p class="footer-check-info check-info-addr">
								<span>公司名称：微go商城平台有限公司</span>&nbsp;&nbsp;&nbsp;&nbsp; <span>地址：厦门市思明区某海海底B座十层</span>&nbsp;&nbsp;&nbsp;&nbsp;
								<span>电话：0250-2501250</span>
							</p>
							<div class="footer-clr"></div>
						</div>
					</div>
					<!-- //footer -->

				</div>
			</div>
			<!--引导 -->
			<div class="navCir">
				<li class="active"><a href="home.html"><i
						class="am-icon-home "></i>首页</a></li>
				<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
				<li><a href="shopcart.html"><i
						class="am-icon-shopping-basket"></i>购物车</a></li>
				<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>
			</div>


			<!--菜单 -->
			<div class=tip>
				<div id="sidebar">
					<div id="wrap">
						<div id="prof" class="item ">
							<a href="# "> <span class="setting "></span>
							</a>
							<div class="ibar_login_box status_login ">
								<div class="avatar_box ">
									<p class="avatar_imgbox ">
										<img src="../images/no-img_mid_.jpg " />
									</p>
									<ul class="user_info ">
										<li>用户名sl1903</li>
										<li>级&nbsp;别普通会员</li>
									</ul>
								</div>
								<div class="login_btnbox ">
									<a href="# " class="login_order ">我的订单</a> <a href="# "
										class="login_favorite ">我的收藏</a>
								</div>
								<i class="icon_arrow_white "></i>
							</div>

						</div>
						<div id="shopCart " class="item ">
							<a href="# "> <span class="message "></span>
							</a>
							<p>购物车</p>
							<p class="cart_num ">0</p>
						</div>
						<div id="asset " class="item ">
							<a href="# "> <span class="view "></span>
							</a>
							<div class="mp_tooltip ">
								我的资产 <i class="icon_arrow_right_black "></i>
							</div>
						</div>

						<div id="foot " class="item ">
							<a href="# "> <span class="zuji "></span>
							</a>
							<div class="mp_tooltip ">
								我的足迹 <i class="icon_arrow_right_black "></i>
							</div>
						</div>

						<div id="brand " class="item ">
							<a href="#"> <span class="wdsc "><img
									src="../images/wdsc.png " /></span>
							</a>
							<div class="mp_tooltip ">
								我的收藏 <i class="icon_arrow_right_black "></i>
							</div>
						</div>

						<div id="broadcast " class="item ">
							<a href="# "> <span class="chongzhi "><img
									src="../images/chongzhi.png " /></span>
							</a>
							<div class="mp_tooltip ">
								我要充值 <i class="icon_arrow_right_black "></i>
							</div>
						</div>

						<div class="quick_toggle ">
							<li class="qtitem "><a href="# "><span class="kfzx "></span></a>
								<div class="mp_tooltip ">
									客服中心<i class="icon_arrow_right_black "></i>
								</div></li>
							<!--二维码 -->
							<li class="qtitem "><a href="#none "><span
									class="mpbtn_qrcode "></span></a>
								<div class="mp_qrcode " style="display: none;">
									<img src="../images/weixin_code_145.png " /><i
										class="icon_arrow_white "></i>
								</div></li>
							<li class="qtitem "><a href="#top " class="return_top "><span
									class="top "></span></a></li>
						</div>

						<!--回到顶部 -->
						<div id="quick_links_pop " class="quick_links_pop hide "></div>

					</div>

				</div>
				<div id="prof-content " class="nav-content ">
					<div class="nav-con-close ">
						<i class="am-icon-angle-right am-icon-fw "></i>
					</div>
					<div>我</div>
				</div>
				<div id="shopCart-content " class="nav-content ">
					<div class="nav-con-close ">
						<i class="am-icon-angle-right am-icon-fw "></i>
					</div>
					<div>购物车</div>
				</div>
				<div id="asset-content " class="nav-content ">
					<div class="nav-con-close ">
						<i class="am-icon-angle-right am-icon-fw "></i>
					</div>
					<div>资产</div>

					<div class="ia-head-list ">
						<a href="# " target="_blank " class="pl ">
							<div class="num ">0</div>
							<div class="text ">优惠券</div>
						</a> <a href="# " target="_blank " class="pl ">
							<div class="num ">0</div>
							<div class="text ">红包</div>
						</a> <a href="# " target="_blank " class="pl money ">
							<div class="num ">￥0</div>
							<div class="text ">余额</div>
						</a>
					</div>

				</div>
				<div id="foot-content " class="nav-content ">
					<div class="nav-con-close ">
						<i class="am-icon-angle-right am-icon-fw "></i>
					</div>
					<div>足迹</div>
				</div>
				<div id="brand-content " class="nav-content ">
					<div class="nav-con-close ">
						<i class="am-icon-angle-right am-icon-fw "></i>
					</div>
					<div>收藏</div>
				</div>
				<div id="broadcast-content " class="nav-content ">
					<div class="nav-con-close ">
						<i class="am-icon-angle-right am-icon-fw "></i>
					</div>
					<div>充值</div>
				</div>
			</div>
			<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
			<script type="text/javascript " src="../basic/js/quick_links.js "></script>
</body>

</html>