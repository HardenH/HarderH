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
<title>经典风格--服装</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Classic Style Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="${path}css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${path}css/style4.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="${path}js/jquery.min.js"></script>
<!-- //js -->
<!-- for bootstrap working -->
<script type="text/javascript" src="../js/bootstrap-3.1.1.min.js"></script>
<!-- //for bootstrap working -->
<!-- animation-effect -->
<link href="${path}css/animate.min.css" rel="stylesheet"> 
<script src="${path}js/wow.min.js"></script>
<script>
 new WOW().init();
</script>
<!-- //animation-effect -->
<link rel="stylesheet" href="${path}css/amazeui.css" />
<link href='//fonts.googleapis.com/css?family=Cabin:400,500,600,700' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>
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
										<li><img src="../images2/logo1.png"/></li>
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
	
	
<!-- header -->
	<div class="header">
		<hr style="border-top:2px solid #F03726;"/>
			<div class="container">
			<div class="logo-nav">
				
					<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header nav_2">
						<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						 <div class="navbar-brand logo-nav-left ">
							<h1 class="animated wow pulse" data-wow-delay=".5s"><a href="cloth_index.html">Classic<span>Style</span></a></h1>
						</div>

					</div> 
					<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
						<ul class="nav navbar-nav">
							<li class="active"><a href="cloth_index.html" class="act">首页</a></li>	
							<!-- Mega Menu -->
							<li><a href="products.html">所有商品</a></li>
							<li><a href="products.html">新品首发</a></li>
							
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">女装 <b class="caret"></b></a>
								<ul class="dropdown-menu multi">
									<div class="row">
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>配件</h6>
												<li><a href="products.html">帽子</a></li>
												<li><a href="products.html">围巾</a></li>
												<li><a href="products.html">领带</a></li>
												<li><a href="products.html">墨镜</a></li>
										
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>上装</h6>
												<li><a href="products.html">外套</a></li>
												<li><a href="products.html">衬衫</a></li>
												<li><a href="products.html">连衣裙</a></li>
												<li><a href="products.html">长袖T恤</a></li>
												<li><a href="products.html">针织衫</a></li>
												<li><a href="products.html">皮夹克</a></li>

											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>下装</h6>
												<li><a href="products.html">长裤</a></li>
												<li><a href="products.html">牛仔裤</a></li>
												<li><a href="products.html">运动裤</a></li>
												<li><a href="products.html">超短裤</a></li>
												<li><a href="products.html">短裙</a></li>
												<li><a href="products.html">长裙</a></li>

											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="row-top">
										<div class="col-sm-6 row1">
											<a href="products.html"><img src="../images2/me.jpg" alt="" class="img-responsive"></a>
										</div>
										<div class=" col-sm-6 row2">
											<a href="products.html"><img src="../images2/me1.jpg" alt="" class="img-responsive"></a>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">男装<b class="caret"></b></a>
								<ul class="dropdown-menu multi multi1">
									<div class="row">
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>配件</h6>
												<li><a href="products1.html">帽子</a></li>
												<li><a href="products1.html">围巾</a></li>
												<li><a href="products1.html">领带</a></li>
												<li><a href="products1.html">墨镜</a></li>
										
											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>上装</h6>
												<li><a href="products1.html">外套</a></li>
												<li><a href="products1.html">衬衫</a></li>
												<li><a href="products1.html">连衣裙</a></li>
												<li><a href="products1.html">长袖T恤</a></li>
												<li><a href="products1.html">针织衫</a></li>
												<li><a href="products1.html">皮夹克</a></li>

											</ul>
										</div>
										<div class="col-sm-4">
											<ul class="multi-column-dropdown">
												<h6>下装</h6>
												<li><a href="products1.html">长裤</a></li>
												<li><a href="products1.html">牛仔裤</a></li>
												<li><a href="products1.html">运动裤</a></li>
												<li><a href="products1.html">超短裤</a></li>
												<li><a href="products1.html">短裙</a></li>
												<li><a href="products1.html">长裙</a></li>

											</ul>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="row-top">
										<div class="col-sm-6 row1">
											<a href="products1.html"><img src="../images2/me2.jpg" alt="" class="img-responsive"></a>
										</div>
										<div class=" col-sm-6 row2">
											<a href="products1.html"><img src="../images2/me3.jpg" alt="" class="img-responsive"></a>
										</div>
										<div class="clearfix"></div>
									</div>
								</ul>
							</li>
							
							<li><a href="contact.html">品牌历程</a></li>
						</ul>
					</div>
					</nav>
				</div>
				
		</div>
	</div>
<!-- //header -->


<!-- banner -->
	<div class="banner">
	
	
	<div class="banner-right">
					<ul id="flexiselDemo2">			
						<li><div class="banner-grid">
						<h2>人气热卖</h2>
						<div class="wome">
								<a href="single.html" ><img class="img-responsive" src="../images2/bi1.jpg" alt="" />
								</a>
								<div class="women simpleCart_shelfItem">
									<a href="#"><img src="../images2/ll.png" alt=""></a>
									<h6 ><a href="single.html">FASHION&nbsp;&nbsp;LEADER</a></h6>
									<p class="ba-price"><del>￥100.00</del><em class="item_price">￥70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">加入购物车</a>
								</div>							
								</div>							
							</div></li>
						<li><div class="banner-grid">
						<h2>人气热卖</h2>
						<div class="wome">
								<a href="single.html" ><img class="img-responsive" src="../images2/bi.jpg" alt="" />
								</a>	
								<div class="women simpleCart_shelfItem">
									<a href="#"><img src="../images2/ll.png" alt=""></a>
									<h6 ><a href="single.html">FASHION&nbsp;&nbsp;LEADER</a></h6>
									<p class="ba-price"><del>￥100.00</del><em class="item_price">￥70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">加入购物车</a>
								</div>						
								</div>						
							</div></li>
						<li><div class="banner-grid">
						<h2>人气热卖</h2>
						<div class="wome">
								<a href="single.html" ><img class="img-responsive" src="../images2/bi2.jpg" alt="" />
								</a>	
								<div class="women simpleCart_shelfItem">
									<a href="#"><img src="../images2/ll.png" alt=""></a>
									<h6 ><a href="single.html">FASHION&nbsp;&nbsp;LEADER</a></h6>
									<p class="ba-price"><del>￥100.00</del><em class="item_price">￥70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">加入购物车</a>
								</div>						
								</div>						
							</div></li>
						
					
					</ul>
					<script type="text/javascript">
		$(window).load(function() {
			$("#flexiselDemo2").flexisel({
				visibleItems: 1,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 5000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 1
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 1
		    		}
		    	}
		    });
		    
		});
	</script>
		<script type="text/javascript" src="js/jquery.flexisel.js"></script>

					</div>

				
				</div>

	</div>
<!-- //banner -->
<!--content-->
		<div class="content">
		<div class="content-head">
					
					<div class="col-md-6 col-m1 animated wow fadeInLeft" data-wow-delay=".1s">
						<div class="col-1">
						<div class="col-md-6 col-2">
							<a href="single.html"><img src="../images2/pi3.jpg" class="img-responsive" alt="">
							</a></div>
							<div class="col-md-6 col-p">
								<h5>你的秋冬新品已上线</h5>
								<p>活动简介。。。。。。。。</p>
								<a href="single.html" class="shop" data-hover="Shop Now">Shop Now</a>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="col-1">
						<div class="col-md-6 col-p">
								<h5>近期活动</h5>
								<p>全场订单满。。。。。。。</p>
								<a href="single.html" class="shop" data-hover="Shop Now">Shop Now</a>
							</div>
						<div class="col-md-6 col-2">
							<a href="single.html"><img src="../images2/pi.jpg" class="img-responsive" alt="">
							</a></div>
							<div class="clearfix"> </div>
						</div>
						</div>
					
					<div class="col-md-6 col-m2 animated wow fadeInRight" data-wow-delay=".1s">
					
						<!---->
						 <!-- requried-jsfiles-for owl -->
							<link href="css/owl.carousel.css" rel="stylesheet">
							    <script src="js/owl.carousel.js"></script>
							        <script>
									    $(document).ready(function() {
									      $("#owl-demo").owlCarousel({
									        items : 2,
									        lazyLoad : false,
									        autoPlay : true,
									        navigation : true,
									        navigationText :  true,
									        pagination : false,
									      });
									    });
									  </script>
							 <!-- //requried-jsfiles-for owl -->
							 <!-- start content_slider -->
						       <div id="owl-demo" class="owl-carousel">
					                <div class="item">					                	 
										  
											<a href="single.html"><img class="img-responsive" src="../images2/bb.png" alt="" /></a>  
											<a href="single.html" class="shop-2" >Shop Now</a>
								
					                </div>
									<div class="item">					                	  
										
											<a href="single.html"><img class="img-responsive" src="../images2/bb1.png" alt="" /></a>  
											<a href="single.html" class="shop-2">Shop Now</a>									
																		
					                </div>
									
									<div class="item">					                	 
									
											<a href="single.html"><img class="img-responsive" src="../images2/bb.png" alt="" /> </a> 
											<a href="single.html" class="shop-2">Shop Now</a>									
																			
					                </div>
									<div class="item">					                	  
										
											<a href="single.html"><img class="img-responsive" src="../images2/bb1.png" alt="" /></a>  
											<a href="single.html" class="shop-2">Shop Now</a>									
																		
					                </div>
							</div>
					   </div>
					   <div class="clearfix"></div>
			</div>	
					</div>
				
			<!---->
			
				<div class="content-top">
					<div class="col-md-5 col-md1 animated wow fadeInLeft" data-wow-delay=".1s">
						<div class="col-3">
							<a href="single.html"><img src="../images2/pi1.jpg" class="img-responsive " alt="">
							<div class="col-pic">	
								<h5>女装会场</h5>
								<p>At vero eos et accusamus et</p>
							</div></a>
						</div>
						
					</div>
					<div class="col-md-7 col-md2 animated wow fadeInRight" data-wow-delay=".1s">
						<div class="col-sm-4 item-grid simpleCart_shelfItem">
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="../images2/pr1.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="../images2/pr.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="../images2/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">加入购物车</a>
								</div>
							</div>
						</div>
				
						<div class="col-sm-4 item-grid simpleCart_shelfItem">
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="../images2/pr3.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="../images2/pr2.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="../images2/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">加入购物车</a>
								</div>
							</div>
						</div>
						<div class="col-sm-4 item-grid simpleCart_shelfItem">
						<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="../images2/pr5.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="../images2/pr4.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="../images2/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">加入购物车</a>
								</div>
							</div>
						</div>
					<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
				<!----->
				<!---->
				<div class="content-top">
					
					<div class="col-md-7 col-md2 animated wow fadeInLeft" data-wow-delay=".1s">
						<div class="col-sm-4 item-grid simpleCart_shelfItem">
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="../images2/pr6.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="../images2/pr7.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="../images2/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">加入购物车</a>
								</div>
							</div>
							
						</div>
				
						<div class="col-sm-4 item-grid simpleCart_shelfItem">
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="../images2/pr9.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="../images2/pr8.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="../images2/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">加入购物车</a>
								</div>
							</div>
						</div>
						<div class="col-sm-4 item-grid simpleCart_shelfItem">
						<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.html">
											<div class="grid-img">
												<img  src="../images2/pr10.jpg" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="../images2/pr11.jpg" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="../images2/ll.png" alt=""></a>
									<h6><a href="single.html">Sed ut perspiciatis unde</a></h6>
									<p ><del>$100.00</del><em class="item_price">$70.00</em></p>
									<a href="#" data-text="Add To Cart" class="but-hover1 item_add">加入购物车</a>
								</div>
							</div>
						</div>
					<div class="clearfix"></div>
					</div>
					<div class="col-md-5 col-md1 animated wow fadeInRight" data-wow-delay=".1s">
						<div class="col-3">
							<a href="single.html"><img src="../images2/pi2.jpg" class="img-responsive " alt="">
							<div class="col-pic">
								<h5>男装会场</h5>
								<p>At vero eos et accusamus et</p>
							</div></a>
						</div>
						
					</div>
					<div class="clearfix"></div>
				</div>
			
			
				<!--products-->
<div class="social animated wow fadeInDown" data-wow-delay=".1s">
	<div class="container">
		<div class="col-sm-3 social-ic">
			<a href="#"><img src="../images2/good.png"/></a>
		</div>
		<div class="col-sm-3 social-ic">
			<a href="#"><img src="../images2/seven.png"/></a>
		</div>
		<div class="col-sm-3 social-ic">
			<a href="#"><img src="../images2/special.png"/></a>
		</div>
		<div class="col-sm-3 social-ic">
			<a href="#"><img src="../images2/help.png"/></a>
		</div>
	<div class="clearfix"></div>
	</div>
</div>
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
<!-- //footer -->
</body>
</html>