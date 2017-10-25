<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("path", path);
%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>订单管理</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin2.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui2.css" rel="stylesheet" type="text/css">

		<link href="../css/personal2.css" rel="stylesheet" type="text/css">
		<link href="../css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>
<script type="text/javascript">
$(function(){
	$.ajaxSetup({
		  async: false
		  });
	var totalPrice=0;
	$.get("${path}GoodsAndOrdersservlet",{"op":"getallbystoreid","storeid":"1"},function(mydata,status){
			$.each(mydata.data,function(index,data){
				$(".order-list").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left"+mydata.data[index].ORDERNUM+"'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount"+mydata.data[index].ORDERNUM+"'>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>交易成功</p><p class='order-info'><a href='${path}orderinfo.jsp'>订单详情</a></p>"
						+"<p class='order-info'><a href='logistics.jsp'>查看物流</a></p></div></li><li class='td td-change'>"
			+"</li></div></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						totalPrice=0;
						$.each(mydata.data,function(index,data){
totalPrice = totalPrice+data.ORDERTOTALPRICE;

								$(".order-left"+mydata.data[index].ORDERNUM).append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
							
							
						})	
					})
					$(".item-amount"+mydata.data[index].ORDERNUM).append("合计："+totalPrice+"<p>含运费：<span>10.00</span></p>");
				})
	})
})
</script>
<script type="text/javascript">
$(function(){
	$.ajaxSetup({
		  async: false
		  });
	var totalPrice=0;
//点击全部订单
$("#all").on("click",function(){
	$(".order-status0").remove();
	$.get("${path}GoodsAndOrdersservlet",{"op":"getallbystoreid","storeid":"1"},function(mydata,status){
		//console.log(mydata);
		alert(mydata);
			$.each(mydata.data,function(index,data){
				$(".order-list").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left"+mydata.data[index].ORDERNUM+"'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount"+mydata.data[index].ORDERNUM+"'>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>交易成功</p><p class='order-info'><a href='${path}orderinfo.jsp'>订单详情</a></p>"
						+"<p class='order-info'><a href='logistics.jsp'>查看物流</a></p></div></li><li class='td td-change'>"
			+"</li></div></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						totalPrice=0;
						$.each(mydata.data,function(index,data){
							totalPrice = totalPrice+data.ORDERTOTALPRICE;
								$(".order-left"+mydata.data[index].ORDERNUM).append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
						})			
					})
					$(".item-amount"+mydata.data[index].ORDERNUM).append("合计："+totalPrice+"<p>含运费：<span>10.00</span></p>");
				})
	})
})



//点击待付款显示

	$("#wait-pay").on("click",function(){
		alert(111);
		$(".order-status0").remove();
		$.get("${path}GoodsAndOrdersservlet",{"op":"getwaitnum","storeid":"1","ORDERSTATE":"0"},function(mydata,status){
			
			$.each(mydata.data,function(index,data){
				$(".order-list1").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left"+mydata.data[index].ORDERNUM+"'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount"+mydata.data[index].ORDERNUM+"'>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>等待买家付款</p><p class='order-info'><a href='${path}orderinfo.jsp'>取消订单</a></p>"
						+"<p class='order-info'><a href='logistics.jsp'>查看物流</a></p></div></li><li class='td td-change'>"
			+"</li></div></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						totalPrice=0;
						$.each(mydata.data,function(index,data){
							totalPrice = totalPrice+data.ORDERTOTALPRICE;
								$(".order-left"+mydata.data[index].ORDERNUM).append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
						})		
		})
		$(".item-amount"+mydata.data[index].ORDERNUM).append("合计："+totalPrice+"<p>含运费：<span>10.00</span></p>");
				})
		})
		
	})
	//点击待发货显示
	$("#wait-send").on("click",function(){
		alert(111);
		$(".order-status0").remove();
		$.get("${path}GoodsAndOrdersservlet",{"op":"getwaitnum","storeid":"1","ORDERSTATE":"0"},function(mydata,status){
			
			$.each(mydata.data,function(index,data){
				$(".order-list2").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left"+mydata.data[index].ORDERNUM+"'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount"+mydata.data[index].ORDERNUM+"'>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>买家已付款</p><p class='order-info'><a href='${path}orderinfo.jsp'>订单详情</a></p>"
						+"</li><li class='td td-change'><div ><button class='am-btn am-btn-danger anniu' value='"+data.ORDERNUM+"' >一键发货</button></div>"
						+"</div></li></div></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						totalPrice=0;
						$.each(mydata.data,function(index,data){
							totalPrice = totalPrice+data.ORDERTOTALPRICE;
								$(".order-left"+mydata.data[index].ORDERNUM).append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
						})		
		})
		$(".item-amount"+mydata.data[index].ORDERNUM).append("合计："+totalPrice+"<p>含运费：<span>10.00</span></p>");
				})
		})
		
	})

	
	//点击一键发货按钮
	$(document).on('click','.am-btn',function(){
		var ordernum = $(this).val();
		$(".order-status0").remove();
		$.get("${path}GoodsAndOrdersservlet",{"op":"changestatus","storeid":"1","ORDERSTATE":"1","ordersnum":ordernum},function(mydata,status){
			$.each(mydata.data,function(index,data){
				$(".order-list2").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left"+mydata.data[index].ORDERNUM+"'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount"+mydata.data[index].ORDERNUM+"'>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>买家已付款</p><p class='order-info'><a href='${path}orderinfo.jsp'>订单详情</a></p>"
						+"</li><li class='td td-change'><div ><button class='am-btn am-btn-danger anniu' value='"+data.ORDERNUM+"' >一键发货</button></div>"
						+"</div></li></div></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						totalPrice=0;
						$.each(mydata.data,function(index,data){
							totalPrice = totalPrice+data.ORDERTOTALPRICE;
								$(".order-left"+mydata.data[index].ORDERNUM).append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
						})		
		})
		$(".item-amount"+mydata.data[index].ORDERNUM).append("合计："+totalPrice+"<p>含运费：<span>10.00</span></p>");
				})
		})
		
	})

		
		//点击待收货显示
	$("#wait-receive").on("click",function(){
		$(".order-status0").remove();
		$.get("${path}GoodsAndOrdersservlet",{"op":"getwaitnum","storeid":"1","ORDERSTATE":"2"},function(mydata,status){
			
			$.each(mydata.data,function(index,data){
			$(".order-list3").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left"+mydata.data[index].ORDERNUM+"'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount"+mydata.data[index].ORDERNUM+"'>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'<p class='Mystatus'>买家未收货</p><p class='order-info'><a href='${path}orderinfo.jsp'>订单详情</a></p>"
						+"<p class='order-info'><a href='logistics.jsp'>查看物流</a></p><p class='order-info'><a href='#'>延长收货</a></p></div></li><li class='td td-change'>"
			+"</li></div></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						totalPrice=0;
						$.each(mydata.data,function(index,data){
							totalPrice = totalPrice+data.ORDERTOTALPRICE;
								$(".order-left"+mydata.data[index].ORDERNUM).append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
						})				
					})
					$(".item-amount"+mydata.data[index].ORDERNUM).append("合计："+totalPrice+"<p>含运费：<span>10.00</span></p>");
				})
		})
		
	})
	
	//已完成订单
	$("#wait-comm").on("click",function(){
		$(".order-status0").remove();
		alert(4)
		$.get("${path}GoodsAndOrdersservlet",{"op":"getwaitnum","storeid":"1","ORDERSTATE":"4"},function(mydata,status){
			$.each(mydata.data,function(index,data){
				$(".order-list4").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left"+mydata.data[index].ORDERNUM+"'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount'>合计："+data.ORDERTOTALPRICE+"<p>含运费：<span>10.00</span></p>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>买家已付款</p><p class='order-info'><a href='${path}orderinfo.jsp'>订单详情</a></p>"
						+"</li><li class='td td-change'><div ><button class='am-btn am-btn-danger anniu' >一键发货</button></div>"
			+"</div></li></div></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						totalPrice=0;
						$.each(mydata.data,function(index,data){
							totalPrice = totalPrice+data.ORDERTOTALPRICE;
								$(".order-left"+mydata.data[index].ORDERNUM).append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
						})			
			})
			$(".item-amount"+mydata.data[index].ORDERNUM).append("合计："+totalPrice+"<p>含运费：<span>10.00</span></p>");
				})
		})
		
	})
		
		
		
});

</script>

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
					</div>
			</article>
		</header>
            
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a id="all" href="#tab1">所有订单</a></li>
								<li><a href="#tab2"  id="wait-pay">待付款</a></li>
								<li><a href="#tab3"   id ="wait-send">待发货</a></li>
								<li><a href="#tab4"   id="wait-receive">待收货</a></li>
								<li><a href="#tab5"  id="wait-comm">已完成</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										 <div class="order-list"></div>
</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab2">

									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										 <div class="order-list1">
											
										</div> 

									</div>
								</div>
								
								<div class="am-tab-panel am-fade" id="tab3">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list2">
											
									</div>
								</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										 <div class="order-list3">
											
									</div>
								</div>
								</div>

								<div class="am-tab-panel am-fade" id="tab5">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										 <div class="order-list4">
										

						</div> 
					</div>
				</div>
				</div>
				</div>
				</div>
				
				<!--//footer-->
					<div class="footer-bottom">
						<!-- <div class="container">
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
						</div> -->
					</div>
					<!-- //footer -->
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
							<li ><a href="${path}person_jsp/information-storge.jsp">店铺管理</a></li>
							<li> <a href="${path}person_jsp/goodsmanage.jsp">商品管理</a></li>
							
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>店铺交易</p>
						<ul>
							<li class="active"><a href="${path}person_jsp/order-sale.jsp">订单管理</a></li>
							
						</ul>
					</li>
				</ul>
			</aside>
		</div>

	</body>
</html>	
