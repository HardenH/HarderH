<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人资料</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin2.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui2.css" rel="stylesheet" type="text/css">

		<link href="../css/personal2.css" rel="stylesheet" type="text/css">
		<link href="../css/infstyle2.css" rel="stylesheet" type="text/css">
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>	
		<script src="../js/jquery-2.1.0.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-theme.css" />
		
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
		#goodsname{  height: 50px;width: 500px;border-radius: 3px;}
        #goodscount{  height: 50px;width: 500px;border-radius: 3px;}     
        #goodsprice{  height: 50px;width: 500px;border-radius: 3px;}     
        #goodstype{  height: 50px;width: 500px;border-radius: 3px;}    
        #goodsdetail{  height: 50px;width: 500px;border-radius: 3px;}   
        #goodsstate{  height: 50px;width: 500px;border-radius: 3px;}
        #issaw{  height: 50px;width: 500px;border-radius: 3px;}
        #js{margin-left: 670px; }
        
	</style>
		
		
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

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">商品管理</strong></div>
							<div id="js">
								
							<input type="button" class="btn-success" name="" id="" value="检索" />
							<input type="text"   placeholder="商品检索"/>
							</div>
						</div>
						<hr/>

						
	        
	
			<div class="tabbable" id="tabs-906123">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-241804" data-toggle="tab">全部</a>
					</li>
					<li class="">
						 <a href="#panel-736901" data-toggle="tab">出售中</a>
					</li>
					<li >
						 <a href="#panel-542397" data-toggle="tab">已售完</a>
					</li>
					<li >
						 <a href="#panel-793266" data-toggle="tab">已下架</a>
					</li>
					<a id="modal-517176" href="#modal-container-517176" role="button" class="btn" data-toggle="modal">商品添加</a>
			
			<div class="modal fade" id="modal-container-517176" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<hr />
							<p class="" id="myModalLabel">
								商品名称：
								<input type="text "id="goodsname"  class="" />
							</p>
							
						</div>
						<hr />
						<div class="">
							<p>
						   商品数量：<input type="text" id="goodscount" />
							</p>
						</div>
						<hr />
						<div class="">
							<p>
							商品价格：<input type="text" id="goodsprice"/>
							</p>
						</div>
						<hr />
						<div class="">
							<p>
							商品类型：<select id="goodstype">
								<option value="1">日用品</option>
								<option value="2">食品</option>
								
							</select>
							</p>
						</div>
					
						<!--<div class="">
							<p>
							销售量：<input type="text" readonly="readonly" value="0" />
							</p>
						</div>-->
						<hr />
						<div class="">
							<p>
						 商品描述：<textarea class="" rows="3" id="user-intro" placeholder="商品描述详情" id="goodsdetail"></textarea>
							</p>
						</div>
						<hr />
						<div class="">
							<p>
							商品状态：<select id="goodsstate">
								<option value="1">上架</option>
								<option value="2">下架</option>
								
							</select>
							</p>
						</div>
						<hr />
						<div class="">
							<p>
							是否可见：<select id="issaw">
								<option value="1">可见</option>
								<option value="2">不可见</option>
								
							</select>
							</p>
						</div>
					
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="button" class="btn btn-primary">保存</button>
						</div>
					</div>
					
				</div>
				
			</div>
					
					
	
				</ul>
				
				
				
				<div class="tab-content">
					<div class="tab-pane active" id="panel-241804">
						<p>
						暂无商品
						</p>
					</div>
					<div class="tab-pane " id="panel-736901">
						<p>
							csc
						</p>
					</div>
					
					<div class="tab-pane" id="panel-542397">
						<p>
							542397
						</p>
					</div>
					<div class="tab-pane" id="panel-793266">
						<p>
						793266
						</p>
					</div>
					
				</div>
			</div>
	
	

					

						<!--个人信息 -->
						<div class="info-main">
							<form class="am-form am-form-horizontal">

								<div class="am-form-group address">
									<label for="user-address" class="am-form-label">收货地址</label>
									<div class="am-form-content address">
										<a href="address.html">
											<p class="new-mu_l2cw">
												<span class="province">湖北</span>省
												<span class="city">武汉</span>市
												<span class="dist">洪山</span>区
												<span class="street">雄楚大道666号(中南财经政法大学)</span>
												<span class="am-icon-angle-right"></span>
											</p>
										</a>

									</div>
								</div>
								<div class="am-form-group safety">
									<label for="user-safety" class="am-form-label">账号安全</label>
									<div class="am-form-content safety">
										<a href="safety.html">

											<span class="am-icon-angle-right"></span>

										</a>

									</div>
								</div>
								

							</form>
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
							<li> <a href="information-sale.html">个人信息</a></li>
							<li> <a href="safety.html">安全设置</a></li>
							<li> <a href="address.html">地址管理</a></li>
							<!--<li> <a href="cardlist.html">快捷支付</a></li>-->
						</ul>
					</li>
					
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的店铺</p>
						<ul>
							<li><a href=" information-storge.html">店铺管理</a></li>
							<li> <a href="goodsmanage.html">商品管理</a></li>
							
						</ul>
					</li>
					
					
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="order.html">订单管理</a></li>
							<li> <a href="change.html">退款售后</a></li>
							<li> <a href="comment.html">评价商品</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>我的资产</p>
						<ul>
							<li> <a href="points.html">我的积分</a></li>
							<!--<li> <a href="coupon.html">优惠券 </a></li>
							<li> <a href="bonus.html">红包</a></li>-->
							<li> <a href="walletlist.html">账户余额</a></li>
							<li> <a href="bill.html">账单明细</a></li>
						</ul>
					</li>

					<!--<li class="person">
						<p><i class="am-icon-tags"></i>我的收藏</p>
						<ul>
							<li> <a href="collection.html">收藏</a></li>
							<li> <a href="foot.html">足迹</a></li>														
						</ul>
					</li>-->

					<li class="person">
						<p><i class="am-icon-qq"></i>在线客服</p>
						<ul>
							<li> <a href="consultation.html">商品咨询</a></li>
							<li> <a href="suggest.html">意见反馈</a></li>							
							
							<li> <a href="news.html">我的消息</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>

	</body>

</html>