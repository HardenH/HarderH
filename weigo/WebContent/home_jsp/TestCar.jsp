<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>购物车测试</title>
</head>
<body>
<h1>获取记录数（购物车数）：${sessionScope.buyCount}</h1>
<form action="../GoodsCarServlet?op=Addgoods"  method="post">
   <div><input type="text" id="goodsId"  name="goodsId"/>商品id</div>
	<div><input type="text" id="goodsCout"  name="goodsCout"/>+-数量</div><br />
	 <div><input type="text" id="userId"  name="userId"/>用户id</div>
		<div><button type="submit" class="btn but-success btn-block">加入购物车</button></div>
</form>

</body>
</html>