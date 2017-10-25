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
	<meta charset="utf-8">
		<title>店铺信息</title>
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
        	 //对店铺名字的验证
        	 $("#a_storename").blur(function(){ 
        		 ///^([a-zA-Z0-9\u4e00-\u9fa5\·]{1,9})$/
        		 var reg = /^([a-zA-Z0-9\u4e00-\u9fa5\·]{1,9})$/;
        		 var storename = $("#a_storename").val();
        		 if(reg.test(storename)){
        			 //复选框可以被选中        			
        			 $("#reader-me").attr("onclick",false);
        			 $("#a_storename").attr("readonly",true);
        		 }else{       			 
        		 }       		 
        	 })
        	 //条款阅读
        	 $("#reader-me").click(function(){
        			if(this.checked){
        				//按钮可以点击
        				$(".btn").attr("disabled", false);
        			}else{        				
        			}
        		})          
         });
    </script>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-4 column">
		</div>
		//表单的提交
		<form class="form-horizontal" role="form" method="post" id="myform"
		action="${path}StoreServlet?op=addstore">
		<div class="col-md-4 column">
							
				<div class="form-group">
					 <label >店铺名称</label><input id="a_storename" name="a_storename" class="form-control" type="text" placeholder="1-9个字"/>
				</div>
				<div class="form-group">
					 <label >店铺介绍</label><input id="a_storeremark"  name="a_storeremark" class="form-control" type="textarea" 
					 	width="200px" height="300px" />
				</div>
				<div class="form-group">
					 <label >店铺号码</label><input id="a_storenum" name="a_storenum" class="form-control" type="textarea" 
					 	width="200px" height="300px" />
				</div>
				
				<div class="checkbox">
					 <label><input type="checkbox" id="reader-me" onclick="return false"/>同意平台相关条款</label><br />
				</div> <button class="btn btn-default" type="submit"  disabled="disabled" >提交申请</button>
			
		</div>
		</form>
		<div class="col-md-4 column">
		</div>
	</div>
</div>
</body>
</html>