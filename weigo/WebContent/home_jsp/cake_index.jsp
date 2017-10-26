<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Yummy Home</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="${path}css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="${path}css/style3.css" type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" href="${path}css/amazeui.css" />
<!-- js -->
<script src="${path}js/jquery.min.js"></script>
<script type="text/javascript" src="${path}js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->	
<!-- cart -->
<script src="${path}js/simpleCart.min.js"> </script>
<!-- cart -->

<!-- 登录 -->
<script src="${path}js/login.js"></script>

</head>

<script type="text/javascript">
	/* 加载头部导航栏  底部版权信息 */
	$(function(){
		$(".am-container").load("myHome.jsp");
	});
</script>

<body>
	<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container">
						<!-- <div class="">
							<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<a href="#" target="_top" class="h">亲，请登录</a>
									<a href="#" target="_top">免费注册</a>
								</div>
							</div>
						</ul>
						</div>
						
						<div class="">
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
						</div> -->
					</div>
						</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="row">
								<div class="col-md-4">
									<div class="logoBig">
										<li><img src="${path}images/logod1.png"/></li>
									</div>
								</div>
								
								<div class="col-lg-8">
									<div class="search-bar pr">
										<a name="index_none_header_sysc" href="#"></a>
										<form>
											<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
											<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="clear"></div>
				</div>
			</article>
		</header>
	<!--header-->
	<hr style="border-top:2px solid #F03726; margin-top: 0px;"/>
	<div class="header">
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
				<!--navbar-header-->
				<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					
					<ul class="nav navbar-nav">
						<li class="has-dropdown"><h1 class="navbar-brand"><a id="storeinfo">Yummy</a></h1></li>
						<li><a href="cake_index.html" class="active">首页</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">生日<b class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-4">
								<div class="row">
									<div class="col-sm-3">
										<h4>按关系</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="cake_products.html">朋友</a></li>
											<li><a class="list" href="cake_products.html">恋人</a></li>
											<li><a class="list" href="cake_products.html">姐妹</a></li>
											<li><a class="list" href="cake_products.html">兄弟</a></li>
											<li><a class="list" href="cake_products.html">孩子</a></li>
											<li><a class="list" href="cake_products.html">父母</a></li>
										</ul>
									</div>																		
									<div class="col-sm-3">
										<h4>根据风味</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="cake_products.html">巧克力</a></li>
											<li><a class="list" href="cake_products.html">混合水果</a></li>
											<li><a class="list" href="cake_products.html">奶油</a></li>
											<li><a class="list" href="cake_products.html">草莓</a></li>
											<li><a class="list" href="cake_products.html">香草</a></li>
											<li><a class="list" href="cake_products.html">原味</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<h4>按形状</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="cake_products.html">心形</a></li>
											<li><a class="list" href="cake_products.html">卡通形象</a></li>
											<li><a class="list" href="cake_products.html">多层蛋糕</a></li>
											<li><a class="list" href="cake_products.html">圆形</a></li>
											<li><a class="list" href="cake_products.html">正方形</a></li>
											<li><a class="list" href="cake_products.html">DIY</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<h4>重量</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="cake_products.html">1 kG</a></li>
											<li><a class="list" href="cake_products.html">1.5 kG</a></li>
											<li><a class="list" href="cake_products.html">2 kG</a></li>
											<li><a class="list" href="cake_products.html">3 kG</a></li>
											<li><a class="list" href="cake_products.html">4 kG</a></li>
											<li><a class="list" href="cake_products.html">定制</a></li>
										</ul>
									</div>
								</div>
							</ul>
						</li>
					   <li class="dropdown grid">
							<a href="#" class="dropdown-toggle list1" data-toggle="dropdown">婚庆<b class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-4">
								<div class="row">
									<div class="col-sm-3">
										<h4>By Relation</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="cake_products.html">Friend</a></li>
											<li><a class="list" href="cake_products.html">Lover</a></li>
											<li><a class="list" href="cake_products.html">Sister</a></li>
											<li><a class="list" href="cake_products.html">Brother</a></li>
											<li><a class="list" href="cake_products.html">Kids</a></li>
											<li><a class="list" href="cake_products.html">Parents</a></li>
										</ul>
									</div>																		
									<div class="col-sm-3">
										<h4>By Flavour</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="cake_products.html">Chocolate</a></li>
											<li><a class="list" href="cake_products.html">Mixed Fruit</a></li>
											<li><a class="list" href="cake_products.html">Butterscotch</a></li>
											<li><a class="list" href="cake_products.html">Strawberry</a></li>
											<li><a class="list" href="cake_products.html">Vanilla</a></li>
											<li><a class="list" href="cake_products.html">Eggless Cakes</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<h4>By Theme</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="cake_products.html">Heart shaped</a></li>
											<li><a class="list" href="cake_products.html">Cartoon Cakes</a></li>
											<li><a class="list" href="cake_products.html">2-3 Tier Cakes</a></li>
											<li><a class="list" href="cake_products.html">Square shape</a></li>
											<li><a class="list" href="cake_products.html">Round shape</a></li>
											<li><a class="list" href="cake_products.html">Photo cakes</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<h4>Weight</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="cake_products.html">1 kG</a></li>
											<li><a class="list" href="cake_products.html">1.5 kG</a></li>
											<li><a class="list" href="cake_products.html">2 kG</a></li>
											<li><a class="list" href="cake_products.html">3 kG</a></li>
											<li><a class="list" href="cake_products.html">4 kG</a></li>
											<li><a class="list" href="cake_products.html">Large</a></li>
										</ul>
									</div>
								</div>
							</ul>
						</li>				
						<li class="dropdown grid">
							<a href="#" class="dropdown-toggle list1" data-toggle="dropdown">近期活动 <b class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-4">
								<div class="row">
									<div class="col-sm-3">
										<h4>By Relation</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="cake_products.html">Friend</a></li>
											<li><a class="list" href="cake_products.html">Lover</a></li>
											<li><a class="list" href="cake_products.html">Sister</a></li>
											<li><a class="list" href="cake_products.html">Brother</a></li>
											<li><a class="list" href="cake_products.html">Kids</a></li>
											<li><a class="list" href="cake_products.html">Parents</a></li>
										</ul>
									</div>																		
									<div class="col-sm-3">
										<h4>By Flavour</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="cake_products.html">Chocolate</a></li>
											<li><a class="list" href="cake_products.html">Mixed Fruit</a></li>
											<li><a class="list" href="cake_products.html">Butterscotch</a></li>
											<li><a class="list" href="cake_products.html">Strawberry</a></li>
											<li><a class="list" href="cake_products.html">Vanilla</a></li>
											<li><a class="list" href="cake_products.html">Eggless Cakes</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<h4>By Theme</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="cake_products.html">Heart shaped</a></li>
											<li><a class="list" href="cake_products.html">Cartoon Cakes</a></li>
											<li><a class="list" href="cake_products.html">2-3 Tier Cakes</a></li>
											<li><a class="list" href="cake_products.html">Square shape</a></li>
											<li><a class="list" href="cake_products.html">Round shape</a></li>
											<li><a class="list" href="cake_products.html">Photo cakes</a></li>
										</ul>
									</div>
									<div class="col-sm-3">
										<h4>Weight</h4>
										<ul class="multi-column-dropdown">
											<li><a class="list" href="cake_products.html">1 kG</a></li>
											<li><a class="list" href="cake_products.html">1.5 kG</a></li>
											<li><a class="list" href="cake_products.html">2 kG</a></li>
											<li><a class="list" href="cake_products.html">3 kG</a></li>
											<li><a class="list" href="cake_products.html">4 kG</a></li>
											<li><a class="list" href="cake_products.html">Large</a></li>
										</ul>
									</div>
								</div>
							</ul>
						</li>
						<li class="dropdown grid">
							<a href="#" class="dropdown-toggle list1" data-toggle="dropdown">品牌历程<b class="caret"></b></a>
							
						</li>								
					</ul> 
					<!--/.navbar-collapse-->
				</div>
				<!--//navbar-header-->
			</nav>
			<div class="header-info">
				<div class="header-right search-box">
					<a href="#"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>				
					<div class="search">
						<form class="navbar-form">
							<input type="text" class="form-control">
							<button type="submit" class="btn btn-default" aria-label="Left Align">
								搜索
							</button>
						</form>
					</div>	
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!--//header-->
	<!--banner-->
	<div class="banner">
		<div class="container">
			<h2 class="hdng">Yummy <span>Cakes</span> for u</h2>
			<p>Our best cakes make your day special</p>
			<a href="cake_products.html">立即抢购</a>
			<div class="banner-text">			
				<img src="../images/2.png" alt=""/>	
			</div>
		</div>
	</div>			
	<!--//banner-->
   <!-- <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>-->
	<!--gallery-->
	<div class="gallery">
		<div class="container">
			<div class="gallery-grids">
				<div class="col-md-8 gallery-grid glry-one">
					<a href="cake_products.html"><img src="${path}images/g1.jpg" class="img-responsive" alt=""/>
						<div class="gallery-info">
							<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>快点我吧</p>
							<a class="shop" href="single.html">立即抢购</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p>商品名称</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$95.00</h5>
							</div>
							
							<!--等级
								到时候评价可直接用
							-->
							<div class="rating">
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-4 gallery-grid glry-two">
					<a href="cake_products.html"><img src="${path}images/g2.jpg" class="img-responsive" alt=""/>
						<div class="gallery-info galrr-info-two">
							<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>快点我吧</p>
							<a class="shop" href="single.html">立即抢购</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p>Lorem Ipsum is simply</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$95.00</h5>
							</div>
							<div class="rating">
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-3 gallery-grid ">
					<a href="cake_products.html"><img src="${path}images/g3.png" class="img-responsive" alt=""/>
						<div class="gallery-info">
							<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>快点我吧</p>
							<a class="shop" href="single.html">立即抢购</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p>Lorem Ipsum is simply</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$95.00</h5>
							</div>
							<div class="rating">
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-3 gallery-grid ">
					<a href="cake_products.html"><img src="${path}images/g4.png" class="img-responsive" alt=""/>
						<div class="gallery-info">
							<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>快点我吧</p>
							<a class="shop" href="single.html">立即抢购</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p>Lorem Ipsum is simply</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$95.00</h5>
							</div>
							<div class="rating">
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-3 gallery-grid ">
					<a href="cake_products.html"><img src="${path}images/g5.png" class="img-responsive" alt=""/>
						<div class="gallery-info">
							<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>快点我吧</p>
							<a class="shop" href="single.html">立即抢购</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p>Lorem Ipsum is simply</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$95.00</h5>
							</div>
							<div class="rating">
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-3 gallery-grid ">
					<a href="cake_products.html"><img src="${path}images/g6.png" class="img-responsive" alt=""/>
						<div class="gallery-info">
							<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>快点我吧</p>
							<a class="shop" href="single.html">立即抢购</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p>Lorem Ipsum is simply</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$95.00</h5>
							</div>
							<div class="rating">
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-3 gallery-grid ">
					<a href="cake_products.html"><img src="${path}images/g7.png" class="img-responsive" alt=""/>
						<div class="gallery-info">
							<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>快点我吧</p>
							<a class="shop" href="single.html">立即抢购</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p>Lorem Ipsum is simply</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$95.00</h5>
							</div>
							<div class="rating">
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-3 gallery-grid ">
					<a href="cake_products.html"><img src="${path}images/g8.png" class="img-responsive" alt=""/>
						<div class="gallery-info">
							<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>快点我吧</p>
							<a class="shop" href="single.html">立即抢购</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p>Lorem Ipsum is simply</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$95.00</h5>
							</div>
							<div class="rating">
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-3 gallery-grid ">
					<a href="cake_products.html"><img src="${path}images/g9.png" class="img-responsive" alt=""/>
						<div class="gallery-info">
							<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>快点我吧</p>
							<a class="shop" href="single.html">立即抢购</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p>Lorem Ipsum is simply</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$95.00</h5>
							</div>
							<div class="rating">
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-3 gallery-grid ">
					<a href="cake_products.html"><img src="${path}images/g10.png" class="img-responsive" alt=""/>
						<div class="gallery-info">
							<p><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>快点我吧</p>
							<a class="shop" href="single.html">立即抢购</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p>Lorem Ipsum is simply</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$95.00</h5>
							</div>
							<div class="rating">
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
								<span>☆</span>
							</div>						
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
	<!--//gallery-->
	<!--subscribe-->
	<!--<div class="subscribe">
		 <div class="container">
			 <h3>Newsletter</h3>
			 <form>
				 <input type="text" class="text" value="Email" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Email';}">
				 <input type="submit" value="Subscribe">
			 </form>
		 </div>
	</div>-->
	<!--//subscribe-->
	<!--footer-->
	<div class="footer">
		<div class="social animated wow fadeInDown" data-wow-delay=".1s">
	<div class="container">
		<div class="col-sm-3 social-ic">
			<a href="#"><img src="../images/good.png"/></a>
		</div>
		<div class="col-sm-3 social-ic">
			<a href="#"><img src="../images/seven.png"/></a>
		</div>
		<div class="col-sm-3 social-ic">
			<a href="#"><img src="../images/special.png"/></a>
		</div>
		<div class="col-sm-3 social-ic">
			<a href="#"><img src="../images/help.png"/></a>
		</div>
	<div class="clearfix"></div>
	</div>
</div>

		</div>
	</div>
	<!--//footer-->
	<div class="footer-bottom">
		<div class="container">
			<p class="footer-copyright">
				Copyright &copy; 2000-2017 HARDEN国际有限公司，保留一切权利。｜ <a class="footer-beiAn" target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010502032052">京公网安备 11010502032052号</a>关于我们 |联系我们 |加入我们 |用户帮助 |微店联盟 |隐私声明 
			</p>
		</div>
		<div class="footer-i footer-mt15">
			<p>出版物经营许可证 ｜ 互联网药品信息服务资格证书编号(京) - 非经营性-2015-0087</p>
		</div>
		<div class="footer-check">
			<p class="footer-check-info check-info-addr">
				<span>公司名称：微go商城平台有限公司</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span>地址：厦门市思明区某海海底B座十层</span>&nbsp;&nbsp;&nbsp;&nbsp;
				<span>电话：0250-2501250</span>
			</p>
		<div class="footer-clr"></div>
		</div>
	</div>
	
</body>
</html>