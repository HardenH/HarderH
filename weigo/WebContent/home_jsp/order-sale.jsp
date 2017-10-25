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
	$.get("${path}GoodsAndOrdersservlet",{"op":"getallbystoreid","storeid":"1"},function(mydata,status){
		//console.log(mydata);
		alert(mydata);
			$.each(mydata.list,function(index,data){
				var totalCount=0;
				var totalPrice=0;
				totalPrice=totalPrice+data.ORDERTOTALPRICE
				$(".order-list").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left"+mydata.list[index].ORDERNUM+"'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount'>合计："+data.ORDERTOTALPRICE+"<p>含运费：<span>10.00</span></p>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>交易成功</p><p class='order-info'><a href='${path}orderinfo.jsp'>订单详情</a></p>"
						+"<p class='order-info'><a href='logistics.jsp'>查看物流</a></p></div></li><li class='td td-change'>"
			+"</li></div></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						
						$.each(mydata.list,function(index,data){

								$(".order-left"+mydata.list[index].ORDERNUM).append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
						})			
					
					
					
						
							
						
					
						
					})
				})
	})
})
 $(function(){
	$.ajaxSetup({
		  async: false
		  });
	//点击一键发货按钮改变状态
	
		
}) 
</script>
<script type="text/javascript">
$(function(){
	$.ajaxSetup({
		  async: false
		  });
//点击全部订单
$("#all").on("click",function(){
	$(".order-status0").remove();
	$.get("${path}GoodsAndOrdersservlet",{"op":"getallbystoreid","storeid":"1"},function(mydata,status){
		//console.log(mydata);
		alert(mydata);
			$.each(mydata.list,function(index,data){
				$(".order-list").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left"+mydata.list[index].ORDERNUM+"'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount'>合计："+data.ORDERTOTALPRICE+"<p>含运费：<span>10.00</span></p>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>交易成功</p><p class='order-info'><a href='${path}orderinfo.jsp'>订单详情</a></p>"
						+"<p class='order-info'><a href='logistics.jsp'>查看物流</a></p></div></li><li class='td td-change'>"
			+"</li></div></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						
						$.each(mydata.list,function(index,data){
							console.log("商品遍历"+data.GOODSIMG);	
							//console.log(data.GOODSPRICE);
								$(".order-left"+mydata.list[index].ORDERNUM).append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
						})			
					
					
					
						
							
						
					
						
					})
				})
	})
})



//点击待付款显示

	$("#wait-pay").on("click",function(){
		alert(1)
		$(".order-status0").remove();
		//$(".td-item").remove();
		$.get("${path}GoodsAndOrdersservlet",{"op":"getwaitnum","storeid":"1","ORDERSTATE":"0"},function(mydata,status){
			
			$.each(mydata.list,function(index,data){
				console.log(data.ORDERNUM);
				$(".order-list1").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left"+mydata.list[index].ORDERNUM+"'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount'>合计："+data.ORDERTOTALPRICE+"<p>含运费：<span>10.00</span></p>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>等待买家付款</p><p class='order-info'><a href='${path}orderinfo.jsp'>取消订单</a></p>"
						+"<p class='order-info'><a href='logistics.jsp'>查看物流</a></p></div></li><li class='td td-change'>"
			+"</li></div></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						
						$.each(mydata.list,function(index,data){
							console.log("商品遍历"+data.GOODSIMG);	
							//console.log(data.GOODSPRICE);
								$(".order-left"+mydata.list[index].ORDERNUM).append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
						})			
					
					
					
						
							
						
					
						
					})
				})
		})
		
	})
	//点击待发货显示
	$("#wait-send").on("click",function(){
		alert(1)
		$(".order-status0").remove();
		$.get("${path}GoodsAndOrdersservlet",{"op":"getwaitnum","storeid":"1","ORDERSTATE":"1"},function(mydata,status){
			
			$.each(mydata.list,function(index,data){
				console.log(data.ORDERNUM);
				$(".order-list2").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount'>合计："+data.ORDERTOTALPRICE+"<p>含运费：<span>10.00</span></p>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>买家已付款</p><p class='order-info'><a href='${path}orderinfo.jsp'>订单详情</a></p>"
						+"</li><li class='td td-change'><div ><button class='am-btn am-btn-danger anniu' value='"+data.ORDERNUM+"' >一键发货</button></div>"
			+"</div></li></div></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						
						$.each(mydata.list,function(index,data){
							console.log("商品遍历"+data.GOODSIMG);	
							//console.log(data.GOODSPRICE);
								$(".order-left").append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
						})			
					
					
					
						
							
						
					
						
					})
				})
		})
		
	})
	$(document).on('click','.am-btn',function(){
		alert(2)
		var ordernum = $(this).val();
		alert(ordernum);
		$(".order-status0").remove();
		$.get("${path}GoodsAndOrdersservlet",{"op":"changestatus","storeid":"1","ORDERSTATE":"1","ordersnum":ordernum},function(mydata,status){
			$.each(mydata.list,function(index,data){
				console.log(data.ORDERNUM);
				$(".order-list2").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left"+mydata.list[index].ORDERNUM+"'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount'>合计："+data.ORDERTOTALPRICE+"<p>含运费：<span>10.00</span></p>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>等待买家付款</p><p class='order-info'><a href='${path}orderinfo.jsp'>取消订单</a></p>"
						+"<p class='order-info'><a href='logistics.jsp'>查看物流</a></p><p class='order-info'><a href='#'>延长收货</a></p></div></li><li class='td td-change'>"
						+"</li></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						
						$.each(mydata.list,function(index,data){
							console.log("商品遍历"+data.GOODSIMG);	
							//console.log(data.GOODSPRICE);
								$(".order-left"+mydata.list[index].ORDERNUM).append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
						})			
					
					
					
						
							
						
					
					})		
					})
				})
		})
		//点击待收货显示
	$("#wait-receive").on("click",function(){
		alert(1)
		$(".order-status0").remove();
		$.get("${path}GoodsAndOrdersservlet",{"op":"getwaitnum","storeid":"1","ORDERSTATE":"2"},function(mydata,status){
			
			$.each(mydata.list,function(index,data){
				console.log("待收货"+data.ORDERNUM);
				$(".order-list3").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left"+mydata.list[index].ORDERNUM+"'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount'>合计："+data.ORDERTOTALPRICE+"<p>含运费：<span>10.00</span></p>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'<p class='Mystatus'>买家未收货</p><p class='order-info'><a href='${path}orderinfo.jsp'>订单详情</a></p>"
						+"<p class='order-info'><a href='logistics.jsp'>查看物流</a></p><p class='order-info'><a href='#'>延长收货</a></p></div></li><li class='td td-change'>"
			+"</li></div></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						
						$.each(mydata.list,function(index,data){
							console.log("商品遍历"+data.GOODSIMG);	
							//console.log(data.GOODSPRICE);
								$(".order-left"+mydata.list[index].ORDERNUM).append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
						})			
					
					
					
						
							
						
					
						
					})
				})
		})
		
	})
	
	//已完成订单
	$("#wait-comm").on("click",function(){
		alert(1)
		$(".order-status0").remove();
		$.get("${path}GoodsAndOrdersservlet",{"op":"getwaitnum","storeid":"1","ORDERSTATE":"1"},function(mydata,status){
			
			$.each(mydata.list,function(index,data){
				console.log(data.ORDERNUM);
				$(".order-list2").append("<div class='order-status0'><div class='order-title'><div class='dd-num'>订单编号：<a href='javascript:;'>"+data.ORDERNUM+"</a></div>"
						+"<span>下单时间："+data.ORDERDATE+"</span></div><div class='order-content'><div class='order-left"+mydata.list[index].ORDERNUM+"'>"
						+"</div><div class='order-right'><li class='td td-amoun'><div class='item-amount'>合计："+data.ORDERTOTALPRICE+"<p>含运费：<span>10.00</span></p>"
						+"</div></li><div class='move-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>买家已付款</p><p class='order-info'><a href='${path}orderinfo.jsp'>订单详情</a></p>"
						+"</li><li class='td td-change'><div ><button class='am-btn am-btn-danger anniu' >一键发货</button></div>"
			+"</div></li></div></div></div></div>");
					$.get("${path}GoodsAndOrdersservlet",{"op":"myget","myordernum":data.ORDERNUM},function(mydata,status){
						
						$.each(mydata.list,function(index,data){
							console.log("商品遍历"+data.GOODSIMG);	
							//console.log(data.GOODSPRICE);
								$(".order-left"+mydata.list[index].ORDERNUM).append("<ul class='item-list'><li class='td td-item'>"
								+"<div class='item-pic'><a href='#' class='J_MakePoint'><img src='"+data.GOODSIMG+"' class='itempic J_ItemImg'></a></div>"
								+"<div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div></div>"
								+"</li><li class='td td-price'><div class='item-price'>"+data.GOODSPRICE+"</div></li><li class='td td-number'><div class='item-number'>"
								+"<span>×</span>"+data.COUNT+"</div></li><li class='td td-operation' ><div class='item-operation'></div></li></ul>");
						})			
					
					
					
						
							
						
					
						
					})
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
						<a href="index.html"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							<li> <a href="information.html">个人信息</a></li>
							<li> <a href="password.html">密码修改</a></li>
							<li> <a href="address.html">地址管理</a></li>
							<!--<li> <a href="cardlist.html">快捷支付</a></li>-->
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="order.html">订单管理</a></li>
							
							<li> <a href="comment.html">评价商品</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>我的资产</p>
						<ul>
							
							<!--<li> <a href="coupon.html">优惠券 </a></li>
							<li> <a href="bonus.html">红包</a></li>-->
							<li> <a href="wallet.html">我的钱包</a></li>
							<!--<li> <a href="bill.html">账单明细</a></li>-->
						</ul>
					</li>

					<!--<li class="person">
						<p><i class="am-icon-tags"></i>我的收藏</p>
						<ul>
							<li> <a href="collection.html">收藏</a></li>
							<li> <a href="foot.html">足迹</a></li>														
						</ul>
					</li>-->

					
				</ul>

			</aside>
		</div>

	</body>
</html>	
