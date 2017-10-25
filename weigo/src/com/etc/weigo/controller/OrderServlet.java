package com.etc.weigo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.weigo.entity.Orders;
import com.etc.weigo.service.OrdersService;

/**
 * 商品的Servlet
 * @author zhuzhen
 *
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L;
   // private GoodsService gs= new GoodsService();
  //  private OrdersService os = new OrdersService();
   // private GoodsCartService gcs = new GoodsCartService();
   // private UsersService us = new UsersService();
    private OrdersService os = new OrdersService();
    
    public OrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		System.out.println("sss");
		if(request.getParameter("op")!=null){
			String op = request.getParameter("op");
			System.out.println("操作:"+op);
			
			
			//添加用户的收货地址			
			if(op.equals("queryOrders")){	
				//System.out.println("111");
				String USERID=request.getParameter("UserIds");
				String	ORDERNUM =request.getParameter("Ordernum");	
				String	CADDRESS = request.getParameter("Address");
				String	CPHONE = request.getParameter("Receiverphone");
				String	CONSIGNEE = request.getParameter("Receiver");
				String	ORDERREMARK =request.getParameter("Orderremark");	
				//String CPHONE =request.getParameter("Receiverphone");
				
				String	GOODSID =request.getParameter("goods");											
				String ORDERTOTALPRICE=request.getParameter("SimplePrice");
				String	COUNT =request.getParameter("GoodsCout");													
				String STOREID=request.getParameter("StoreId");
				
				System.out.println("GoodsId:"+GOODSID);
				String goodsArr [] = GOODSID.split(",");
				String SimplePriceArr [] = ORDERTOTALPRICE.split(",");
				String GoodsCoutArr [] = COUNT.split(",");
				String StoreIdArr [] = STOREID.split(",");
				
				for (int i = 0; i < goodsArr.length; i++) {
					Orders orders=new Orders(ORDERNUM, Integer.parseInt(goodsArr[i]), Double.parseDouble(SimplePriceArr[i]),Integer.parseInt(GoodsCoutArr[i]) , CADDRESS, CPHONE, CONSIGNEE, Integer.parseInt(USERID), Integer.parseInt(StoreIdArr[i]), ORDERREMARK);
					os.addOrders(orders);
				}
				
				
				//System.out.println("Receiverphone:"+Receiverphone+",ORDERNUM:"+ORDERNUM+",ORDERREMARK:"+ORDERREMARK+",UserId："+USERID);
				
				
				//插入数据库
				//Orders orders=new Orders(ORDERNUM, GOODSID, ORDERTOTALPRICE, COUNT, CADDRESS, CPHONE, CONSIGNEE, USERID, STOREID, ORDERREMARK);
				//System.out.println("orders="+orders);
				//os.addOrders(orders);
				//跳转到待支付界面
				//response.sendRedirect("../person_jsp/order.jsp");
			}
		}
	}
}
