<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="<%=path%>/bootstrap/css/bootstrap-theme.css" />
	<link rel="stylesheet" href="<%=path%>/bootstrap/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="<%=path%>/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="<%=path%>/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=path%>/bootstrap/css/bootstrap.min.css"> 
    
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
           
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <%--  <script type="text/javascript" src="${path}basic/js/jquery-1.9.min.js" ></script> --%>
    <script type="text/javascript" src="${path}layer/layer.js" ></script>
    <script type="text/javascript">
    $(function(){
    	//询问框
		layer.confirm('是否返回个人中心查看', {
		  btn: ['走，去','返回主页'] //按钮
		},  function(){
		  layer.msg('马上为您跳转', {icon: 1});
		  location.href="${path}/person_jsp/information.jsp";
		}, function(){
		  layer.msg('返回主页麽', {
		    time: 20000, //20s后自动关闭
		    btn: ['好吧' , '不了']
		   
		  });
		  location.href="${path}/home_jsp/home.jsp";
		}); 
    })
    </script>
<body>

</body>
</html>