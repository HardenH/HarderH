<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>登录</title>

		<link rel="stylesheet" type="text/css" href="../css/register.css" />
		<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="../bootstrap/css/bootstrap-theme.css" />

		<link rel="stylesheet" href="../basic/css/amazeui.css" />

	</head>

	<script language="javascript" type="text/javascript">
		var code;

		function createCode() {
			code = "";
			var codeLength = 4; //验证码的长度
			var checkCode = document.getElementById("checkCode");
			var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
			for(var i = 0; i < codeLength; i++) {
				var charNum = Math.floor(Math.random() * 52);
				code += codeChars[charNum];
			}
			if(checkCode) {
				checkCode.className = "code";
				checkCode.innerHTML = code;
			}
		}

		function validateCode() {
			var inputCode = document.getElementById("inputCode").value;
			if(inputCode.length <= 0) {
				alert("请输入验证码！");
			} else if(inputCode.toUpperCase() != code.toUpperCase()) {
				alert("验证码输入有误！");
				createCode();
			} else {
				alert("验证码正确！");
			}
		}
		window.onload = createCode;
	</script>

	<body>

		<!--头部-->
		<header>
			<div class="container">
				<img src="../images/微gologo.png" />
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
						<div class="login_panel">
							<div class="title">
								<h3>登录</h3>

							</div>
							<br />
							<div class="reg_form">
								<!--用户名-->
								<div class="col-md-12">
									<div class="form-group has-feedback">
										<span class="glyphicon glyphicon-user form-control-feedback"></span>
										<input type="text" class="form-control" name="l_userName" id="l_userName" value="" placeholder="请输入账号" />
									</div>
								</div>

								<!--密码-->
								<div class="col-md-12">
									<div class="form-group has-feedback">
										<span class="glyphicon glyphicon-lock form-control-feedback"></span>
										<input type="password" class="form-control" name="l_userName" id="l_userName" value="" placeholder="密码(6~16位 可为数字、字母、下划线)" />
									</div>
								</div>

								<!--验证码-->
								<div class="col-md-12">
									<div class="form-group has-feedback">
										<span class="glyphicon glyphicon-comment form-control-feedback"></span>
										<input type="text" class="form-control" name="l_code" id="l_code" value="" placeholder="请输入验证码" />
										<div class="code" id="checkCode" onclick="createCode()"></div>
									</div>
								</div>
								
								<div class="l_remember">
									<div class="col-md-6">
										<label for="remember-me"><input id="remember-me" type="checkbox">记住密码</label>
									</div>
									
									<div class="col-md-6">
										<a href="#" onclick="createCode()"  id="verifyflash">看不清换一张</a>
									</div>
								</div>
							</div>
							<div id="register" class="register">
								<input type="submit" id="login_btn" value="登录"></input>
								<span id="toregister"><a href="register.html">注册</a>&nbsp;|<a>忘记密码？</a></span>
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