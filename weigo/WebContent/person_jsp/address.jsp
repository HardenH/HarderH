<%@page import="com.etc.weigo.service.AddressService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.etc.weigo.entity.Address"%>
<%@page import="java.util.List"%>
<%@page import="com.etc.weigo.controller.AddressServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("path", path);
%>


<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址管理</title>
<link rel="stylesheet" type="text/css"
	href="${path}bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="${path}js/jquery-2.1.0.js"></script>
<script src="${path}bootstrap/js/bootstrap.js" type="text/javascript"
	charset="utf-8"></script>


<link href="${path}AmazeUI-2.4.2/assets/css/admin2.css" rel="stylesheet"
	type="text/css">
<link href="${path}AmazeUI-2.4.2/assets/css/amazeui2.css" rel="stylesheet"
	type="text/css">

<link href="${path}css/personal2.css" rel="stylesheet" type="text/css">
<link href="${path}css/addstyle.css" rel="stylesheet" type="text/css">
<script src="${path}AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="${path}AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<link href="${path}css/city.css" rel="external nofollow"
	rel="external nofollow" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${path}js/jquery.min.js"></script>
<script type="text/javascript" src="${path}js/city.min.js"></script>

<!--
        	begin：新增地址省级市区的js连接
        -->
		<link href="${path}css/city.css" rel="external nofollow" rel="external nofollow" rel="stylesheet" type="text/css" />
		<script src="${path}js/jquery-2.1.0.js"></script>
		<script src="${path}js/distpicker.data.js"></script>
		<script src="${path}js/distpicker.js"></script>
		<!--
        	end：新增地址省级市区的js连接
        -->


<script type="text/javascript">
$(function(){
 //$("#addressinfo").click(function(){
	//Windows.load="AddressServlet?op=queryaddress";
//});	
 //
$(".addedit2").click(function(){
	
	//alert($(".city1").text());
	$("#addreceiver0").val($("#name2").text());
	$("#addphone0").val($("#phone2").text());
	$("#detailadd0").val($("#detailadd2").text());
});
 //编辑框的动态取值
$(document).on("click",".addedit1",function(){
     //alert($(".city1").text());
	var addreceiver=$(this).parents("li").find(".name1").text();
	$("#addreceiver0").val(addreceiver);
	var addreceiverphone= $(this).parents("li").find(".phone1").text();
	$("#addphone0").val(addreceiverphone);
	var address= $(this).parents("li").find(".detailadd1").text();
	$("#detailadd0").val(address);
	var addressid=   $(this).find("input").val();
	$("#addressid").val(addressid);
});
 
$(document).on("click",".deladdress",function(){
	var addressid=$(this).attr('value');
	var flag=confirm("是否确认删除?");
	if(flag==true){
		location.href="${path}AddressServlet?op=deladdressbyaddressid&addressid="+addressid;
		alert("删除成功");
	}
	else{
		alert("无效的操作");
	}
	
});


});
   //手机号码的正则判定
function checkPhone(){ 
    var phone1 = document.getElementById('user-phone').value;
    if(!(/^1(3|4|5|7|8)\d{9}$/.test(phone1))){ 
        alert("手机号码有误，请以13,5,7,8开头的11位有效号码");  
        return false; 
    } else{
    	alert("保存成功");
    	return true;}}
                     
function checkPhone1(){ 
	 var phone3 = document.getElementById('addphone0').value;
    if(!(/^1(3|4|5|7|8)\d{9}$/.test(phone3))){ 
    	 alert("手机号码有误，请以13,5,7,8开头的11位有效号码"); 
        return false; 
    } else{
    	alert("保存成功");
    	return true;}
                }
  //删除的确认操作
//function deladdress(){
	//var addressid = $("[name=addressid]").val();
	
	//var flag=confirm("是否确认删除?");
	//if(flag==true){
		//location.href="${path}AddressServlet?op=deladdressbyaddressid&addressid="+addressid;
		//alert("删除成功");
	//}
	//else{
		//alert("无效的操作");
	//}
	
//}
</script>

<%
//加载页面时的查询方法的调用
 /*  List<Address> lt= new ArrayList<Address>();
  AddressService as=new AddressService();
  int userid=0;
  lt=as.getinfo(userid); */
%>


</head>
<script type="text/javascript">
//ajax查询地址数据遍历
$(function(){
	var userid=0;
	$.get("${path}AddressServlet?op=queryaddress&userid="+userid+"",function(pd,status){
		showDate(pd,status);
	   });
	
});
function showDate(pd,status){
    $.each(pd,function(index,add){
    	   var i=add.ADDRSTATE;
    	  if(i==0){
    		  $(".ul").append("<li class='user-addresslist defaultAddr'><span class='hidden userid'>"+add.USERID+"</span><span class='hidden addressid'>"+add.ADDRESSID+"</span><span class='new-option-r'><i class='am-icon-check-circle'></i>默认地址</span> <p class='new-tit new-p-re'> <span class='new-txt name1' id='name1'>"+add.RECEIVER+"</span> <span class='new-txt-rd2 phone1' id='phone1'>"+add.RECEIVERPHONE+"</span> </p> <div class='new-mu_l2a new-p-re'> <p class='new-mu_l2cw detailadd1' id='detailadd1'>"+add.ADDRESS+"</p> </div> <div class='new-addr-btn'> <a data-toggle='modal' data-target='#myModal' class='addedit1'>编辑<input type='hidden' name ='addressid' value='"+add.ADDRESSID+"'   /></a> <span class='new-addr-bar'>|</span> <a href='javascript:void(0);' onclick='deladdress();' class='deladdress' value='"+add.ADDRESSID+"'><i class='am-icon-trash'></i>删除</a> </div></li>"); 
    	    }
    	  else{
    		  $(".ul").append("<li class='user-addresslist '><span class='hidden userid'>"+add.USERID+"</span><span class='hidden addressid'>"+add.ADDRESSID+"</span><span class='new-option-r'><i class='am-icon-check-circle'></i>默认地址</span> <p class='new-tit new-p-re'> <span class='new-txt name1' id='name1'>"+add.RECEIVER+"</span> <span class='new-txt-rd2 phone1' id='phone1'>"+add.RECEIVERPHONE+"</span> </p> <div class='new-mu_l2a new-p-re'> <p class='new-mu_l2cw detailadd1' id='detailadd1'>"+add.ADDRESS+"</p> </div> <div class='new-addr-btn'> <a data-toggle='modal' data-target='#myModal' class='addedit1'>编辑<input type='hidden' name ='addressid' value='"+add.ADDRESSID+"'   /></a> <span class='new-addr-bar'>|</span> <a href='javascript:void(0);' onclick='deladdress();' class='deladdress' value='"+add.ADDRESSID+"' ><i class='am-icon-trash'></i>删除</a> </div></li>");  
    		  
    	  }   
    	});
  }</script>


<body>
   <!--头 -->
	<header> <article>
	<div class="mt-logo">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<a href="#" target="_top" class="h">亲，请登录</a> <a href="#"
							target="_top">免费注册</a>
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
						<a id="mc-menu-hd" href="#" target="_top"><i
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
			<div class="logoBig">
				<li><img src="two/images/logobig.png" /></li>
			</div>

			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form>
					<input id="searchInput" name="index_none_header_sysc" type="text"
						placeholder="搜索" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div>
        <div class="clear"></div>
	</div>
	</div>
	</article> </header>


	<b class="line"></b>

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-address">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small>
						</div>
					</div>
					<hr />
				  <ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails ul" id="ul">
                      
						
                         </ul>
                         <div class="clear"></div>
					<a class="new-abtn-type"
						data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
					<!--例子-->
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">

						<div class="add-dress">

							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px; margin-left:80px; ">
					
				       	  
								<form class="am-form am-form-horizontal" method="post" action="${path}AddressServlet?op=addAddress" onsubmit="return checkPhone();">
                                  
									<div class="am-form-group">
										<label for="user-name" class="am-form-label">收货人</label>
										<div class="am-form-content">
											<input type="text" id="user-name" name="receiver"
												value="">
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">手机号码</label>
										<div class="am-form-content">
											<input id="user-phone"  type="text"
												name="receiverphone" value="">
										</div>
									</div>
									<div class="am-form-group">
											<label for="user-address" class="am-form-label">所在地址</label>
											<div data-toggle="distpicker">
							<div class="am-form-content address">
							  	<select class="am-form-control" id="province1" name="province1"></select>
 							 	<select class="am-form-control" id="city1" name="city1"></select>
 							  	<select class="am-form-control" id="district1" name="district1"></select>
							</div>
							</div>
										</div>
									
									
									
									    <div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content">
										
										<input type="text" name="address" value="">
										</div>
									</div>
									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3" style="margin-left:50px;">
											
                                            <input type="submit" value="保存" class="am-btn am-btn-danger"  />                   
												<a class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
										</div>
									</div>
								</form>
								
							</div>

						</div>

					</div>
                 <!-- 模态框 （Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal"
	aria-hidden="true">×</button>
<h4 class="modal-title" id="myModalLabel">地址编辑</h4>
</div>
<div class="modal-body">


<div class="row clearfix">
<div class="col-md-12 column"></div>
<div class="col-md-12 column">
<!-- 编辑表单的开始 -->
<form class="form-horizontal" role="form" method="post" action="${path}AddressServlet?op=updAddress" onsubmit="return checkPhone1();" >
<input type="hidden"  id="addressid" name="addressid" />

<div class="form-group"><label for="inputEmail3"
	class="col-md-3 control-label">收货人</label>
<div class="col-md-9"><input type="text" class="form-control"
	id="addreceiver0" name="updreceiver" /></div>
</div>
<div class="form-group"><label for="inputPassword3"
	class="col-md-3 control-label">联系方式</label>
<div class="col-md-9"><input type="text" class="form-control"
	id="addphone0" name="updphone" /></div>
</div>
<div class="form-group"><label for="inputPassword3"
	class="col-md-3 control-label">详细地址</label>
<div class="col-md-9"><textarea class="form-control"
	id="detailadd0" name="updadd"></textarea></div>
</div>



<div class="form-group">
<div class="col-sm-offset-3 col-sm-6">
<button type="submit" class="btn btn-success btn-block" id="phonecheck">提交</button>
</div>

<button type="button" class="btn btn-default" data-dismiss="modal">
关闭</button>
</div>
<div >

</div>
</form>
</div>
<div class="col-md-4 column"></div>
</div>


</div>

</div>
<!-- /.modal-content --></div>
<!-- /.modal-dialog --></div>
				
					
				</div>
                 <!-- 动态的css特效-->
				<script type="text/javascript">
					 $(document).ready(
							function() {
								$(".new-option-r").click(
										function() {
											$(this).parent('.user-addresslist')
													.addClass("defaultAddr")
													.siblings().removeClass(
															"defaultAddr");
										});
								var $ww = $(window).width();
								if ($ww > 640) {
									$("#doc-modal-1").removeClass(
											"am-modal am-modal-no-btn")
								}
							}) 
							$(document).on("click",".new-option-r",function(){
								$(this).parent('.user-addresslist')
								.addClass("defaultAddr")
								.siblings().removeClass(
										"defaultAddr");
								var $ww = $(window).width();
								if ($ww > 640) {
									$("#doc-modal-1").removeClass(
											"am-modal am-modal-no-btn")
								}
							
								var userid= $(this).parent('.user-addresslist').find(".userid").text();
								var addressid=$(this).parent('.user-addresslist').find(".addressid").text();
								
								$.get("../AddressServlet?op=updaddresstate&userid="+userid+"&addressid="+addressid,function(ps,status){
									
									showData(pd,status);
									
								});
								
							}); 
					 
					 
					 
						</script>

				<div class="clear"></div>

			</div>
			<!--底部-->
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

		<aside class="menu">
				<ul>
					<li class="person active">
						<a href="${path}person_jsp/index.jsp"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							<li> <a href="${path}person_jsp/information.jsp">个人信息</a></li>
							<li> <a href="${path}person_jsp/password.jsp">密码修改</a></li>
							<li> <a href="${path}person_jsp/address.jsp">地址管理</a></li>
							<!--<li> <a href="cardlist.html">快捷支付</a></li>-->
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="${path}person_jsp/order.jsp">订单管理</a></li>
							
							<li> <a href="${path}person_jsp/comment.jsp">评价商品</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>我的资产</p>
						<ul>
							
							
							<li > <a href="${path}person_jsp/wallet.jsp">我的钱包</a></li>
							
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