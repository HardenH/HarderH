<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath();
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>购物车页面</title>
		
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="../css/optstyle.css" rel="stylesheet" type="text/css" />
		
		<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="../js/jquery.js"></script>
	
		<!--新导入部分js-->
		<script src="../js/jquery.min.1.8.2.js" type="text/javascript"></script>
		<script src="../js/payfor.js" type="text/javascript"></script>
		<script src="../js/lrtk.js" type="text/javascript"></script>
		<script src="../js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
		<script src="../js/common_js.js" type="text/javascript"></script>
		<script src="../js/footer.js" type="text/javascript"></script>
		<script src="../js/jquery.jumpto.js" type="text/javascript"></script>
		
		<!--ajax查询数据库  -->
        <script type="text/javascript" src="${path}/js/jquery-2.1.0.js"></script>

<script type="text/javascript">
   $(function(){
	   //完成ajax请求 获取json数据并显示
	   
	   $.get("../GoodsCarServlet?op=VIEW_GOODSCAR&user_Id=${sessionScope.user_Id}",function(vd,status){

		   //遍历vd中data
		   $.each(vd,function(index,VIEW_GOODSCAR){
			   $("tbody").append("<tr class='tr'><td class='checkbox' ><input name='checkitems' type='checkbox' value='' /></td><td style='float:left'><img  src='${path}/"+VIEW_GOODSCAR.GOODSIMG+"' width='80px' height='80px'>"+VIEW_GOODSCAR.GOODSNAME
						+"</td>  <td ><input type='button' id='' class='sub' value='-' /><input class='td_input' type='text' value='"+VIEW_GOODSCAR.GOODSCOUT+"'/><input type='button' id='' class='add' value='+' /></td> <td>"
						+VIEW_GOODSCAR.GOODSPRICE+"</td><td>"+VIEW_GOODSCAR.GOODSPRICE*VIEW_GOODSCAR.GOODSCOUT
						+"</td> <td><input type='button'  class='btn-del' id='del' value='删除' href='javascript:void(0);' /></td><td style='visibility: hidden;'>"+VIEW_GOODSCAR.GOODSCARID
						+"</td> </tr>");
		   });
		  
	   });
   });
   

</script>
		
	</head>
	
	<script type="text/javascript">
		
		$(function  () {
			
			/*实现加运算后 产品总价 总价格 总数量 */
			
			$(document).on('click','.add',function  () {
				
				var checkboxObj = $(this).parents("tr").find("td").eq(0).find("input"); //当前行单选框的对象
				var totalPriObj = $(this).parents("tr").find("td").eq(4);  //总价单元格的对象
				var inputObj = $(this).parents("tr").find("td").eq(2).find("input").eq(1);  //购买数量的输入input的对象				
				var count= parseInt(inputObj.val());  // 获取当前的购买数量
				count++;  //单击按钮数量加1
				inputObj.val(count); //新的数值 
				//alert(count);
				var price= parseFloat($(this).parents("tr").find("td").eq(3).text()); //单价
				var totalPrice = count*price;  //单个商品的总价
				totalPriObj.text(totalPrice);
				
				//var myp = parseInt($(this).parents("tr").find("td").eq(5).text());
				//var mycount = parseInt($(this).parents("tr").find("td").eq(2).text());
				data = $(this).parents("tr").siblings();
				//alert(data.length);
				var sumPrice =0;
				var sumCount = 0;	
				if(checkboxObj.prop("checked")){
					 sumPrice= totalPrice;
					 sumCount = count;	
				}
				
				for(var i = 0;i<data.length;i++){
					
					//var mychecked = $(":checkbox");
					//alert($(data[i]).find("td").find("input").checked);
					var mych = $(data[i]).find("td").eq(0).find("input");  //其他行的单选框的对象
					
					if(mych.prop("checked")){
						sumPrice+=parseFloat($(data[i]).find("td").eq(4).text());//商品总价
						sumCount+=parseInt($(data[i]).find("td").eq(2).find("input").eq(1).val());
					}
					//alert($(data[i]).find("td").eq(5).text());
				}
				
				
				$("#sum").text(sumPrice);
				$("#sumcount").text(sumCount);
				
			});
			
			$(document).on('blur','.td_input',function(){
				if(this.value==''){this.value=1}
				var totalPriObj = $(this).parents("tr").find("td").eq(4);  //总价单元格的对象
				var inputObj = $(this).parents("tr").find("td").eq(2).find("input").eq(1);  //购买数量的输入input的对象				
				var count= parseInt(inputObj.val());  // 获取当前的购买数量
				var price= parseFloat($(this).parents("tr").find("td").eq(3).text()); //单价
				var totalPrice = count*price;  //单个商品的总价
				totalPriObj.text(totalPrice);
				
			})
			
			$(document).on('keyup','.td_input',function(){
				this.value=this.value.replace(/\D/g,'');
			})
			
			
			
			
			
			/*实现减运算后 产品总价 总价格 总数量 */
			
			$(document).on('click','.sub',function  () {
				
				var checkboxObj = $(this).parents("tr").find("td").eq(0).find("input"); //当前行单选框的对象
				var totalPriObj = $(this).parents("tr").find("td").eq(4);  //总价单元格的对象
				var inputObj = $(this).parents("tr").find("td").eq(2).find("input").eq(1);  //购买数量的输入input的对象				
				var count= parseInt(inputObj.val());  // 获取当前的购买数量
				if(count>1)
				count--;  //单击按钮数量加1
				inputObj.val(count); //新的数值 
				//alert(count);
				var price= parseFloat($(this).parents("tr").find("td").eq(3).text()); //单价
				var totalPrice = count*price;  //单个商品的总价
				totalPriObj.text(totalPrice);
				
				//var myp = parseInt($(this).parents("tr").find("td").eq(5).text());
				//var mycount = parseInt($(this).parents("tr").find("td").eq(2).text());
				data = $(this).parents("tr").siblings();
				//alert(data.length);
				var sumPrice =0;
				var sumCount = 0;	
				if(checkboxObj.prop("checked")){
					 sumPrice= totalPrice;
					 sumCount = count;	
				}
				
				for(var i = 0;i<data.length;i++){
					
					//var mychecked = $(":checkbox");
					//alert($(data[i]).find("td").find("input").checked);
					var mych = $(data[i]).find("td").eq(0).find("input");  //其他行的单选框的对象
					
					if(mych.prop("checked")){
						sumPrice+=parseFloat($(data[i]).find("td").eq(4).text());
						sumCount+=parseInt($(data[i]).find("td").eq(2).find("input").eq(1).val());
					}
					//alert($(data[i]).find("td").eq(5).text());
				}
				
				$("#sum").text(sumPrice);
				$("#sumcount").text(sumCount);
				
			})
			
			/*实现全选功能脚本*/
   $(".jdcheckbox").click(function () {
	   if ((this).checked) {                 //如果当前点击的多选框被选中
		   $('input[type=checkbox][name=checkitems]').prop("checked", true);
		   var arr = $("#mytable tr");
		   //alert(arr.length);
		   var sum = 0;
		   var sumcount = 0;
		   for(var i=1;i<arr.length;i++){
		   		sum += parseFloat($(arr[i]).find("td").eq(4).text());
		   		sumcount += parseInt($(arr[i]).find("td").eq(2).find("input").eq(1).val());
		   }
		   $("#sum").text(sum);
		   $("#sumcount").text(sumcount);
	   } else {
		   $('input[type=checkbox][name=checkitems]').prop("checked", false);
		    $("#sum").text(0);
		    $("#sumcount").text(0);
	   }
   });
			
   
  		// $("input[type=checkbox][name=checkitems]").click(function()
  		$(document).on('click','input[type=checkbox][name=checkitems]',function () {
	 	var  flag = true;
	    //alert((this).checked);
	    
	    var totalPriObj = $(this).parents("tr").find("td").eq(4);  //总价单元格的对象
	    var inputObj = $(this).parents("tr").find("td").eq(2).find("input").eq(1);  //购买数量的输入input的对象				
		var checkboxObj = $(this).parents("tr").find("td").eq(0).find("input"); //当前行单选框的对象
	    //是否被选中
	    //选中为true
	    if((this).checked){
	    		var myp = parseFloat(totalPriObj.text());//总价的值
				var mycount = parseInt(inputObj.val());//购买数量的值
	    		data = $(this).parents("tr").siblings();//获取兄弟元素
	    		//alert(myp+","+mycount);
				//alert(data.length);
				var sum =1; //总购买价格
				var sumcount = 1;	//总购买数量
				//alert(checkboxObj.prop("checked"));
				if(checkboxObj.prop("checked")){ //不能使用checkboxObj.attr("checked")=="checked"
					 sum= myp;
					 sumcount = mycount;
					 
					// alert("总购买价格:"+sum+","+"总购买数量:"+sumcount);
					 
				}
				
				
				
				for(var i = 0;i<data.length;i++){
					
					//var mychecked = $(":checkbox");
					//alert($(data[i]).find("td").find("input").checked);
					var mych = $(data[i]).find("td").eq(0).find("input");
					
					if(mych.prop("checked")){
						sum+=parseFloat($(data[i]).find("td").eq(4).text());
						sumcount+=parseInt($(data[i]).find("td").eq(2).find("input").eq(1).val());
					}
					//alert($(data[i]).find("td").eq(5).text());
				}
				
				
				$("#sum").text(sum);
				$("#sumcount").text(sumcount);
				
	    }
		
	    	//取消被选中false
	    	if(!(this).checked){
	    	var myp = parseFloat(totalPriObj.text());
				var mycount = parseInt(inputObj.val());
	    	data = $(this).parents("tr").siblings();
				//alert(data.length);
				var sum = parseFloat($("#sum").text());
				var sumcount = parseInt($("#sumcount").text());	
				if(!(this).checked){   
					 sum -= myp;
					 sumcount -= mycount;	
				}
				
				/*for(var i = 0;i<data.length;i++){
					
					//var mychecked = $(":checkbox");
					//alert($(data[i]).find("td").find("input").checked);
					var mych = $(data[i]).find("td").eq(0).find("input");
					
					if(mych.attr("checked")=="checked"){
						sum-=parseInt($(data[i]).find("td").eq(5).text());
						sumcount-=parseInt($(data[i]).find("td").eq(2).text());
					}
					//alert($(data[i]).find("td").eq(5).text());
				}*/
				
				
				$("#sum").text(sum);
				$("#sumcount").text(sumcount);
				
	    }
	    
	   $('input[type=checkbox][name=checkitems]').each(function () {
		   if (!(this).checked) {
			   flag = false;
		   }
	   });

	   if(flag) {
		   $('#CheckedAll').prop('checked', true);
	   } else {
		   $('#CheckedAll').prop('checked', false);
	   }
   });
   
   
   //删除功能的实现--多选
   
  $("#send").click(function () {
	  var mycheck=$("input[type=checkbox][name=checkitems]:checked");
	   var strGoodscarId = "";
	   for(var i=0;i<mycheck.length;i++){
		   strGoodscarId = strGoodscarId+$(mycheck[i]).parents("tr").find("td").eq(6).text()+",";
	   }
	   //console.log("结算Id:"+strGoodscarId+"结算count:"+strGoodsBycount);
	   if(mycheck.length>0){
 		window.location.href='../GoodsCarServlet?op=deleteCars&strGoodscarId='+strGoodscarId;
	   }else{
		   alert("请至少选择一件商品");
	   }
     
     
  	    
});
   
   
   //按钮删除功能的实现
   
   $(document).on('click','.btn-del',function () {
	   var strGoodscarId = "";
	 
	   strGoodscarId = strGoodscarId+$(this).parents("tr").find("td").eq(6).text();
	  // alert(strGoodscarId);
	   window.location.href='../GoodsCarServlet?op=deleteCar&strGoodscarId='+strGoodscarId;
	   
	   alert("商品已删除啦~~~");  
		  
		
   });
   
   
   //前往结算  同时查询购物车的goodscout
   $("#myorder").click(function  () {
	   
	   var mycheck=$("input[type=checkbox][name=checkitems]:checked");
	   var strGoodscarId = "";
	   var strGoodsBycount = "";
	   for(var i=0;i<mycheck.length;i++){
		   strGoodscarId = strGoodscarId+$(mycheck[i]).parents("tr").find("td").eq(6).text()+",";
		   strGoodsBycount= strGoodsBycount+$(mycheck[i]).parents("tr").find("td").eq(2).find("input").eq(1).val()+",";
	   }
	   //console.log("结算Id:"+strGoodscarId+"结算count:"+strGoodsBycount);
	   if(mycheck.length>0){
   			window.location.href='../GoodsCarServlet?op=updateCar&strGoodscarId='+strGoodscarId+'&strGoodsBycount='+strGoodsBycount;
	   }else{
		   alert("请至少选择一件商品");
	   }
		   }); 
   
		})
	</script>
	<body>

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
					<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span >购物车</span><strong id="J_MiniCartNum" class="h" >${sessionScope.buyCount}</strong></a></div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
			</ul>
			</div>

			<!--悬浮搜索框-->

			<div class="nav white">
				<div class="logo"><img src="../images/logo.png" /></div>
				<div class="logoBig">
					<li><img src="../images/mylogo.png" /></li>
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
<hr style="border-top:2px solid #F03726; margin-top: 0px;"/>

			<!--购物车开始 -->
			<div class="Inside_pages">
 <div class="shop_carts">
   <div class="Process"></div>
   <div class="shopping">
  <form  method="post" action="">
			<table class="shop_table" border="1" bordercolor="lightblue" cellspacing="" cellpadding="" id="mytable">
	
	<thead>
		<tr>
			<th class="th1">选择</th>
			<th  class="th2">名称</th>
			<th  class="th3">购买数量</th>
			<th  class="th4">商品单价</th>
			<th  class="th5">商品总价</th>
			<th  class="th6">操作</th>
			 <th></th>
		</tr>
	</thead>
	<tbody>
		<!-- *************内容 ajax获取***************** -->
	</tbody>
</table>
<hr/>
<div class="sp_Operation">
  <div class="select-all">
  <div class="cart-checkbox"><input type="checkbox"   id="CheckedAll" name="toggle-checkboxes" class="jdcheckbox" clstag="clickcart">全选</div>
  <div class="operation"><a href="javascript:void(0);" id="send">删除选中的商品</a></div> 
    </div>  
  </div>  <hr />

<div class="rowclearfix">
		<div class="col-md-4 column">
			
				<div>
				 总购买数量：<p id="sumcount" class="sumcount">0</p> 
				 	总购买价格：<p id="sum" class="sum">0</p> </div>
				<input type="button" class="btn-back" id="" value="继续购买" />
				<input type="button" class="btn-go" id="myorder" value="前往结算" />
			
		</div>
		
		
	</div>
	 </form>
 </div>
	</div>
	</div>
			
			<!--购物车结束 -->
			
			
				
				
				
				
				
                 <!--页脚-->
				<div class="footer-bottom">
		<div class="container">
			<p class="footer-copyright">
				Copyright &copy; 2000-2017 HARDEN国际有限公司，保留一切权利。｜ <a class="footer-beiAn" target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010502032052">京公网安备 11010502032052号</a>关于我们 |联系我们 |加入我们 |用户帮助 |微店联盟 |隐私声明 
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

			</div>


		
	</body>

</html>