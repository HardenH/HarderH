<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("path", path);
%>

<html>
aa:${sessionScope.user_Id}
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>账户余额</title>

		<link href="${path}AmazeUI-2.4.2/assets/css/admin2.css" rel="stylesheet" type="text/css">
		<link href="${path}AmazeUI-2.4.2/assets/css/amazeui2.css" rel="stylesheet" type="text/css">

		<link href="${path}css/personal2.css" rel="stylesheet" type="text/css">
		<script src="${path}AmazeUI-2.4.2/assets/js/jquery.min.js"  type="text/javascript"></script>
		<script src="${path}AmazeUI-2.4.2/assets/js/amazeui.js"  type="text/javascript"></script>	
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	//ajax查询账号显示
	 $(function(){
	      // var userid="${sessionScope.user_Id}";
	       userid=1;
	       $("#rechargeaccount0").val(1);
	       $("#withdrawalsaccount0").val(1);
		 $.get("${path}WalletServlet?op=queryBalanceById&userid="+userid,function(pd,status){
		    showData(pd,status);
		    });
	     function showData(pd,status){
	    	
			 $.each(pd,function(pd,bal){
		 $(".financeText").append("<p class=balance>用户账号:<span>"+bal.USERID+"</span></p><p class=mybalance>可用余额:<span id='balance0'>"+bal.BALANCE+"</span></p>");
            
			 });
		} 
	
	 //充值模态框的判定
	 
		 $("#applicaterecharge").click(function(){
    		 var rechargeaccount=$("#rechargeaccount0").val();
    		 var recharge0 = $("#recharge0").val();
    		 if(rechargeaccount==0 | recharge0==0){
    			 alert("请输入充值账号或充值金额");
    			   return;
    			   }
    		 else{
    			 $.get("${path}WalletServlet?op=updrecharge&rechargeaccount="+rechargeaccount+"&recharge0="+recharge0,function(pd,status){
    			 });
        		 alert("提交已申请,请等待管理员审核");
    			 }
		    });
    
	 //提现模态框的判定和提交申请
	
		 $("#applicatewithdrawals").click(function(){
    		 var withdrawalsaccount=$("#withdrawalsaccount0").val();
    		 var withdrawals0 = $("#withdrawals0").val();
    		 if(withdrawalsaccount==0| withdrawals0==0){
    			 alert("请输入提现账号或提现金额");
    			 return;
    		  }
    		 else{
    		var bal=  $("#balance0").text()
    	     bal =parseInt(bal);
    	    if(withdrawals0 > bal){
    			alert("老铁，你的钱没有这么多了");
    			
    		    }
    		else{
    			$.post("${path}WalletServlet?op=updwithdrawals&withdrawalsaccount="+withdrawalsaccount+"&withdrawals0="+withdrawals0,function(pd,status){
      		   });
      		 alert("提交已申请,请等待管理员审核");
    		  }
    		 }
    	 });
    	  });
	</script>
	 </head>

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
								<li><img src="two/images/myslogo.png" /></li>
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
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账户余额</strong> / <small>Account&nbsp;Balance</small></div>
						</div>
						<hr/>	
						<div class="finance">
							<div class="financeText">
							
							</div>
							
							<!-- <div class="financeTip">
							
								<a href="walletlist.html">查看账户明细</a>
								
							</div> -->
							
						</div>
						<div>
							<button type="button" data-toggle='modal' data-target='#myModal' class="btn btn-info btn-md btn-block ">充值</button>
								<button type="button" data-toggle='modal' data-target='#myModal1' class="btn btn-warning btn-md btn-block">提现</button>
								</div>
				</div>
				
					<!-- 申请充值（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal"
	aria-hidden="true">×</button>
<h4 class="modal-title" id="myModalLabel">钱包充值</h4>
</div>
<div class="modal-body">


<div class="row clearfix">
<div class="col-md-12 column"></div>
<div class="col-md-12 column">
<!-- 申请充值的表单 -->
<form class="form-horizontal" role="form" method="" action="" >
<input type="hidden"  id="addressid" name="addressid" />

<div class="form-group"><label for="inputEmail3"
	class="col-md-3 control-label">充值账号：</label>
<div class="col-md-9"><input type="text" class="form-control"
	id="rechargeaccount0" readonly="true" name="rechargeaccount" /></div>
</div>
<div class="form-group"><label for="inputPassword3"
	class="col-md-3 control-label">充值金额：</label>
<div class="col-md-9"><input type="text" class="form-control"
	id="recharge0" name="recharge" /></div>
</div>
<div class="form-group">
<div class="col-sm-offset-3 col-sm-6">
<button type="submit" class="btn btn-success btn-block" id="applicaterecharge">申请充值</button>
</div>

<button type="button" class="btn btn-default" data-dismiss="modal">
关闭</button>
</div>
<div ></div>
</form>
</div>
<div class="col-md-4 column"></div>
</div>
</div></div>
<!-- /.modal-content --></div>
<!-- /.modal-dialog --></div>

					<!-- 申请提现（Modal） -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal"
	aria-hidden="true">×</button>
<h4 class="modal-title" id="myModalLabel">钱包提现</h4>
</div>
<div class="modal-body">
<div class="row clearfix">
<div class="col-md-12 column"></div>
<div class="col-md-12 column">
			
			<!-- 申请提现的表单 -->
<form class="form-horizontal" role="form" method="" action="" >
<input type="hidden"  id="addressid" name="addressid" />

<div class="form-group"><label for="inputEmail3"
	class="col-md-3 control-label">提现账号：</label>
<div class="col-md-9"><input type="text" class="form-control"
	id="withdrawalsaccount0" readonly="true" name="withdrawalsaccount" /></div>
</div>
<div class="form-group"><label for="inputPassword3"
	class="col-md-3 control-label">提现金额：</label>
<div class="col-md-9"><input type="text" class="form-control"
	id="withdrawals0" name="withdrawals" /></div>
</div>
<div class="form-group">
<div class="col-sm-offset-3 col-sm-6">
<button type="submit" class="btn btn-success btn-block" id="applicatewithdrawals">申请提现</button>
</div>

<button type="button" class="btn btn-default" data-dismiss="modal">
关闭</button>
</div>
<div ></div>
</form>
</div>
<div class="col-md-4 column"></div>
</div>
</div></div>
<!-- /.modal-content --></div>
<!-- /.modal-dialog --></div>
					
				
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

				</ul>

			</aside>
		</div>

	</body>

</html>