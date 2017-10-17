<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>注册</title>

		<link rel="stylesheet" type="text/css" href="../css/register.css" />
		<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-theme.css" />

		<link rel="stylesheet" href="../basic/css/amazeui.css" />

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

								<div class="col-md-3">
									
								</div>
								
								<!--手机号码-->
								<div class="col-md-9">
									<div class="form-group has-feedback">
										<span class="glyphicon glyphicon-phone form-control-feedback"></span>
										<input type="text" class="form-control" name="r_userName" id="r_userName" value="" placeholder="请输入手机号码"/>
									</div>
								</div>

								<div class="col-md-3">
									
								</div>
								
								<!--密码-->
								<div class="col-md-9">
									<div class="form-group has-feedback">
										<span class="glyphicon glyphicon-lock form-control-feedback"></span>
										<input type="password" class="form-control" name="r_userName" id="r_userName" value="" placeholder="密码(6~16位 可为数字、字母、下划线)" />
									</div>
								</div>

								<div class="col-md-3">
									
								</div>
								
								<!--再次输入密码-->
								<div class="col-md-9">
									<div class="form-group has-feedback">
										<span class="glyphicon glyphicon-lock form-control-feedback"></span>
										<input type="password" class="form-control" name="r_userName" id="r_userName" value="" placeholder="确认密码"/>
									</div>
								</div>

								<div class="col-md-3">
									
								</div>
							</div>
							<div class="login-links">
										<label for="reader-me">
											<input id="reader-me" type="checkbox"> 点击表示您同意商城《服务协议》
										</label>
							  	</div>
							<div id="register" class="register">
								<input type="submit" id="registerbtn" value="注册"></input>
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