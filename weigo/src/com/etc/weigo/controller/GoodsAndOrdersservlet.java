package com.etc.weigo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.weigo.entity.goodsAndOrder;
import com.etc.weigo.service.GoodsAndOrderservice;
import com.etc.weigo.util.MyData;
import com.google.gson.Gson;

/**
 * Servlet implementation class GoodsAndOrdersservlet
 */
@WebServlet("/GoodsAndOrdersservlet")
public class GoodsAndOrdersservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GoodsAndOrderservice gaos = new GoodsAndOrderservice();
	List<goodsAndOrder> list = new ArrayList<goodsAndOrder>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsAndOrdersservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		if(request.getParameter("op")!="") {
			String op = request.getParameter("op");
		//根据storeid获取所有订单
			if(op.equals("getallbystoreid")) {
			
			if(request.getParameter("storeid")!="") {
				String storeidstr = request.getParameter("storeid");
				int storeid= Integer.parseInt(storeidstr);		
			list = gaos.getallorders(storeid);
			System.out.println("oreders:"+list);
			}
					
			}
			//查询待付款，待发货，待收货，待评价订单 
			if(op.equals("getwaitnum")) {
				if(request.getParameter("storeid")!=""&&request.getParameter("ORDERSTATE")!="") {
					String storeidstr = request.getParameter("storeid");
					int storeid= Integer.parseInt(storeidstr);	
					String ORDERSTATEstr = request.getParameter("ORDERSTATE");
					int ORDERSTATE = Integer.parseInt(ORDERSTATEstr);
				list = gaos.getordersnum(storeid, ORDERSTATE);
				System.out.println("waitordernum:"+list);
				}
			}
			if(op.equals("changestatus")) {
				if(request.getParameter("ORDERSTATE")!=""&&request.getParameter("storeid")!="") {
					String ORDERSTATEstr = request.getParameter("ORDERSTATE");
					System.out.println("ORDERSTATEstr"+ORDERSTATEstr);
						int	ORDERSTATE = Integer.parseInt(ORDERSTATEstr);
						System.out.println("ORDERSTATE"+ORDERSTATE);
					String ordersnumstr = request.getParameter("ordersnum");
					System.out.println("ordersnumstr"+ordersnumstr);
					int ordersnum = Integer.parseInt(ordersnumstr);
						String storeidstr = request.getParameter("storeid");
						int storeid= Integer.parseInt(storeidstr);	
					gaos.changestatus(ORDERSTATE, ordersnum);
						list=gaos.getorders(storeid, ORDERSTATE);
						System.out.println("change:"+list);
				
			}
			}
			
			//根据订单号查询商品信息
			if(op.equals("myget")) {
				String myordernum = request.getParameter("myordernum");
				System.out.println("订单号："+myordernum);
				list = gaos.getgoodsinfo(Integer.parseInt(myordernum));
				System.out.println("商品遍历"+list);
				
			}
		}
	
		Gson gson = new Gson();
		MyData mydata =  new MyData<goodsAndOrder>();
		mydata.setData(list);	
		String gsonstring =gson.toJson(mydata);
System.out.println(gsonstring);
		out.print(gsonstring);
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
