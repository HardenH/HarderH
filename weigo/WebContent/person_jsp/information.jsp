<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
	<head>
	    <% String path=request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort()+request.getContextPath()+"/"; %>
        <%= request.getAttribute("userflag") %>
	
		<meta charset="utf-8">
<!-- 		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0,user-scalable=0"> -->
		<title>hello,world</title>
		
		<link href="<%=path%>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="<%=path%>AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="<%=path%>AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css"
	href=" <%=path%>bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="<%=path%>js/jquery-2.1.0.js"></script>
<script src="<%=path%>bootstrap/js/bootstrap.js" type="text/javascript"
	charset="utf-8"></script>
			
		<script type="text/javascript">
             $(function(){
            	  if("<%=request.getAttribute("userflag")%>"=="true")
            	  {
            		  alert("修改成功!");
            	  }
				  $("#btn_01").click(function(){
					  $("#for_01").submit();
				  });
			});
		</script>	
	</head>
    <body>
		<!--Ã¥Â¤Â´ -->
		<header>
			<article>
				<div class="mt-logo">
					<!--Ã©Â¡Â¶Ã©ÂÂ¨Ã¥Â¯Â¼Ã¨ÂÂªÃ¦ÂÂ¡ -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<a href="#" target="_top" class="h">亲，请登录</a>
									<a href="#" target="_top">免费注册</a>
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

						<div class="nav white">
							<div class="logoBig">
								<li><img src="<%=path%>images/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form>
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="Ã¦ÂÂÃ§Â´Â¢" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">首页</a></li>
                                <li class="qc"><a href="#">闪购</a></li>
                                <li class="qc"><a href="#">限时抢</a></li>
                                <li class="qc"><a href="#">团购</a></li>
                                <li class="qc last"><a href="#">大包装</a></li>
							</ul>
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-info">
						<!--Ã¦Â ÂÃ©Â¢Â -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>

						<!--Ã¥Â¤Â´Ã¥ÂÂ -->
						<div class="user-infoPic">

							<div class="filePic">
								<input type="file" class="inputPic" allowexts="<%=path%>gif,jpeg,jpg,png,bmp" accept="image/*">
								<img class="am-circle am-img-thumbnail" src="<%=path%>images/getAvatar.do.jpg" alt="" />
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>小叮当</i></b></div>
								<div class="u-level">
									<span class="rank r2">
							             <a class="vip1"></s><a class="classes" href="#">铜牌会员</a>
						            </span>
								</div>
								<div class="u-safety">
									<a href="safety.html">
									 账户安全
									<span class="u-profile"><i class="bc_ee0000" style="width: 60px;" width="0">60分</i></span>
									</a>
								</div>
							</div>
						</div>

						<!--Ã¤Â¸ÂªÃ¤ÂºÂºÃ¤Â¿Â¡Ã¦ÂÂ¯ -->
						<div class="info-main">
							<form class="am-form am-form-horizontal" action="<%=path%>UpdateUsers_servlet" id="for_01" method="post">
								<div class="am-form-group">
									<label for="user-name" class="am-form-label">用户名：</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" placeholder="name" name="username">
										<!--这是一个隐藏的提交表单时传的一个值，这个值是用户的id号，到时候需要从登录界面传数到这里，才可以修改指定的id的用户信息  -->
										<input type="hidden" id="user-name2" placeholder="name" name="userid" value="1">
										
                                    </div>
								</div>
								
								<div class="am-form-group">
									<label for="user-name" class="am-form-label">用户电话：</label>
									<div class="am-form-content">
									<input type="text" id="user-name2" placeholder="name" name="userphone">

									</div>
								</div>
								
								<div class="am-form-group">
									<label for="user-name" class="am-form-label">用户状态：</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" placeholder="name" name="userstate">

									</div>
								</div>

                                <div class="am-form-group">
									<label for="user-name" class="am-form-label">真实姓名：</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" placeholder="name" name="realname">

									</div>
								</div>
								
								<div class="am-form-group">
									<label for="user-name" class="am-form-label">省份证件号：</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" placeholder="name" name="usercard">

									</div>
								</div>
								<div class="info-btn">
									<div class="am-btn am-btn-danger" id="btn_01">提交修改</div>
								</div>

							</form>
						</div>

					</div>

				</div>
				<!--Ã¥ÂºÂÃ©ÂÂ¨-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">商城首页</a>
							<a href="#">支付宝</a>
							<a href="#">物流</a>
							<em>© 2015-2025 Hengwang.com 版权所有. 更多模板<a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页末班" target="_blank">网页末班</a></em>
						</p>
					</div>
				</div>
			</div>

			<aside class="menu">
				<ul>
					<li class="person">
						<a href="index.html">个人中心</a>
					</li>
					<li class="person">
						<a href="#">个人资料</a>
						<ul>
							<li class="active"> <a href="information.html">个人信息</a></li>
							<li> <a href="safety.html">安全设置</a></li>
							<li> <a href="address.html">收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的交易</a>
						<ul>
							<li><a href="order.html">订单管理</a></li>
							<li> <a href="change.html">退款售后</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的资产</a>
						<ul>
							<li> <a href="coupon.html">优惠券 </a></li>
							<li> <a href="bonus.html">红包</a></li>
							<li> <a href="bill.html">账单明细</a></li>
						</ul>
					</li>

					<li class="person">
						<a href="#">我的小窝</a>
						<ul>
							<li> <a href="collection.html">收藏</a></li>
							<li> <a href="foot.html">足迹</a></li>
							<li> <a href="comment.html">评价</a></li>
							<li> <a href="news.html">消息</a></li>
						</ul>
					</li>

				</ul>

			</aside>
		</div>

	</body>

</html>