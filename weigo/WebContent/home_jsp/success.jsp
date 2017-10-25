<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>付款成功页面</title>
<link rel="stylesheet"  type="text/css" href="../AmazeUI-2.4.2/assets/css/amazeui.css"/>
<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="../css/sustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>

</head>

<body>


<!--顶部导航条 -->
<div class="am-container header">
  <ul class="message-l">
    <div class="topMessage">
     <div class="menu-hd">
       <a href="#" target="_top" class="h">亲，请登录</a>
       <a href="#" target="_top">免费注册</a>
     </div></div>
  </ul>
  <ul class="message-r">
    <div class="topMessage home"><div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div></div>
    <div class="topMessage my-shangcheng"><div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div></div>
    <div class="topMessage mini-cart"><div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div></div>
    <div class="topMessage favorite"><div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
  </ul>
</div>

<!--悬浮搜索框-->

<div class="nav white">
	<div class="logo"><img src="../images/logo.png" /></div>
    <div class="logoBig">
      <li><img src="../images/mylogo.png" /></li>
    </div>
    
    <div class="search-bar pr">
        <a name="index_none_header_sysc" href="#"></a>       
        <form>
        <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
        <input id="ai-topsearch" class="submit" value="搜索" index="1" type="submit"></form>
    </div>     
</div>

<div class="clear"></div>

<hr style="border-top:2px solid #F03726; margin-top: 0px;"/>

<div class="take-delivery">
 <div class="status">
   <h2>您已成功付款</h2>
   <div class="successInfo">
     <ul>
       <li>付款金额<em>¥9.90</em></li>
       <div class="user-info">
         <p>收货人：艾迪</p>
         <p>联系电话：15871145629</p>
         <p>收货地址：湖北省 武汉市 武昌区 东湖路75号众环大厦</p>
       </div>
             请认真核对您的收货信息，如有错误请联系客服
                               
     </ul>
     <div class="option">
       <span class="info">您可以</span>
        <a href="../person/order.html" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
        <a href="../person/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a>
     </div>
    </div>
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


</body>
</html>
