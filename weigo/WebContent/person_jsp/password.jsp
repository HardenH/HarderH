
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.etc.weigo.entity.Password"%>
<%@page import="com.etc.weigo.service.PasswordService"%>
<%@page import="com.etc.weigo.controller.PasswordServlet"%>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("path", path);
%>
<html>
     <head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>修改密码</title>

		<link href="${path}AmazeUI-2.4.2/assets/css/admin2.css" rel="stylesheet" type="text/css">
		<link href="${path}AmazeUI-2.4.2/assets/css/amazeui2.css" rel="stylesheet" type="text/css">
		<link href="${path}css/personal2.css" rel="stylesheet" type="text/css">
		<link href="${path}css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="${path}js/jquery-1.7.2.min.js"></script>
		<script src="${path}AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
        <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
        　　
         <style type="text/css">
         
			.error{color:red}
         </style>
         <!--获取用户信息和密码-->
         <%List<Password> lt =new ArrayList<Password>(); 
	    PasswordService ps= new PasswordService();
	    int userid=1;
	    lt = ps.queryPassword(userid);
	   %>
          <script type="text/javascript">
		  //密码的验证
		$(function(){
			
			/* var oldpwd=$("#user-old-password").val();
			var newpwd=$("#user-new-password").val();
			var confirmpwd=$("#user-confirm-password").val();
			 */
			 $("#changePwd-form").validate({
				 rules:{
					 oldpwd:{
						 required:true,
							minlength:6,
							maxlength:16
					 },
						 newpwd:{
							required:true,
							minlength:6,
							maxlength:16
						},
						newpwd2:{
							required:true,
							minlength:6,
							maxlength:16,
							equalTo: "#newpwd"
						},
					},
					 messages: {
					      
						 oldpwd: {
					        required: "请输入原密码",
					        minlength: "请至少输入6位字符",
					        maxlength:"已超出16位字符"
					      },
					      newpwd: {
					    	  required: "请输入新密码",
						        minlength: "请至少输入6位字符",
						        maxlength:"已超出16位字符"
					      },
					      newpwd2: {
					    	  required: "请输入确认密码",
						        minlength: "请至少输入6位字符",
						        maxlength:"已超出16位字符",
						        	equalTo: "两次密码输入不一致"
					      }
					    },
					
					onkeyup:false,
					focusCleanup:true,
					success:"valid",
					 /* submitHandler:function(form){ */
						/* $(form).ajaxSubmit({ //jquery的ajax提交表单方法
							success:function(data){ //请求成功
									console.log(data);		
									layer.msg('操作成功!',{icon: 1,time:500},function(){
										
										var index = parent.layer.getFrameIndex(window.name);
										
										parent.afterajaxreload();
										parent.layer.close(index); //关闭当前窗口
										
									});				
							},
							error:function()//请求失败 例如数据库异常发生
							{
								layer.msg('操作失败!',{icon: 5,time:500});
							}
						}); */
						
					/* } */
			 })
			});
		</script>
		<script type="text/javascript">
		//与数据库中的数据判定验证用户密码
		  function check(form){
			var orclpwd= $("#orclpwd").text();
			var oldpwd =$("#oldpwd").val();
			 if(orclpwd !=oldpwd){
				 alert("您输入的密码与原密码不一致");
				 return false;
				}
				 else{
					 alert("恭喜，密码是对的");
					 return true;
				 }
			 }
			 
		
		
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
								<li><img src="two/images/mylogo.png" /></li>
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

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<!--得到用户的密码-->
					<a:if test="<%=lt!=null%>">
					<a:forEach items="<%=lt %>" var="pwd">
				<form class="am-form am-form-horizontal" id="changePwd-form"  method="post" action="${path}PasswordServlet?op=updpassword"> 
						<div class="am-form-group">
							<label for="user-old-password" class="am-form-label" >原密码</label>
							<div class="am-form-content">
								<input type="password" id="oldpwd" name="oldpwd" placeholder="请输入原密码">
                                <P hidden="hidden" id="orclpwd">${pwd.USERPWD}</P>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-new-password" class="am-form-label ">新密码</label>
							<div class="am-form-content newpwd1">
								<input type="password" id="newpwd" name="newpwd" placeholder="由数字、字母组合"><p id="mmsg"></p>
								
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-confirm-password" class="am-form-label">确认密码</label>
							<div class="am-form-content">
								<input type="password" id="user-confirm-password" placeholder="请再次输入上面的密码" name="newpwd2">
							</div>
						</div>
						<div class="info-btn">
						<!-- <button type="submit" class="am-btn am-btn-danger" id="">保存修改</button> -->
							<!-- <div class="am-btn am-btn-danger" id="keepupd">保存修改</div> -->
							<button  type="submit" class="am-btn am-btn-danger" id="keepupd" onclick="return check(this.form)" >保存修改</button> 
						</div>

					 </form>
					 
					  </a:forEach>
					  </a:if> 

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