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
	<meta charset="utf-8">
		<title>个人信息</title>
	</head>
	<link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.css" />
	<link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript">
	$(function() {
		//接收session传过来的值
			$(document).ready(function(){
				var a_phone = $("#a_phone").text();				
			});
		
		
		//对姓名做判断
			$("#a_name").blur(function(){
				// /^([a-zA-Z0-9\u4e00-\u9fa5\·]{1,10})$/
				var reg1 = /^[0-9]{3}$/;
				var username = $("#a_name").val();
				if(reg1.test(username)) {
					$("#a_cardid").attr("readonly",false);
					$("#a_name").attr("readonly",true);
				}else {																				
					
					}	
			})
		//对身份证号做判断
				$("#a_cardid").blur(function(){
					// /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/
					var reg2 = /^[0-9]{3}$/;
					var cardid = $("#a_cardid").val();					
					if(reg2.test(cardid)) {	
						//设置按钮可用
						$("#a_btn").attr("disabled", false);	
						}else {																				
											
							}			
			})
			//点击事件跳转页面
			$("#a_btn").click(function(){
				location.href="apply2.jsp";
				//向userservlet传值
				var userphone = ${sessionScope.a_phone};
				var username = $("#a_name").val();
				var cardid = $("#a_cardid").val();
				
				/* $.get("UserServlet?op=updateuser",{"a_phone":userphone,"a_name":username,"a_cardid":cardid},function(data,status){
					
				}); */
			})
			

})
		
		
    </script>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-4 column">
		</div>
		<form class="form-horizontal" role="form" method="post"
	action="<%=path%>UserServlet?op=updateuser">
		<div class="col-md-4 column">			
				<div class="form-group" name="a_phone">
					 <label >手机号码</label><input id="a_phone" name="a_phone" class="form-control" type="text" value="${sessionScope.a_phone}" readonly="readonly" /> 
					 
				</div>
				<div class="form-group">
					 <label >真实姓名</label><input id="a_name" name="a_name" class="form-control" type="text"  />
				</div>
				<div class="form-group">
					 <label >身份证号</label><input id="a_cardid" name="a_cardid" class="form-control" type="text" readonly/>
				</div>
				
			<button class="btn btn-default" id="a_btn" name="a_btn" type="submit" disabled="disabled" >下一步</button>
			
		</div>
		<div class="col-md-4 column">
		</div>
	</div>
</div>
</body>
</html>