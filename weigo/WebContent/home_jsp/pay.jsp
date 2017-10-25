<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath();
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>结算页面</title>

		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

		<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />

		<link href="../css/jsstyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/address.js"></script>
		<!--
        	begin：新增地址省级市区的js连接
        -->
		<link href="../css/city.css" rel="external nofollow" rel="external nofollow" rel="stylesheet" type="text/css" />
		<script src="../js/jquery-2.1.0.js"></script>
		<script src="../js/distpicker.data.js"></script>
		<script src="../js/distpicker.js"></script>
		<!--
        	end：新增地址省级市区的js连接
        -->
        
        <!--
        	作者：offline
        	时间：2017-10-13
        	描述：订单
        -->
<link href="../css/style2.css" rel="stylesheet" type="text/css" />
<link href="../css/common.css" rel="stylesheet" tyle="text/css" />
<link href="../css/Orders.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="../js/jquery.reveal.js" type="text/javascript"></script>
<script src="../js/jquery.sumoselect.min.js" type="text/javascript"></script>
<script src="../js/common_js.js" type="text/javascript"></script>
<script src="../js/footer.js" type="text/javascript"></script>
<script src="../js/jquery.jumpto.js" type="text/javascript"></script>
<script type="text/javascript" src="${path}/js/jquery-2.1.0.js"></script>
	</head>
	<script type="text/javascript">
	
	
	//地址需要获取的内容
	var Address = "";
	var Receiver="";
	var Receiverphone="";
	
	//购物车视图需要获取的内容
 	var goodsId = "";//商品id
 	var simplePrice = "";//单个商品总价格
	var  goodsCout = "";//单个商品的数量
	var goodsName = "";//商品名称
	var userIds= "";//用户id
	var  storeId= "";//店铺id
	var Orderremark = "";//获取留言内容
	var  Ordernum= "";//订单编号
	
	$(function(){
	<!--ajax区域-->
	function showdata(index,Address){
		var str ="<li class='user-addresslist defaultAddr'>" 
			+"<div class='address-left'>"
			+ "<div class='user DefaultAddr-user '>"
			+"<input type='hidden' id='ADDRESSID' value='"+Address.ADDRESSID+"'>"
			+ "<span class='buy-address-detail'> <span class='buy-user'>"
			+ Address.RECEIVER
			+ "</span> <span class='buy-phone'>"
			+ Address.RECEIVERPHONE
			+ "</span></span></div>"
			+ "<div class='default-address DefaultAddr'>"
			+ "<span class='buy-line-title buy-line-title-type'>"
			+ "收货地址：</span></br> <span class='buy--address-detail'>"
			+ "<span class='street '>"
			+ Address.ADDRESS
			+ "</span></span></div>"
			+ "</div>"
			+ "<div class='address-right'><a href='address.html'>"
			+ "<span class='am-icon-angle-right am-icon-lg'>"
			+ "</span></a></div><div class='clearfix'></div>"
			+ "<div class='new-addr-btn'>"
			+ "<a href='' class='mystate'>设置为默认&nbsp</a>"
			+ "<a href='' class='update'>修改&nbsp</a>"
			+ "<a href='' class='del'>删除</a>"
			+ "</div></li>";
			
			var str2 ="<li class='user-addresslist'>" 
				+"<div class='address-left'>"
				+ "<div class='user DefaultAddr '>"
				+"<input type='hidden' id='ADDRESSID' value='"+Address.ADDRESSID+"'>"
				+ "<span class='buy-address-detail'> <span class='buy-user'>"
				+ Address.RECEIVER
				+ "</span> <span class='buy-phone'>"
				+ Address.RECEIVERPHONE
				+ "</span></span></div>"
				+ "<div class='default-address DefaultAddr'>"
				+ "<span class='buy-line-title buy-line-title-type'>"
				+ "收货地址：</span></br> <span class='buy--address-detail'>"
				+ "<span class='street '>"
				+ Address.ADDRESS
				+ "</span></span></div>"
				+ "</div>"
				+ "<div class='address-right'><a href='address.html'>"
				+ "<span class='am-icon-angle-right am-icon-lg'>"
				+ "</span></a></div><div class='clearfix'></div>"
				+ "<div class='new-addr-btn'>"
				+ "<a href='' class='mystate'>设置为默认&nbsp</a>"
				+ "<a href='' class='update'>修改&nbsp</a>"
				+ "<a href='' class='del'>删除&nbsp</a>"
				+ "</div></li>";
			if(index==0){
				$(".addressdetail").append(str);
				
			}
			else{					
				$(".addressdetail").append(str2);
				 
			}
			
	}

	
	var userId = 1;
	//收货地址动态生成
	$.post("../AddressServlet",{"op":"queryAllAddress","userId":userId},function(listui,status) {
		$.each(listui,function(index,Address) {
			showdata(index,Address);
		});
		
		//点击选择收货地址
		 $(".user-addresslist").on("click",function() {
			$(this).addClass("defaultAddr").siblings().removeClass("defaultAddr");				
		}); 
		
		//删除收货地址
		$(document).on("click",'.del',function(index){
				var userId = 1;
				var AddressId=$(this).parent().parent().find("#ADDRESSID").val();
				//alert(AddressId)
				var flag=confirm("是否要删除该地址");
				if(flag){
					$.post("../AddressServlet",{"op":"querydeleteAddress","userId":userId,"AddressId":AddressId},function(listui, status){
						$.each(listui,function(index,Address) {
							showdata(index,Address);
						});
					});
				}
			});
		//新增收货地址
		$(document).on("click",'.addaddress',function(index){
			$(".addressdetail").empty();
			var userId = 1;
			var address="";
			var receivername= $("#user-name").val();
			var receivertel=$("#user-phone").val();
			var province1alert=$("#province1").val();
			var city1=$("#city1").val();
			var district1=$("#district1").val();
			var user_intro=$("#user-intro").val();
			var addrstate = 0;
			address=province1alert+city1+district1+user_intro;
			$.post("../AddressServlet",{"op":"queryAddress","userId":userId,"ReceiverName":receivername,"ReceiverTel":receivertel,"UserAddress":address,"AddrsState":addrstate},function(listui, status){
				$.each(listui,function(index,Address) {
					showdata(index,Address);
				});
			});
			$(document.body).css("overflow","visible");
			$('.theme-login').removeClass("selected");
			$('.item-props-can').removeClass("selected");					
			$('.theme-popover-mask').hide();
			$('.theme-popover').slideUp(200);				
		});
	});
	
	

		/* 地址ajax结束 */
	
		//顶部导航栏功能 欢迎
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
		
		//完成ajax请求 获取json数据并显示
		   var totalPrice = 0;
		  
		   $.get("../GoodsCarServlet?op=getAllPay",function(list,status){
				//alert("11");
			   //遍历list中data "+VIEW_GOODSCAR.GOODSIMG+"
			    $.each(list,function(index,VIEW_GOODSCAR){
				   $("tbody").append("<tr ><td ><img  src='${path}/"+VIEW_GOODSCAR.GOODSIMG+"' width='80px' height='80px'>"+VIEW_GOODSCAR.GOODSNAME
							+"</td>  <td >"+VIEW_GOODSCAR.GOODSPRICE+"</td> <td>"
							+VIEW_GOODSCAR.GOODSCOUT+"</td><td name='goodsPrice'>"+VIEW_GOODSCAR.GOODSPRICE*VIEW_GOODSCAR.GOODSCOUT
							+"</td><td style='visibility: hidden;'>"+VIEW_GOODSCAR.GOODSCARID
							+"</td> </tr>");
				   totalPrice= totalPrice+VIEW_GOODSCAR.GOODSPRICE*VIEW_GOODSCAR.GOODSCOUT;//总价格计算
				  alert(VIEW_GOODSCAR.GOODSIMG)
				 
				   goodsId = goodsId + VIEW_GOODSCAR.GOODSID+",";//获取商品id
				   simplePrice = simplePrice+VIEW_GOODSCAR.GOODSPRICE*VIEW_GOODSCAR.GOODSCOUT +",";//单个商品的总价格
				   goodsCout =goodsCout + VIEW_GOODSCAR.GOODSCOUT+",";//单个商品数量  
				   userIds =VIEW_GOODSCAR.USERID;//用户id
				   storeId = storeId + VIEW_GOODSCAR.STOREID+",";//店铺id
				  
				   
				 
			    }); 
			    
			    $("#orderPay").text(totalPrice);//写入总价格
			   
		   });
		   
	});
	
	 
	$(function(){
		 
		   /* *********提交订单功能 ***************/
		  // console.log("2"+goodsName);
		   $("#btn-go-commit").click(function  () {
			
			  //获取姓名
			  Receiver =$(".DefaultAddr-user").find(".buy-user").text();
			 // alert("姓名:"+Receiver);
			  //获取电话号码
			  Receiverphone =$(".DefaultAddr-user").find(".buy-phone").text();
			 // alert("手机号:"+Receiverphone);
			  //获取地址
			   Address = $(".defaultAddr").find(".street").text();
			//   alert("地址:"+Address);
			 //获取留言内容
			   Orderremark = $("#orderRemark").val();
			 //  alert("留言:"+Orderremark);
			   
			   //获取订单号 order-num
			   Ordernum=$(".order-num").val();
			 //  alert("订单编号:"+Ordernum);
			   
			   //商品信息的获取 console.log("goods:"+goodsId);
			   /* alert(goodsId);
			   alert(simplePrice);
			   alert(goodsCout);
			   alert(userIds);
			   alert(storeId); */
			  // alert("goodsId1:"+(goodsId.length/2));
			  /* for ( int = 0; int < (goodsId.length/2); int++) {
				  alert("goodsId2:");
				   GoodsId =GoodsId+goodsId +",";
				   SimplePrice =SimplePrice+simplePrice+",";
				   GoodsCout =GoodsCout +goodsCout +",";
				   UserId =UserId +userIds+",";
				   StoreId = StoreId +storeId+",";
				   alert("goodsId3:");
				  */
				  console.log("Receiver:"+Receiver);
				  console.log("Receiverphone:"+Receiverphone);
				  console.log("Address:"+Address);
				  console.log("Receiver"+Receiver);
				  console.log("Receiverphone:"+Receiverphone);
				   console.log("goods:"+goodsId);
				   console.log("SimplePrice:"+simplePrice);
				   console.log("GoodsCout:"+goodsCout);
				   console.log("UserIds:"+userIds);
				   console.log("StoreId:"+storeId); 
			/* }  */
			  
			  /* *****请求OrderServlet***** */
				//alert("正在跳转");
			  /* window.location.href='../OrderServlet?op=queryOrders&Receiver='+Receiver+'&Receiverphone='+Receiverphone
					  +'&Address='+Address+'&Orderremark='+Orderremark+'&Ordernum='+Ordernum+'&GoodsId='+goodsId+'&SimplePrice='+simplePrice
					  +'&GoodsCout='+goodsCout+'&UserId='+userIds+'&StoreId='+storeId;
			 */
			  $.post("../OrderServlet",
					 {"op":"queryOrders","Orderremark":Orderremark,
				  "Ordernum":Ordernum,"Receiver":Receiver,
				  "Receiverphone":Receiverphone,"Address":Address,
				  "goods":goodsId,"SimplePrice":simplePrice,
				  "GoodsCout":goodsCout,"UserIds":userIds,
				  "StoreId":storeId},function(listui,status) {
					 
			  		
		   		});
	});
	});
	</script>
	
	
	
	
	<body>

		<!--顶部导航条 -->
		<div class="am-container header" style="height: 30px;width: 1058px;">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<a href="login.html" target="_top" class="h">亲，请登录</a>
						<a href="register.html" target="_top" class="h">免费注册</a>
						<a id="wel_user" target="_top" >欢迎，<span id="user" >${sessionScope.user}</span></a>
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
				<div class="logo"><img src="../images/mylogo.png" /></div>
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
			<hr style="border-top:2px solid #F03726; margin-top: 0px;"/>
			<div class="concent">
				<!--地址 -->
				<div class="paycont">
					<div class="address">
						<h3>确认收货地址 </h3>
						<div class="control">
							<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
						</div>
						<div class="clear"></div>
						<ul class="addressdetail">
						</ul>

						<div class="clear"></div>
					</div>

					<!--订单内容 -->
					<div class="concent">
						<div id="payTable">
							<h3 >确认订单信息 &nbsp&nbsp&nbsp&nbsp订单编号： <input class="order-num" type="text" disabled="disabled" style="border:0px;background:rgba(0, 0, 0, 0); "/></h3>
							
						<!--产品列表-->
     <div class="Product_List">
      <table>
       <thead>
       <tr class="title">
       <td class="name">商品名称</td>
       <td class="price">商品价格</td>
       <td class="Preferential">商品数量</td>
       <td class="Quantity">金额</td>
       <td class="Money"></td>
       </tr>
       </thead>
       <tbody>
       
       
       <!-- *************************** -->
       
       
       </tbody>
      </table>
      <div class="Pay_info">
       <label>买家留言</label><input name="" type="text"  onkeyup="checkLength(this);" class="text_name" id="orderRemark"/>  <span class="wordage">剩余字数：<span id="sy" style="color:Red;">50</span></span>  
      </div>
      <!--价格-->
      <div class="price_style">
      <div class="right_direction">
        <ul>
         <li><label>订单总价:</label><span id="orderPay"></span></li>
         
     
        </ul>   
      </div>
      </div>
     </div>  
	<div id="holyshit269" class="submitOrder">
		<div class="go-btn-wrap">
		
		<a  href="${path}/person_jsp/order.jsp" class="btn-go" id="btn-go-commit" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
		<a  href="shopcart.jsp" class="btn-go" id="btn-go-cancer" tabindex="0" title="点击此按钮，取消订单" style="margin-right: 15px;">取消订单</a>
				
				</div>
				</div>
				<div class="clear"></div>
				</div>
				</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
				
			</div>
			<hr />
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
			<!--
            	作者：offline
            	时间：2017-10-12
            	描述：新增地址模态窗
            -->
			
			<div class="theme-popover-mask"></div>
			<div class="theme-popover">

				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
				</div>
				<hr/>

				<div class="am-u-md-12">
					<form class="am-form am-form-horizontal">

						<div class="am-form-group">
							<label for="user-name" class="am-form-label">收货人</label>
							<div class="am-form-content">
								<input type="text" id="user-name" placeholder="收货人">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">手机号码</label>
							<div class="am-form-content">
								<input id="user-phone" placeholder="手机号必填" type="email">
							</div>
						</div>

						
						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">所在地</label>
							<div data-toggle="distpicker">
							<div class="am-form-content address">
							  	<select class="am-form-control" id="province1"></select>
 							 	<select class="am-form-control" id="city1"></select>
 							  	<select class="am-form-control" id="district1"></select>
							</div>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-intro" class="am-form-label">详细地址</label>
							<div class="am-form-content">
								<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
								<small>100字以内写出你的详细地址...</small>
							</div>
						</div>

						<div class="am-form-group theme-poptit">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<div class="am-btn am-btn-danger addaddress">保存</div>
								<div class="am-btn am-btn-danger close">取消</div>
							</div>
						</div>
					</form>
				</div>

			</div>

			<div class="clear"></div>
			
			
<script type="text/javascript">
function checkLength(which) {
	var maxChars = 50; //
	if(which.value.length > maxChars){
		alert("您出入的字数超多限制!");
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //250 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
}
</script>

<!--订单编号随机数（有可能重复，得处理）  -->
<script type="text/javascript"> 
window.onload=function(){ 
var o=document.getElementsByClassName('order-num'); 

o[0].value=fRandomBy(00000000, 99999999); 
} 
function fRandomBy(under, over){ 
switch(arguments.length){ 
case 1: return parseInt(Math.random()*under+1); 
case 2: return parseInt(Math.random()*(over-under+1) + under); 
default: return 0; 
} 
}  
</script> 





<script>
/* $(function(){
	$(':input').labelauty();
}); */
</script>
			
			
	</body>

</html>