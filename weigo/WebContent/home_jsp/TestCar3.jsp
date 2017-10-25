<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath();
	pageContext.setAttribute("path", path);
%>

 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title><%-- 
<link rel="stylesheet" type="text/css"
	href=" ${path}/bootstrap/css/bootstrap.css" /> --%>
	
<script type="text/javascript" src="${path}/js/jquery-2.1.0.js"></script>
<%-- <script src="${path}/bootstrap/js/bootstrap.js" type="text/javascript"
	charset="utf-8"></script> --%>
<script type="text/javascript">
   $(function(){
	   //完成ajax请求 获取json数据并显示
	   
	   
	   $.get("../GoodsCarServlet?op=getAllPay",{"goodsCarId":2},function(lvd,status){

		   //遍历vd中data
		   $.each(lvd,function(index,VIEW_GOODSCAR){
			   $("tbody").append("<tr ><td><img src(图片处理css)='"+VIEW_GOODSCAR.GOODSIMG+"'>"+VIEW_GOODSCAR.GOODSNAME
						+"</td>  <td ><input  value='"+VIEW_GOODSCAR.GOODSPRICE+"' /></td> <td>"
						+VIEW_GOODSCAR.GOODSCOUT+"</td><td>"+0
						+"</td><td>"+VIEW_GOODSCAR.GOODSCARID
						+"</td> </tr>");
		   });
		  
	   });
   });
   

</script>
</head>
<body>

<h1 align="center">消息中心</h1>
<hr/>
<br/>
<br/>
<div class="container">
	
	
	<div class="row clearfix">
		<div class="col-md-12 column">
			<table class="table">
			<!-- 表格头部 -->
				<thead>
					 <tr>
						<th>商品名称</th>
						<th>商品单价</th>
						<th>商品数量</th>
						<th>金额</th>
						<th>购物车id</th>
					</tr> 
				</thead>
				<!-- 表格中部 -->
				<tbody>
					
				</tbody>
				<!-- 表格底部 -->
				<tfoot><tr>
				<td>全选</td>
				<td>删除选中</td></tr>
				</tfoot>
				
			</table> 
		</div>
	</div>
			

</div>
</body>
</html>