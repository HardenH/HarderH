<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getScheme() + "://" + request.getServerName()
			+ ":" + request.getLocalPort() + request.getContextPath()
			+ "/";		
	pageContext.setAttribute("path",path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/register.css" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="../jsx`/jquery.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-theme.css" />
<title>注册啊</title>
<script type="text/javascript">
    
$(function(){	
		//失去焦点事件 验证用户名是否存在
	$("#r_userName").blur(function(){
		var r_userName = $("#r_userName").val();
		
		$.get("${path}UserServlet?op=r_userName",{"r_userName":r_userName},function(data0,status){
			
			
			
			$("#r_userName02").html(data0);
			
		});
	});
	
	//验证电话号码是否合法
	$("#r_userPhone").blur(function(){
		var r_userPhone = $("#r_userPhone").val();		
		$.get("${path}UserServlet?op=r_userPhone",{"r_userPhone":r_userPhone},function(data1,status){          
			
			$("#r_userPhone02").text(data1);	
			
		})
	})
	//验证密码
	$("#r_password").blur(function(){
		var r_password = $("#r_password").val();  		
		$.get("${path}UserServlet?op=r_password",{"r_password":r_password},function(data2,status){ 
			
			$("#r_password02").text(data2);        				
		}); 
});
	//验证密码是否一致
	$("#r_passwordrepeat").blur(function(){
		var pwdrepeat = $("#r_passwordrepeat").val();  
		var password = $("#r_password").val(); 
		$.get("${path}UserServlet?op=pwdrepeat",{"r_passwordrepeat":pwdrepeat,"r_password":password},function(data3,status){        			 
			$("#r_passwordrepeat02").html(data3);  
		}); 
});	
	//协议
	$("#reader-me").on("click",function(){
		if(this.checked){
			//console.log("1111");
			/* alert($("#r_userName02").html());
			alert($("#r_userPhone02").text());
			alert($("#r_password02").text());
			alert($("#r_passwordrepeat02").html()); */
			//如果四种状态都正确，做出判断，更改按钮状态设置为可点击
			if($("#r_userName02").html()=="可以使用"&&$("#r_userPhone02").text()=="格式正确，可以使用"&&$("#r_password02").text()=="可以使用"&&$("#r_passwordrepeat02").html()=="设置成功"){
				$("#registerbtn").attr("disabled", false);
				//alert($("#r_passwordrepeat02").html());
				//console.log("2222");
			}
		}
		else{
			
			$("#registerbtn").attr("disabled", true);
			//console.log("3333");
		
		}
	})
	//设置按钮不可用
	//$("#registerbtn").attr("disabled", true);  
	
		
		//if($("#r_userPhone02").text())
	//}
	
})


</script>

</head>
<body>
<!--头部-->
		<header>
			<div class="container">
				<img src="../images/微gologo.png"/>
			</div>
		</header>
		<div class="reg_box">
			<div class="container">
				<div class="row">
					<!--左侧 图片-->
					<div class="col-md-6">
						<img src="../images/big.jpg" />
					</div>

					<!--右侧 表单-->
					<div class="col-md-6">
						<div class="reg_panel">
						<!-- 表单的提交 -->
						<form class="form-horizontal" role="form" method="post"
	action="<%=path%>UserServlet?op=addUser">
							<div class="title">
								<h3>注册</h3>
								
							</div>
							<br />
							<div class="reg_form">
								<!--用户名-->
								<div class="col-md-9">
									<div class="form-group has-feedback">
										<span class="glyphicon glyphicon-user form-control-feedback"></span>
										<input type="text" class="form-control" name="r_userName" id="r_userName" value="" placeholder="请输入用户名" />
										
									</div>
								</div>

								<div class="col-md-3" id="r_userName02">
									
								</div>
								
								<!--手机号码-->
								<div class="col-md-9">
									<div class="form-group has-feedback">
										<span class="glyphicon glyphicon-phone form-control-feedback"></span>
										<input type="text" class="form-control" name="r_userPhone" id="r_userPhone" value="" placeholder="请输入手机号码"/>
									</div>
								</div>

								<div class="col-md-3" id="r_userPhone02">
									
								</div>
								
								<!--密码-->
								<div class="col-md-9">
									<div class="form-group has-feedback">
										<span class="glyphicon glyphicon-lock form-control-feedback"></span>
										<input type="password" class="form-control" name="r_password" id="r_password" value="" placeholder="密码(6~16位 可为数字、字母、下划线)" />
									</div>
								</div>

								<div class="col-md-3" id="r_password02">
									
								</div>
								
								<!--再次输入密码-->
								<div class="col-md-9">
									<div class="form-group has-feedback">
										<span class="glyphicon glyphicon-lock form-control-feedback"></span>
										<input type="password" class="form-control" name="r_passwordrepeat" id="r_passwordrepeat" value="" placeholder="确认密码"/>
									</div>
								</div>

								<div class="col-md-3" id="r_passwordrepeat02">
									
								</div>
							</div>
							<div class="login-links">
										<label for="reader-me">																					
                                         <input id="reader-me" type="checkbox" > 点击表示您同意商城《服务协议》                                           
										</label>
							  	</div>
							<div id="register" class="register">
							
								<input type="submit" id="registerbtn" value="注册" disabled=""></input>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--底部-->
		<!--//footer-->
		<div class="footer-bottom">
			<div class="container">
				<p class="footer-copyright">
					Copyright &copy; 2000-2017 HARDER国际有限公司，保留一切权利。｜
					<a class="footer-beiAn" target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010502032052">京公网安备 11010502032052号</a>关于我们 |联系我们 |加入我们 |用户帮助 |微店联盟 |隐私声明
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
		<!-- //footer -->

</body>
</html>