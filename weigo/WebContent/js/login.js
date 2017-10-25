$(function() {
	//得到用户名
	var uName = $("#user").text();

	//获取当前网址，如： http://localhost:8083/weigo/home_jsp/home.jsp
	var curWwwPath = window.document.location.href;
	//获取主机地址之后的目录，如： weigo/home_jsp/home.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	//获取主机地址，如： http://localhost:8989
	var localhostPaht = curWwwPath.substring(0, pos);
	//获取带"/"的项目名，如：/weigo
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	//得到了http://localhost:8989/weigo
	var realPath = localhostPaht + projectName;

	/*顶部导航栏 欢迎*/
	$(document).ready(function() {
		//先判断用户是否登录了
		if(uName != "") {
			//将请登录 注册移除
			$(".welcome").remove();
		} else {
			$("#wel_user").remove();
		}
	});

	/*个人中心*/
	$("#personcCenter").click(function() {
		//先判断用户是否登录了
		if(uName != "") {
			//将请登录 注册移除
			location.href = realPath+"/person_jsp/information.jsp";
		} else {
			location.href = realPath+"/home_jsp/login.jsp";
		}
	});

	/*购物车*/
	$("#mc-menu-hd").click(function() {
		//如果user_Id != "" 跳转到购物车中 否则要求用户登录
		if(uName != "") {
			location.href = realPath+"/home_jsp/shopcart.jsp";
		} else {
			location.href = realPath+"/home_jsp/login.jsp";
		}
	});
	
	/*我的钱包*/
	$("#myWallect").click(function  () {
		//如果user_Id != "" 跳转到购物车中 否则要求用户登录
		if(uName != "") {
			location.href = realPath+"/person_jsp/wallet.jsp";
		} else {
			location.href = realPath+"/home_jsp/login.jsp";
		}
	});
	
});