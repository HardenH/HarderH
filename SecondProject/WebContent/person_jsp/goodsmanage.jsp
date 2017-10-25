<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort()
			+ request.getContextPath() + "/";
	pageContext.setAttribute("path", path);
%>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>商品管理</title>
<link href="../AmazeUI-2.4.2/assets/css/admin2.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui2.css" rel="stylesheet" type="text/css">

		<link href="../css/goodsmanage.css" rel="stylesheet" type="text/css">
		<link href="../css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		
	</head>
	<style>
.form-group {
	margin-bottom: 20px;
}
/* 上传文件样式 */
#fileInput {
    padding: 4px 10px;
    height: 35px;
    line-height: 25px;
    position: relative;
    cursor: pointer;
    color: #888;
    background: #fafafa;
    border: 1px solid #CCCCCC;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1
}

#fileInput  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}

#fileInput:hover {
    color: #444;
    background: #eee;
    border-color: #ccc;
    text-decoration: none
}

.form-group #img{
height:80px;
width:80px;
}
.item-pic .J_MakePoint .img{
width:100%
}
</style>
<script type="text/javascript">
$(function(){
	var state="已上架";
	var btnstr="一键下架";
	$(".order-content").remove();
	$.get("${path}Goodsservlet",{"op":"searchbystoreid","storeid":"1"},function(mydata,status){
		$.each(mydata.data,function(index,data){
			if(data.GOODSSTATE==1){
				state="已上架";
				btnstr="一键下架";
			}
			else{
				state="已下架";
				btnstr="一键上架";
			}
			$(".order-list").append("<div class='order-content'><div class='order-left'><ul class='item-list'><li class='td td-item'>"
					+"<div class='item-pic'><a href='#' class='J_MakePoint'><img class='img' src='"+data.GOODSIMG+"' class='itempic J_ItemImg'>"
					+"</a></div><div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div>"
					+"</div></li><li class='td td-price'><div class='item-price'>"+data.GOODSID+"</div></li><li class='td td-number'>"
					+"<div class='item-number'>"+data.GOODSCOUNT+"</div></li><li class='td td-operation'><div class='item-operation'>"+data.GOODSPRICE+""
					+"</div></li></ul></div><div class='order-right'><li class='td td-status'><div class='item-status'>"
					+"<p class='Mystatus'>"+state+"</p></div></li><div class='move-right'>"
					+"<li class='td td-change'><div ><button class='am-btn am-btn-danger anniu' value='"+data.GOODSID+"'>一键删除<button></div>"
					+"</li></div></div></div>");
		})
	})
	
	
	
	//点击已上架
	$("#onsale").on("click",function(){
		$(".order-content").remove();
		$.get("${path}Goodsservlet",{"op":"searchbyidandstate","storeid":"1","goodsstate":"1"},function(mydata,status){
			$.each(mydata.data,function(index,data){
				$(".order-list").append("<div class='order-content'><div class='order-left'><ul class='item-list'><li class='td td-item'>"
						+"<div class='item-pic'><a href='#' class='J_MakePoint'><img class='img' src='"+data.GOODSIMG+"' class='itempic J_ItemImg'>"
						+"</a></div><div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div>"
						+"</div></li><li class='td td-price'><div class='item-price'>"+data.GOODSID+"</div></li><li class='td td-number'>"
						+"<div class='item-number'>"+data.GOODSCOUNT+"</div></li><li class='td td-operation'><div class='item-operation'>"+data.GOODSPRICE+""
						+"</div></li></ul></div><div class='order-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>已上架</p></div></li>"
						+"<div class='move-right'><li class='td td-amount'><div class='item-amount'><input type='hidden' class='state' value='"+data.GOODSSTATE+"'/><button class='am-btn am-btn-danger change' value='"+data.GOODSID+"'>一键下架<button>"
						+"</div></li><li class='td td-change'><div ><button class='am-btn am-btn-danger anniu' value='"+data.GOODSID+"'>一键删除<button></div>"
						+"</li></div></div></div>");
			})
		})
	})
	//点击已下架
	$("#soldout").on("click",function(){
		$(".order-content").remove();
		$.get("${path}Goodsservlet",{"op":"searchbyidandstate","storeid":"1","goodsstate":"0"},function(mydata,status){
			$.each(mydata.data,function(index,data){
				$(".order-list").append("<div class='order-content'><div class='order-left'><ul class='item-list'><li class='td td-item'>"
						+"<div class='item-pic'><a href='#' class='J_MakePoint'><img class='img' src='"+data.GOODSIMG+"' class='itempic J_ItemImg'>"
						+"</a></div><div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div>"
						+"</div></li><li class='td td-price'><div class='item-price'>"+data.GOODSID+"</div></li><li class='td td-number'>"
						+"<div class='item-number'>"+data.GOODSCOUNT+"</div></li><li class='td td-operation'><div class='item-operation'>"+data.GOODSPRICE+""
						+"</div></li></ul></div><div class='order-right'><li class='td td-status'><div class='item-status'><p class='Mystatus'>已下架</p></div></li>"
						+"<div class='move-right'><li class='td td-amount'><div class='item-amount'><input type='hidden' class='state' value='"+data.GOODSSTATE+"'/><button class='am-btn am-btn-danger change' value='"+data.GOODSID+"'>一键上架<button>"
						+"</div></li><li class='td td-change'><div ><button class='am-btn am-btn-danger anniu' value='"+data.GOODSID+"'>一键删除<button></div>"
						+"</li></div></div></div>");
			})
		})
	})
	//点击已删除商品
	$("#delete").on("click",function(){
		$(".order-content").remove();
		$.get("${path}Goodsservlet",{"op":"deletegoods","storeid":"1"},function(mydata,status){
			$.each(mydata.data,function(index,data){
				$(".order-list").append("<div class='order-content'><div class='order-left'><ul class='item-list'><li class='td td-item'>"
						+"<div class='item-pic'><a href='#' class='J_MakePoint'><img class='img' src='"+data.GOODSIMG+"' class='itempic J_ItemImg'>"
						+"</a></div><div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div>"
						+"</div></li><li class='td td-price'><div class='item-price'>"+data.GOODSID+"</div></li><li class='td td-number'>"
						+"<div class='item-number'>"+data.GOODSCOUNT+"</div></li><li class='td td-operation'><div class='item-operation'>"+data.GOODSPRICE+""
						+"</div></li></ul></div><div class='order-right'><div class='move-right'><li class='td td-status'><div class='item-status'>"
						+"<p class='Mystatus'>已删除</p></div></li><li class='td td-change'>"
						+"</li></div></div></div>");
			})
		})
	})
	
	//点击全部商品
	$("#getall").on("click",function(){
		var state="已上架";
		$(".order-content").remove();
		$.get("${path}Goodsservlet",{"op":"searchbystoreid","storeid":"1"},function(mydata,status){
			$.each(mydata.data,function(index,data){
				if(data.GOODSSTATE==1){
					state="已上架";
					btnstr="一键下架";
				}
				else{
					state="已下架";
					btnstr="一键上架";
				}
				$(".order-list").append("<div class='order-content'><div class='order-left'><ul class='item-list'><li class='td td-item'>"
						+"<div class='item-pic'><a href='#' class='J_MakePoint'><img class='img' src='"+data.GOODSIMG+"' class='itempic J_ItemImg'>"
						+"</a></div><div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div>"
						+"</div></li><li class='td td-price'><div class='item-price'>"+data.GOODSID+"</div></li><li class='td td-number'>"
						+"<div class='item-number'>"+data.GOODSCOUNT+"</div></li><li class='td td-operation'><div class='item-operation'>"+data.GOODSPRICE+""
						+"</div></li></ul></div><div class='order-right'><li class='td td-status'><div class='item-status'>"
						+"<p class='Mystatus'>"+state+"</p></div></li><div class='move-right'>"
						+"<li class='td td-change'><div ><button class='am-btn am-btn-danger anniu' value='"+data.GOODSID+"'>一键删除<button></div>"
						+"</li></div></div></div>");
			})
		})
	})
})
/* 添加图片预览显示 */
	function showPicture () {
		  var r= new FileReader();
		  f=document.getElementById('goodsImg').files[0];
		   
		  r.readAsDataURL(f);
		  r.onload=function (e) {
		    document.getElementById('img').src=this.result;
		  };
		}
	
	/* 修改图片预览 */
	function changePicture () {
		  var r= new FileReader();
		  f=document.getElementById('changeImg').files[0];
		   
		  r.readAsDataURL(f);
		  r.onload=function (e) {
		    document.getElementById('newImg').src=this.result;
		  };
		}
</script>
<script type="text/javascript">
$(function(){
	//点击一键删除按钮
	$(document).on("click",'.anniu',function(){
		var goodsid = $(this).val();
		alert(goodsid);
		$(".item-list").remove();
		$.get("${path}Goodsservlet",{"op":"delete","goodsid":goodsid,"storeid":"1"},function(){
			alert(22)
			$.each(mydata.data,function(index,data){
				if(data.GOODSSTATE==1){
					state="已上架";
					btnstr="一键下架";
				}
				else{
					state="已下架";
					btnstr="一键上架";
				}
				$(".order-list").append("<div class='order-content'><div class='order-left'><ul class='item-list'><li class='td td-item'>"
						+"<div class='item-pic'><a href='#' class='J_MakePoint'><img class='img' src='"+data.GOODSIMG+"' class='itempic J_ItemImg'>"
						+"</a></div><div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div>"
						+"</div></li><li class='td td-price'><div class='item-price'>"+data.GOODSID+"</div></li><li class='td td-number'>"
						+"<div class='item-number'>"+data.GOODSCOUNT+"</div></li><li class='td td-operation'><div class='item-operation'>"+data.GOODSPRICE+""
						+"</div></li></ul></div><div class='order-right'><li class='td td-status'><div class='item-status'>"
						+"<p class='Mystatus'>"+state+"</p></div></li><div class='move-right'><li class='td td-amount'><div class='item-amount'><button class='am-btn am-btn-danger change' value='"+data.GOODSID+"'>"+btnstr+"<button>"
						+"</div></li><li class='td td-change'><div ><button class='am-btn am-btn-danger anniu' value='"+data.GOODSID+"'>一键删除<button></div>"
						+"</li></div></div></div>");
			})
		})
	})
	//点击一键上下架
	$(document).on("click",'.change',function(){
		var goodsid = $(this).val();
		var state = $(".state").val();
		alert(state)
		alert(goodsid);
		$(".item-list").remove();
		$.get("${path}Goodsservlet",{"op":"change","goodsid":goodsid,"storeid":"1","state":state},function(mydata,status){
			$.each(mydata.data,function(index,data){
			if(data.GOODSSTATE==1){
				state="已上架";
				btnstr="一键下架";
			}
			else{
				state="已下架";
				btnstr="一键上架";
			}
			$(".order-list").append("<div class='order-content'><div class='order-left'><ul class='item-list'><li class='td td-item'>"
					+"<div class='item-pic'><a href='#' class='J_MakePoint'><img class='img' src='"+data.GOODSIMG+"' class='itempic J_ItemImg'>"
					+"</a></div><div class='item-info'><div class='item-basic-info'><a href='#'><p>"+data.GOODSNAME+"</p></a></div>"
					+"</div></li><li class='td td-price'><div class='item-price'>"+data.GOODSID+"</div></li><li class='td td-number'>"
					+"<div class='item-number'>"+data.GOODSCOUNT+"</div></li><li class='td td-operation'><div class='item-operation'>"+data.GOODSPRICE+""
					+"</div></li></ul></div><div class='order-right'><li class='td td-status'><div class='item-status'>"
					+"<p class='Mystatus'>"+state+"</p></div></li><div class='move-right'><li class='td td-amount'><div class='item-amount'><input type='hidden' class='state' value='"+data.GOODSSTATE+"'/><button class='am-btn am-btn-danger change' value='"+data.GOODSID+"'>"+btnstr+"<button>"
					+"</div></li><li class='td td-change'><div ><button class='am-btn am-btn-danger anniu' value='"+data.GOODSID+"'>一键删除<button></div>"
					+"</li></div></div></div>");
			
		})
	})
})
})
</script>
  <script type="text/javascript">
        $(function () {
           $.get("${path}Typeservlet",{"op":"graparentsname"},function(mydata,status){
        	   var ping;
        	   console.log(mydata);
        	   $.each(mydata.data,function(index,data){
        		   console.log(data.GRAPARENTSID)
        		   ping += "<option value='" + data.GRAPARENTSID + "'>";
                   ping += data.GRAPARENTSNAME;
                   ping += "</option>";
                  
        	   })
        	   $("#Select1").append(ping);
           })
        	
            $('#Select1').change(function () {
                //第二次选时要记得清空市和县中的内容
                $('#Select2 option:gt(0)').remove();
                $('#Select3 option:gt(0)').remove();
                //在省的改变事件里绑定下一个下来列表（要失掉省的id）
$.get("${path}Typeservlet",{"op":"parentsname","fatherid": $("#Select1 option:selected").val()},function(mydata,status){
	 var str2;
	 $.each(mydata.data,function(index,data){
		 str2 += "<option value='" + data.PARENTSID + "'>";
         str2 += data.PARENTSNAME;
         str2 += "</option>";
	 })
     $('#Select2').append(str2);
})
            })
            $('#Select2').change(function () {
                $('#Select3 option:gt(0)').remove();
                $.get("${path}Typeservlet",{"op":"smallcloth","parentsid":  $("#Select2 option:selected").val()},function(mydata,status){
                	 var str3;
                	 $.each(mydata.data,function(index,data){
                		 str3 += "<option value=" + data.CHILDID + ">";
                         str3 += data.TYPENAME;
                         str3 += "</option>";
                	 })
                     $('#Select3').append(str3);
                })
            })
        })

    </script>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
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
					</div>
				</div>
			</article>
		</header>
            
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">商品管理</strong> / <small>Goods</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1" id="getall">所有商品</a></li>
								<li><a href="#tab2" id="upshelf">商品上架</a></li>
								<li><a href="#tab3" id="onsale">已上架</a></li>
								<li><a href="#tab4" id="soldout">已下架</a></li>
								<li><a href="#tab5" id="delete">已删除商品</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">商品id</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">商品状态</td>
									</div>
									 <div class="th th-amount">
										<td class="td-inner">上下架操作</td>
									</div> 
									
									<div class="th th-change">
										<td class="td-inner">商品操作</td>
									</div>
								</div>


									<div class="order-main">
										<div class="order-list">

										</div>

									</div>

								</div>
								<div class="am-tab-panel am-fade" id="tab2">
	<form class="form-horizontal"  method="post" action="" enctype="multipart/form-data">'
								<div class="form-group" style="text-align:center">
							商品名：<input type="text" class="form-control" id="goodsName" name="goodsName"  style="width:300px;height:35px;"/>'
												</div>
								<div class="form-group" style=" margin-left:225px">
								 商品类型： <select id="Select1">
        <option>--请选择--</option>
    </select>
    <select id="Select2">
        <option>--请选择--</option>
    </select>
      <select id="Select3">
        <option>--请选择--</option>
    </select>
												</div>
												<div class="form-group" style="text-align:center">
												商品价格：<input type="text" class="form-control" id="goodsPrice" name="goodsPrice" style="width:300px ;height:35px;"/>
												</div>
												<div class="form-group" style="text-align:center">
												商品描述：<textarea class="form-control" id="goodsContent"name="goodsContent" style="width:300px "></textarea>
												</div>
												<div class="form-group"  style="text-align:center">
											商品库存：<input type="text" class="form-control" id="goodsStock" name="goodsStock" style="width:300px;height:35px;" />
												</div>
												<div class="form-group"  style="margin-left:225px">
												上传图片：<a href="#" id="fileInput"><input type="file"  id="goodsImg" name="goodsImg" style="width:300px;height:35px;" onchange="showPicture()"/>点这里上传图片</a>
												<img src="" id="img" width="80" height="80" style="display:inline-block;margin-left:50px; ">
												</div>
												<div class="form-group"  style="margin-left:225px">
												上传详细图片：<a href="#" id="fileInput"><input type="file"  id="goodsImg" name="goodsImg" style="width:300px;height:35px;" onchange="showPicture()"/>点这里上传图片</a>
												<img src="" id="img" width="80" height="80" style="display:inline-block;margin-left:50px; ">
												</div>
												
												<div class="form-group" style="text-align:center">
												<button type="submit" class="btn btn-success" style="width:400px height:100px">提交</button>
												</div>
     </form>
								</div>
								
								<div class="am-tab-panel am-fade" id="tab3">
									<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">商品id</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">商品状态</td>
									</div>
									 <div class="th th-amount">
										<td class="td-inner">上下架操作</td>
									</div> 
									
									<div class="th th-change">
										<td class="td-inner">商品操作</td>
									</div>
								</div>


									<div class="order-main">
										<div class="order-list">
											
									</div>
								</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">商品id</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">商品状态</td>
									</div>
									 <div class="th th-amount">
										<td class="td-inner">上下架操作</td>
									</div> 
									
									<div class="th th-change">
										<td class="td-inner">商品操作</td>
									</div>
								</div>

								<div class="order-main">
										<div class="order-list">
											
									</div>
								</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab5">
									<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">商品id</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">商品状态</td>
									</div>
									 <div class="th th-amount">
										<td class="td-inner">上下架操作</td>
									</div> 
									
									<div class="th th-change">
										<td class="td-inner">商品操作</td>
									</div>
								</div>



									<div class="order-main">
										<div class="order-list">
										

										</div>

									</div>

								</div>

					</div>
				</div>
				</div>
				<!--//footer-->
					<div class="footer-bottom">
						<div class="container">
							<p class="footer-copyright">
								Copyright &copy; 2000-2017 HARDEN国际有限公司，保留一切权利。｜ <a
									class="footer-beiAn" target="_blank"
									href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010502032052">京公网安备
									11010502032052号</a>关于我们 |联系我们 |加入我们 |用户帮助 |微店联盟 |隐私声明
							</p>
						</div>
						<div class="footer-i footer-mt15">
							<p>出版物经营许可证 ｜ 互联网药品信息服务资格证书编号(京) - 非经营性-2015-0087</p>
						</div>
						<div class="footer-check">
							<p class="footer-check-info check-info-addr">
								<span>公司名称：微go商城平台有限公司</span>&nbsp;&nbsp;&nbsp;&nbsp; <span>地址：厦门市思明区某海海底B座十层</span>&nbsp;&nbsp;&nbsp;&nbsp;
								<span>电话：0250-2501250</span>
							</p>
							<div class="footer-clr"></div>
						</div>
					</div>
					<!-- //footer -->

				
			</div>
			</div>
			<aside class="menu">
					<ul>
					<li class="person active">
						<a href="index.html"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							<li> <a href="information.html">个人信息</a></li>
							<li> <a href="password.html">密码修改</a></li>
							<li> <a href="address.html">地址管理</a></li>
							<!--<li> <a href="cardlist.html">快捷支付</a></li>-->
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的店铺</p>
						<ul>
							<li><a href=" information-storge.html">店铺管理</a></li>
							<li> <a href="goodsmanage.html">商品管理</a></li>
							
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="order.html">订单管理</a></li>
							
							<li> <a href="comment.html">评价商品</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>我的资产</p>
						<ul>
							
							<!--<li> <a href="coupon.html">优惠券 </a></li>
							<li> <a href="bonus.html">红包</a></li>-->
							<li> <a href="wallet.html">我的钱包</a></li>
							<!--<li> <a href="bill.html">账单明细</a></li>-->
						</ul>
					</li>

					<!--<li class="person">
						<p><i class="am-icon-tags"></i>我的收藏</p>
						<ul>
							<li> <a href="collection.html">收藏</a></li>
							<li> <a href="foot.html">足迹</a></li>														
						</ul>
					</li>-->
					

					
				</ul>
					
					
					
					

			</aside>
		</div>

	</body>

</html>