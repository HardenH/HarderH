<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Goods"%>
<%@page import="java.util.List"%>
<%@page import="com.service.Goodsservice"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%

    String path = request.getContextPath();

    String basePath = request.getScheme() + "://"

            + request.getServerName() + ":" + request.getServerPort()

            + path + "/";

%>
<%
	String patha = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath();
	pageContext.setAttribute("patha", patha);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>商品页面</title>

<link href="<%=path %>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="<%=path %>/css/optstyle.css" rel="stylesheet" />
<link type="text/css" href="<%=path %>/css/style.css" rel="stylesheet" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script type="text/javascript" src="<%=path %>/basic/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="<%=path %>/basic/js/quick_links.js"></script>

<script type="text/javascript" src="<%=path %>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.imagezoom.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="<%=path %>/js/list.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<script type="text/javascript">
	$(function() {
		/*这里是店铺主页跳转按钮的连接地址，可以修改*/
		$("#menu").click(function() {
			window.location.href = "";
		});
		
		//获取用户id的值 
		var user_Id = $("#user_Id").val();
		
		$("#addToShopCart").click(function(){
			//如果user_Id != "" 商品添加到购物车中 否则要求用户登录
			if(user_Id != ""){
				location.href = "${path}/GoodsCarServlet?op=Addgoods&goodsId="+$("#goodsId").val()+"&goodsCout="+$("#text_box").val()+"&user_Id="+user_Id;
			}else{
				location.href = "${path}/home_jsp/login.jsp";
			}
		});
		
		$("#mc-menu-hd").click(function(){
			//如果user_Id != "" 跳转到购物车中 否则要求用户登录
			if(user_Id != ""){
				location.href = "${path}/home_jsp/shopcart.jsp";
			}else{
				location.href = "${path}/home_jsp/login.jsp";
			}
		});
		
		
	});
	
	$(function(){
		//顶部导航栏 欢迎
		$(document).ready(function(){
			var uName = $("#user").text();
			//先判断用户是否登录了
			if(uName != ""){
				//将请登录 注册移除
				$(".welcome").remove();
			}else{
				$("#wel_user").remove();
			} 
		});
	});
</script>

</head>

<body>
<c:if test = "${requestScope.list!=null}">
				<c:forEach items="${requestScope.list}" var="goods">
				
	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<div class="topMessage">
					<div class="menu-hd">
						<a href="login.jsp" target="_top" class="welcome" id="please_login">亲，请登录</a> 
						<a href="register.jsp" target="_top" class="welcome" id="please_regid">免费注册</a>
						<a id="wel_user" target="_top" >欢迎，<span id="user" >${sessionScope.user}</span></a>
					</div>
				</div>
			</div>
		</ul>
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="#" target="_top" class="h">商城首页</a>
				</div>
			</div>
			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng">
					<a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
				</div>
				
			</div>
			<div class="topMessage mini-cart">
				<div class="menu-hd">
					<a id="mc-menu-hd" href="#" target="_top">
						<i class="am-icon-shopping-cart  am-icon-fw"> </i><span>购物车</span>
						<strong id="J_MiniCartNum" class="h">${sessionScope.buyCount}</strong>
					</a>
				</div>
			</div>
			
			<div class="topMessage favorite">
				<div class="menu-hd">
					<a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
				</div>
			</div>
		</ul>
	</div>

	<!--悬浮搜索框-->
	<div class="nav white">
		<div class="logo">
			<img src="../images/logo.png" />
		</div>
		<div class="logoBig">
			<li><img src="../images/mylogo.png" /></li>
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
	<b class="line"></b>
	<div class="listMain">
		<!--分类-->
		<div class="nav-table">
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
		</div>
		<ol class="am-breadcrumb am-breadcrumb-slash">
			<li><a href="#">首页</a></li>
			<li><a href="#">分类</a></li>
			<li class="am-active">内容</li>
		</ol>
		<script type="text/javascript">
			$(window).load(function() {
				$('.flexslider').flexslider({
					animation : "slide",
					start : function(slider) {
						$('body').removeClass('loading');
					}
				});
			});
		</script>
		<div class="scoll">
			<section class="slider">
			<div class="flexslider">
				<ul class="slides">
					<li><img src="../images/01.jpg" title="pic" /></li>
					<li><img src="../images/02.jpg" /></li>
					<li><img src="../images/03.jpg" /></li>
				</ul>
			</div>
			</section>
		</div>

		<!--放大镜-->
		<div class="item-inform">
			<div class="clearfixLeft" id="clearcontent">
				<div class="box">
					<script type="text/javascript">
						$(document).ready(function() {
							$(".jqzoom").imagezoom();
							$("#thumblist li a").click(function() {
								$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
								$(".jqzoom").attr('src',$(this).find("img").attr("mid"));
								$(".jqzoom").attr('rel',$(this).find("img").attr("big"));
							});
						});
					</script>
				<div class="tb-booth tb-pic tb-s310">
					<a href="${goods.GOODSIMG}"><img src="${goods.GOODSIMG}" alt="细节展示放大镜特效" rel="${goods.GOODSIMG}" class="jqzoom" /></a>
				</div>
				</div>
				<div class="clear"></div>
			</div>

			<div class="clearfixRight">
				<!--规格属性-->
				<!--名称-->
				<div class="tb-detail-hd">
					<h1><c:out value="${goods.GOODSNAME}"/></h1>
				</div>
				<div class="tb-detail-list">
					<!--价格-->
					<div class="tb-detail-price">
						<li class="price iteminfo_price">
							<dt>价格：</dt>
							<dd>
								<em>¥</em><b class="sys_item_price"><c:out value="${goods.GOODSPRICE}"/></b>
							</dd>
						</li>
						<div class="clear"></div>
					</div>

					<!--销量-->
					<ul class="tm-ind-panel">
						<li class="tm-ind-item tm-ind-sellCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">累计销量：</span><span class="tm-count">${goods.GOODSSALECOUNT}</span>
							</div>
						</li>
						<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
							<div class="tm-indcon">
								<!-- <span class="tm-label">累计评价：</span><span class="tm-count">640</span> -->
							</div>
						</li>
					</ul>
					<div class="clear"></div>

					<!--各种规格-->
					<dl class="iteminfo_parameter sys_item_specpara">
						<dt class="theme-login">
							<div class="cart-title">
								可选规格<span class="am-icon-angle-right"></span>
							</div>
						</dt>
						<dd>
							<!--操作页面-->
							<div class="theme-popover-mask"></div>
							<div class="theme-popover">
								<div class="theme-span"></div>
								<div class="theme-poptit">
									<a href="javascript:;" title="关闭" class="close">×</a>
								</div>
								<div class="theme-popbod dform">
									
										<div class="theme-signin-left">
											<div class="theme-options">
												<div class="cart-title">口味</div>
												<ul>
													<li class="sku-line selected">原味<i></i></li>
													<li class="sku-line">奶油<i></i></li>
													<li class="sku-line">炭烧<i></i></li>
													<li class="sku-line">咸香<i></i></li>
												</ul>
											</div>
											<div class="theme-options">
												<div class="cart-title">包装</div>
												<ul>
													<li class="sku-line selected">手袋单人份<i></i></li>
													<li class="sku-line">礼盒双人份<i></i></li>
													<li class="sku-line">全家福礼包<i></i></li>
												</ul>
											</div>
											<div class="theme-options">
												<div class="cart-title number">数量</div>
												<dd>
												<input type="hidden" id="storeId" name="storeId" value="${goods.STOREID}"/>
													<input type="hidden" id="goodsId" name="goodsId" value="${goods.GOODSID}" />
													
													<br/>
													<input type="hidden" id="user_Id" name="user_Id" value="${sessionScope.user_Id}" />
													<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" /> 
													<input id="text_box" name="goodsCout" type="text" value="1" style="width: 30px;" /> 
													<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" /> 
													<span id="Stock" class="tb-hidden">库存
														<span class="stock">${goods.GOODSCOUNT}</span>件 
													</span>
												</dd>
											</div>
											<div class="clear"></div>

											<div class="btn-op">
												<div class="btn am-btn am-btn-warning">确认</div>
												<div class="btn close am-btn am-btn-warning">取消</div>
											</div>
										</div>
										<div class="theme-signin-right">
											<div class="img-info">
												<img src="../images/songzi.jpg" />
											</div>
											<div class="text-info">
												<span class="J_Price price-now">¥39.00</span> 
												<span id="Stock" class="tb-hidden">库存
													<span class="stock">1000</span>件
												</span>
											</div>
										</div>
										<div class="clearfix tb-btn tb-btn-buy theme-login">
											<a id="LikBuy" title="点此按钮到下一步确认购买信息" href="#">立即购买</a>
										</div>
										<div>
											<button type="button" class="bt_del" id="addToShopCart">加入购物车</button>
										</div>
								</div>
							</div>
						</dd>
					</dl>
				</div>
				<div class="clear"></div>
			</div>
		</div>



		<!--优惠套装-->
		<div class="clear"></div>
		<!-- introduce-->
		<div class="introduce">
			<div class="browse">
				<div class="mc">
					<ul>
						<div class="mt">
							<h2>看了又看</h2>
						</div>

						<li class="first">
							<div class="p-img">
								<a href="#"> <img class="" src="../images/browse1.jpg"></a>
							</div>
							<div class="p-name">
								<a href="#"> 【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味 </a>
							</div>
							<div class="p-price">
								<strong>￥35.90</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a href="#"> <img class="" src="../images/browse1.jpg"></a>
							</div>
							<div class="p-name">
								<a href="#"> 【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味 </a>
							</div>
							<div class="p-price">
								<strong>￥35.90</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a href="#"> <img class="" src="../images/browse1.jpg"></a>
							</div>
							<div class="p-name">
								<a href="#"> 【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味 </a>
							</div>
							<div class="p-price">
								<strong>￥35.90</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a href="#"> <img class="" src="../images/browse1.jpg"></a>
							</div>
							<div class="p-name">
								<a href="#"> 【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味 </a>
							</div>
							<div class="p-price">
								<strong>￥35.90</strong>
							</div>
						</li>
						<li>
							<div class="p-img">
								<a href="#"> <img class="" src="../images/browse1.jpg"></a>
							</div>
							<div class="p-name">
								<a href="#"> 【三只松鼠_开口松子218g】零食坚果特产炒货东北红松子原味 </a>
							</div>
							<div class="p-price">
								<strong>￥35.90</strong>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="introduceMain">
				<div class="am-tabs" data-am-tabs>
					<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
						<li class="am-active">
							<a href="#"><span class="index-needs-dt-txt">宝贝详情</span></a>
						</li>
						<li>
							<a href="" id="allcomment" ><span id="comments-all" value="${goods.GOODSID}" >全部评价</span></a>
						</li>
						<li>
							<!--<button id="menu" class="index-needs-dt-txt" value="店铺主页" style="width: 100px; height: 30px; background-color: royalblue;">店铺主页</button>  -->
							<a href="login.html"><span class="needs-dt-txt">店铺主页</span></a>
						</li>
					</ul>
					
					<div class="am-tabs-bd">
						<div class="am-tab-panel am-fade am-in am-active">
							<div class="J_Brand">
								<div class="attr-list-hd tm-clear">
									<h4>产品参数：</h4>
								</div>
								<div class="clear"></div>
								<ul id="J_AttrUL">
									<li title="">产品类型:&nbsp;烘炒类</li>
									<li title="">原料产地:&nbsp;巴基斯坦</li>
									<li title="">产地:&nbsp;湖北省武汉市</li>
									<li title="">配料表:&nbsp;进口松子、食用盐</li>
									<li title="">产品规格:&nbsp;210g</li>
									<li title="">保质期:&nbsp;180天</li>
									<li title="">产品标准号:&nbsp;GB/T 22165</li>
									<li title="">生产许可证编号：&nbsp;QS4201 1801 0226</li>
									<li title="">储存方法：&nbsp;请放置于常温、阴凉、通风、干燥处保存</li>
									<li title="">食用方法：&nbsp;开袋去壳即食</li>
								</ul>
								<div class="clear"></div>
							</div>

							<div class="details">
								<div class="attr-list-hd after-market-hd">
									<h4>商品细节</h4>
								</div>
								<div class="twlistNews">
									<img src="${goods.GOODSDEIMG}" /> 
								</div>
							</div>
							<div class="clear"></div>
						</div>
</c:forEach>
</c:if>
<script type="text/javascript">
$(function(){
	$("#comments-all").click(function(){
		var goodsid = $("#goodsId").val();
		//alert(goodsid);
		$.get("${path}Commentsservlet",{"op":"getallbygoodsid","goodsid":goodsid},function(mydata,status){
			//alert(mydata);
			$.each(mydata.data,function(index,data){
				$(".am-comments-list-flip").append("<li class='am-comment'><a href=''> "
						+"<img class='am-comment-avatar' src='${path}images/hwbn40x40.jpg' /> </a>"
						+"<div class='am-comment-main'><header class='am-comment-hd'> "
						+"<div class='am-comment-meta'><a href=''#link-to-user' class='am-comment-author'>"+data.USERNAME+"</a>"
						+"评论于 <time datetime=''>"+data.COMTIME+"</time>"
						+"</div></header><div class='am-comment-bd'>"
						+"<div class='tb-rev-item' data-id='255776406962'>"
						+"<div class='J_TbcRate_ReviewContent tb-tbcr-content '>"+data.CONTENT+""
						+"</div></div></div></div></li>");
			});
		}); 
		});
})
</script>
						<div class="am-tab-panel am-fade">
							<div class="actor-new">
								<div class="rate">
									<strong>100<span>%</span></strong> 
									<br> 
									<span>好评度</span>
								</div>
								<dl>
									<dt>买家印象</dt>
									<dd class="p-bfc">
										<q class="comm-tags"><span>味道不错</span><em>(2177)</em></q>
										<q class="comm-tags"><span>颗粒饱满</span><em>(1860)</em></q> 
										<q class="comm-tags"><span>口感好</span><em>(1823)</em></q> 
										<q class="comm-tags"><span>商品不错</span><em>(1689)</em></q> 
										<q class="comm-tags"><span>香脆可口</span><em>(1488)</em></q> 
										<q class="comm-tags"><span>个个开口</span><em>(1392)</em></q> 
										<q class="comm-tags"><span>价格便宜</span><em>(1119)</em></q> 
										<q class="comm-tags"><span>特价买的</span><em>(865)</em></q> 
										<q class="comm-tags"><span>皮很薄</span><em>(831)</em></q>
									</dd>
								</dl>
							</div>
							<div class="clear"></div>
							<div class="tb-r-filter-bar">
								<ul class=" tb-taglist am-avg-sm-4">
									<li class="tb-taglist-li tb-taglist-li-current">
										<div class="comment-info">
											<span>全部评价</span> <span class="tb-tbcr-num">(32)</span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li-1">
										<div class="comment-info">
											<span>好评</span> <span class="tb-tbcr-num">(32)</span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li-0">
										<div class="comment-info">
											<span>中评</span> <span class="tb-tbcr-num">(32)</span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li--1">
										<div class="comment-info">
											<span>差评</span> <span class="tb-tbcr-num">(32)</span>
										</div>
									</li>
								</ul>
							</div>
							<div class="clear"></div>

							<ul class="am-comments-list am-comments-list-flip">
								
							</ul>

							<div class="clear"></div>

							<!--分页 -->
							<ul class="am-pagination am-pagination-right">
								<li class="am-disabled"><a href="#">&laquo;</a></li>
								<li class="am-active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
							<div class="clear"></div>

							<div class="tb-reviewsft">
								<div class="tb-rate-alert type-attention">
									购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。
								</div>
							</div>

						</div>

						<div class="am-tab-panel am-fade">
							<div class="like">
								<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
									<li>
										<div class="i-pic limit">
											<img src="../images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="../images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="../images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="../images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="../images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="../images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="../images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="../images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="../images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="../images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="../images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
									<li>
										<div class="i-pic limit">
											<img src="../images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
								</ul>
							</div>
							<div class="clear"></div>

							<!--分页 -->
							<ul class="am-pagination am-pagination-right">
								<li class="am-disabled"><a href="#">&laquo;</a></li>
								<li class="am-active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
							<div class="clear"></div>

						</div>

					</div>

				</div>

				<div class="clear"></div>

				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
								href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
								href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a
								href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
								- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
								target="_blank">网页模板</a></em>
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!--菜单 -->
	<div class=tip>
		<div id="sidebar">
			<div id="wrap">
				<div id="prof" class="item">
					<a href="#"> <span class="setting"></span></a>
					<div class="ibar_login_box status_login">
						<div class="avatar_box">
							<p class="avatar_imgbox">
								<img src="../images/no-img_mid_.jpg" />
							</p>
							<ul class="user_info">
								<li>用户名：sl1903</li>
								<li>级&nbsp;别：普通会员</li>
							</ul>
						</div>
						<div class="login_btnbox">
							<a href="#" class="login_order">我的订单</a> 
							<a href="#" class="login_favorite">我的收藏</a>
						</div>
						<i class="icon_arrow_white"></i>
					</div>

				</div>
				<div id="shopCart" class="item">
					<a href="shopCart.jsp"> <span class="message"></span></a>
					<p>购物车</p>
					<p class="cart_num">${sessionScope.buyCount}</p>
				</div>
				<div id="asset" class="item">
					<a href="#"> <span class="view"></span></a>
					<div class="mp_tooltip">
						我的资产 <i class="icon_arrow_right_black"></i>
					</div>
				</div>

				<div id="foot" class="item">
					<a href="#"> <span class="zuji"></span></a>
					<div class="mp_tooltip">
						我的足迹 <i class="icon_arrow_right_black"></i>
					</div>
				</div>

				<div id="brand" class="item">
					<a href="#"> <span class="wdsc"><img src="../images/wdsc.png" /></span></a>
					<div class="mp_tooltip">
						我的收藏 <i class="icon_arrow_right_black"></i>
					</div>
				</div>

				<div id="broadcast" class="item">
					<a href="#"> <span class="chongzhi"><img src="../images/chongzhi.png" /></span> </a>
					<div class="mp_tooltip">
						我要充值 <i class="icon_arrow_right_black"></i>
					</div>
				</div>

				<div class="quick_toggle">
					<li class="qtitem">
						<a href="#"><span class="kfzx"></span></a>
						<div class="mp_tooltip">
							客服中心<i class="icon_arrow_right_black"></i>
						</div>
					</li>
					<!--二维码 -->
					<li class="qtitem">
						<a href="#none"><span class="mpbtn_qrcode"></span></a>
						<div class="mp_qrcode" style="display: none;">
							<img src="../images/weixin_code_145.png" /><i
								class="icon_arrow_white"></i>
						</div>
					</li>
					<li class="qtitem">
						<a href="#top" class="return_top"><span class="top"></span></a>
					</li>
				</div>

				<!--回到顶部 -->
				<div id="quick_links_pop" class="quick_links_pop hide"></div>

			</div>
		</div>
		<div id="prof-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>我</div>
		</div>
		<div id="shopCart-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>购物车</div>
		</div>
		<div id="asset-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>资产</div>

			<div class="ia-head-list">
				<a href="#" target="_blank" class="pl">
					<div class="num">0</div>
					<div class="text">优惠券</div>
				</a> <a href="#" target="_blank" class="pl">
					<div class="num">0</div>
					<div class="text">红包</div>
				</a> <a href="#" target="_blank" class="pl money">
					<div class="num">￥0</div>
					<div class="text">余额</div>
				</a>
			</div>

		</div>
		<div id="foot-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>足迹</div>
		</div>
		<div id="brand-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>收藏</div>
		</div>
		<div id="broadcast-content" class="nav-content">
			<div class="nav-con-close">
				<i class="am-icon-angle-right am-icon-fw"></i>
			</div>
			<div>充值</div>
		</div>
	</div>

</body>

</html>