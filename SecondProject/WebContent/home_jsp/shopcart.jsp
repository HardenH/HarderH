<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	</head>
	
	<script type="text/javascript">
		
		$(function  () {
			
			
			
			
			/*实现加运算后 产品总价 总价格 总数量 */
			$(".add").click(function  () {
				
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
				if(checkboxObj.attr("checked")=="checked"){
					 sumPrice= totalPrice;
					 sumCount = count;	
				}
				
				for(var i = 0;i<data.length;i++){
					
					//var mychecked = $(":checkbox");
					//alert($(data[i]).find("td").find("input").checked);
					var mych = $(data[i]).find("td").eq(0).find("input");  //其他行的单选框的对象
					
					if(mych.attr("checked")=="checked"){
						sumPrice+=parseFloat($(data[i]).find("td").eq(4).text());//商品总价
						sumCount+=parseInt($(data[i]).find("td").eq(2).find("input").eq(1).val());
					}
					//alert($(data[i]).find("td").eq(5).text());
				}
				
				
				$("#sum").text(sumPrice);
				$("#sumcount").text(sumCount);
				
				//alert("总价:"+sum);
				//alert("数量："+sumcount);
				
				
				//var arr = $("#mytable tr");
				//var nn = $(this).parents("tr").siblings().find("td").eq(5).text();
				//alert(nn.length);
				//alert(nn.length);
				//var sum = 0;
				//alert(arr.length);
				//for(var i=1;i<arr.length;i++){
					//alert(arr[i].children().eq(5).text());
					//alert(nn[i])
					//alert($("tr td").eq(5).text());
					
				//}
				//alert(sum);
			});
			
			/*实现减运算后 产品总价 总价格 总数量 */
			
			$(".sub").click(function  () {
				
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
				if(checkboxObj.attr("checked")=="checked"){
					 sumPrice= totalPrice;
					 sumCount = count;	
				}
				
				for(var i = 0;i<data.length;i++){
					
					//var mychecked = $(":checkbox");
					//alert($(data[i]).find("td").find("input").checked);
					var mych = $(data[i]).find("td").eq(0).find("input");  //其他行的单选框的对象
					
					if(mych.attr("checked")=="checked"){
						sumPrice+=parseFloat($(data[i]).find("td").eq(4).text());
						sumCount+=parseInt($(data[i]).find("td").eq(2).find("input").eq(1).val());
					}
					//alert($(data[i]).find("td").eq(5).text());
				}
				
				
				$("#sum").text(sumPrice);
				$("#sumcount").text(sumCount);
				
				
				
				
				/*var test= $(this).parents("tr").find("td").eq(2).text();
				var test1= $(this).parents("tr").find("td").eq(5).text();
				var dj= $(this).parents("tr").find("td").eq(4).text();
				s1= parseInt(test1)
				dj= parseInt(dj)
				s= parseInt(test)
				if(s>1)
				s-=1
				$(this).parents("tr").find("td").eq(2).html(s);
				if(s1>dj)
				s1-=dj;
					$(this).parents("tr").find("td").eq(5).html(s1);
				var myp = parseInt($(this).parents("tr").find("td").eq(5).text());
				var mycount = parseInt($(this).parents("tr").find("td").eq(2).text());
				data = $(this).parents("tr").siblings();
				//alert(data.length);
				var sum =0;
				var sumcount = 0;	
				if($(this).parents("tr").find("td").eq(0).find("input").attr("checked")=="checked"){
					 sum= myp;
					 sumcount = mycount;	
				}
				
				for(var i = 0;i<data.length;i++){
					
					//var mychecked = $(":checkbox");
					//alert($(data[i]).find("td").find("input").checked);
					var mych = $(data[i]).find("td").eq(0).find("input");
					
					if(mych.attr("checked")=="checked"){
					sum+=parseInt($(data[i]).find("td").eq(5).text());
					sumcount+=parseInt($(data[i]).find("td").eq(2).text());
					}
					//alert($(data[i]).find("td").eq(5).text());
				}
				/*var sum = myp;
				var sumcount = mycount;	
				for(var i = 0;i<data.length;i++){
					sum+=parseInt($(data[i]).find("td").eq(5).text());
					sumcount+=parseInt($(data[i]).find("td").eq(2).text());
					//alert($(data[i]).find("td").eq(5).text());
				}*/
				//alert("总价:"+sum);
				//alert("个数："+sumcount);
				
				//$("#sum").text(sum);
				//$("#sumcount").text(sumcount);*/
			
			})
			
			
			
			
			/*实现全选功能脚本*/
   $(".jdcheckbox").click(function () {
	   if (this.checked) {                 //如果当前点击的多选框被选中
		   $('input[type=checkbox][name=checkitems]').attr("checked", true);
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
		   $('input[type=checkbox][name=checkitems]').attr("checked", false);
		    $("#sum").text(0);
		    $("#sumcount").text(0);
	   }
   });
   
   $('input[type=checkbox][name=checkitems]').click(function () {
	 var   flag = true;
	    //alert((this).checked);
	    
	    var totalPriObj = $(this).parents("tr").find("td").eq(4);  //总价单元格的对象
	    var inputObj = $(this).parents("tr").find("td").eq(2).find("input").eq(1);  //购买数量的输入input的对象				
		var checkboxObj = $(this).parents("tr").find("td").eq(0).find("input"); //当前行单选框的对象
	    //是否被选中
	    //选中为true
	    if((this).checked){
	    		var myp = parseFloat(totalPriObj.text());
				var mycount = parseInt(inputObj.val());
	    		data = $(this).parents("tr").siblings();
				//alert(data.length);
				var sum =0;
				var sumcount = 0;	
				if(checkboxObj.attr("checked")=="checked"){
					 sum= myp;
					 sumcount = mycount;	
				}
				
				for(var i = 0;i<data.length;i++){
					
					//var mychecked = $(":checkbox");
					//alert($(data[i]).find("td").find("input").checked);
					var mych = $(data[i]).find("td").eq(0).find("input");
					
					if(mych.attr("checked")=="checked"){
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
				if(!this.checked){
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
		   if (!this.checked) {
			   flag = false;
		   }
	   });

	   if (flag) {
		   $('#CheckedAll').attr('checked', true);
	   } else {
		   $('#CheckedAll').attr('checked', false);
	   }
   });
   
   
   //删除功能的实现
   $("#send").click(function () {
	      if($("input[type='checkbox'][name='checkitems']:checked").attr("checked")){
	   var str = "您是否要删除选中的商品？\r\n";
	   $('input[type=checkbox][name=checkitems]:checked').each(function () {
		   str += $(this).val() + "\r\n";
	   })
	   alert(str);
		  }
		  else{
			   var str = "你未选中任何商品，请选择后在操作！"; 
			   alert(str);
       }
	   	    
   });
   
   
   //按钮删除功能的实现
   $(".btn-del").click(function () {
	       
	   var str = "您是否要删除该商品？\r\n";
	   alert(str);
		  
		
   });
   
   $("#myorder").click(function  () {
   	window.location.href='pay.html';
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
					<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
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
			<th  class="th4">产品单价</th>
			<th  class="th5">产品总价</th>
			<th  class="th6">操作</th>
			<!--<th>输入</th>-->
		</tr>
	</thead>
	<tbody>
		<tr class="tr">
			<!--单选-->
			 <td class="checkbox" style="width: 40px;">
			 	<input  name="checkitems" type="checkbox" value="iphone X" /></td>
			 
			<td>iphone X
			</td>
			<td><input type="button" id="" class="sub" value="-" />
				<input class="td_input" type="text" value="1" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" onblur="if(this.value==''){this.value=1}"/>
				<input type="button" id="" class="add" value="+" />
			</td>	
			<td>20</td>
			<td>20</td>
			<td><input type="button"  class="btn-del" id="del" value="删除" href="javascript:void(0);" /></td>
			<!--<td><input type="text" value="1"/></td>-->
		</tr>
		<tr class="tr">
			<!--单选-->
			 <td class="checkbox" style="width: 40px;"><input  name="checkitems" type="checkbox" value="小米  MIX" /></td>
			<td>小米  MIX</td>

			<td><input type="button" id="" class="sub" value="-" />
				<input class="td_input" type="text" value="1" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" onblur="if(this.value==''){this.value=1}"/>
				<input type="button" id="" class="add" value="+" />
			</td>	
			<td>10</td>
			<td>10</td>
			<td><input type="button" class="btn-del" id="del" value="删除" href="javascript:void(0);"/></td>
			<!--<td><input type="text" value="1"/></td>-->
		</tr>
		<tr class="tr">
			<!--单选-->
			 <td class="checkbox" style="width: 40px;"><input name="checkitems" type="checkbox" value="华为 P10" /></td>
			<td>华为 P10</td>

			<td><input type="button" id="" class="sub" value="-" />
				<input class="td_input" type="text" value="1" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" onblur="if(this.value==''){this.value=1}"/>
				<input type="button" id="" class="add" value="+" />
			</td>	
			<td>30</td>
			<td>30</td>
			<td><input type="button" class="btn-del" id="del" value="删除" href="javascript:void(0);"/></td>
			<!--<td><input type="text" value="1"/></td>-->
		</tr>
	</tbody>
</table>

<div class="sp_Operation">
  <div class="select-all">
  <div class="cart-checkbox"><input type="checkbox"   id="CheckedAll" name="toggle-checkboxes" class="jdcheckbox" clstag="clickcart">全选</div>
  <div class="operation"><a href="javascript:void(0);" id="send">删除选中的商品</a></div> 
    </div>  
  </div>  <hr />

<div class="rowclearfix">
		<div class="col-md-4 column">
			<table border="" cellspacing="" cellpadding="">
				<tr><th>总购买数量：</th><td id="sumcount" class="sumcount">0</td></tr> 
				<tr><th>总购物价格：</th><td id="sum" class="sum">0</td></tr>
					<tr>
						<td><input type="button" class="btn-back" id="" value="继续购买" /></td>
						<td><input type="button" class="btn-go" id="myorder" value="前往结算" /></td></tr>
			</table>
		</div>
		
		<div class="col-md-4 column">
			<table border="" cellspacing="" cellpadding="">
				
			</table>
		</div>
		<div class="col-md-4 column">
			<table border="0" cellspacing="" cellpadding="">
			
			</table>
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