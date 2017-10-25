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
import javax.servlet.http.HttpSession;

import com.etc.weigo.entity.Goods;
import com.etc.weigo.entity.GoodsCar;
import com.etc.weigo.entity.VIEW_GOODSCAR;
import com.etc.weigo.service.GoodsCarService;
import com.etc.weigo.service.GoodsService;
import com.google.gson.Gson;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/GoodsCarServlet")
public class GoodsCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 定义了一个全局的 GoodsCarService 任何的方法中可以使用GoodsCarService对象的方法
	GoodsCarService gcs = new GoodsCarService();


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GoodsCarServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		HttpSession session = request.getSession();
		
		//int userid=1;//当前用户的id
		int count;//购物车显示数
		
		 //加入购物车操作 Addgoods
		if(request.getParameter("op")!=null){
		String op=request.getParameter("op");
		//System.out.println("op:"+op);
			if(op.equals("Addgoods")){
	
		// String goodsCarId=request.getParameter("goodsCarId");
		 int goodsId=Integer.parseInt(request.getParameter("goodsId"));
		 int goodsCount=Integer.parseInt(request.getParameter("goodsCout"));
		 System.out.println("商品ID："+goodsId+",goodsCount:"+goodsCount);
		 int userId=Integer.parseInt(request.getParameter("user_Id"));
		// System.out.println(goodsId+","+goodsCount+","+userId);
		 //System.out.println("插入数据成功");
		 System.out.println("商品ID："+goodsId+",goodsCount:"+goodsCount+",userId"+userId);
		 /*重新查询数据库，获取记录数*/
		 //得到一个goodscar
		 GoodsCar goodscar=new GoodsCar(0,goodsId,goodsCount,userId);
		 
		 	//调用service的方法Addgoods
		 	gcs.Addgoods(goodscar);
		 
			// 调用service dao 完成查询
			List<GoodsCar> list=gcs.AllGoodsCar(userId);
			
			//商品的记录数
			 count=list.size();
			 session.setAttribute("buyCount", count);
			 System.out.println("数据查询成功，返回页面");
			 
			 List<Goods> listgoods = new ArrayList<Goods>();
			 GoodsService gs = new GoodsService();
			 listgoods = gs.chagoodsinformation(goodsId);
			System.out.println("goods:"+listgoods);
			request.setAttribute("list", listgoods);
			 
			 
			 request.getRequestDispatcher("home_jsp/introduction.jsp").forward(request, response);
			// response.sendRedirect("home_jsp/introduction.jsp");
		}
			//根据购物车id去查询购物车的商品数
			else if(op.equals("updateCar")){
				String strGoodscarId = request.getParameter("strGoodscarId");
				String strGoodsBycount = request.getParameter("strGoodsBycount");
				
				//System.out.println("strGoodscarId"+strGoodscarId);
			  //System.out.println("strGoodsBycount"+strGoodsBycount);
				
				session.setAttribute("strGoodscarId", strGoodscarId);
				String goodscarId []= strGoodscarId.split(",");
				String goodsBycount []= strGoodsBycount.split(",");
				
				for (int i = 0; i < goodscarId.length; i++) {
					gcs.updateGoodsCar(Integer.parseInt(goodscarId[i]), Integer.parseInt(goodsBycount[i]));
				}
				
				response.sendRedirect("home_jsp/pay.jsp");
				//request.getRequestDispatcher("home_jsp/pay.jsp").forward(request, response);
			}
			//删除按钮的实现
			else if(op.equals("deleteCar")){
				int goodsCarId = Integer.parseInt(request.getParameter("strGoodscarId"));

				gcs.deleteGoodsCar(goodsCarId);

				response.sendRedirect("home_jsp/shopcart.jsp");
			}
			//多选按钮的实现 deleteCars
			else if(op.equals("deleteCars")){
				String strGoodscarId = request.getParameter("strGoodscarId");
				//System.out.println(strGoodscarId);
				
				String goodscarId []= strGoodscarId.split(",");
				
				for (int i = 0; i < goodscarId.length; i++) {
					gcs.deleteGoodsCar(Integer.parseInt(goodscarId[i]));
				}
				
				response.sendRedirect("home_jsp/shopcart.jsp");
			
			}
			else if(op.equals("VIEW_GOODSCAR")){
			//调用实体类service的方法
				String userId = request.getParameter("user_Id");
				List<VIEW_GOODSCAR> vd=gcs.getAllViews(Integer.parseInt(userId));
				//System.out.println(vd);
				//AJAX来实现
				//返回数据最好是json格式 外部的jar包 gson
				Gson gson = new Gson();
				String jsonString = gson.toJson(vd);
				//使用PrintWrite对象
				PrintWriter out = response.getWriter();
				out.print(jsonString);
				out.close();
			
				
			}
			//根据购物车id查询购物车视图所有信息
			else if(op.equals("getAllPay")){
					//System.out.println(op);
				  // int goodsCarId = Integer.parseInt(request.getParameter("goodsCarId"));
				  // String strGoodscarId = request.getParameter("strGoodscarId");
				   String strGoodscarId = (String) session.getAttribute("strGoodscarId");
				 
				   String goodscarId []= strGoodscarId.split(",");
				   List<VIEW_GOODSCAR> mylist = new ArrayList<VIEW_GOODSCAR>();
				   for (int i = 0; i < goodscarId.length; i++) {
					   List<VIEW_GOODSCAR> list = gcs.getOrder(Integer.parseInt(goodscarId[i]));
					   VIEW_GOODSCAR mygoodscar = list.get(0);
					   mylist.add(mygoodscar);
					
				   }
				  // System.out.println("mylist====="+mylist);
				   
				  // MyData<VIEW_GOODSCAR> md = new MyData<>();
					
				   //md.setData(list);
				   
					Gson gson = new Gson();
					String jsonString = gson.toJson(mylist);
					//使用PrintWrite对象
					PrintWriter out = response.getWriter();
					out.print(jsonString);
					out.close();
					//response.sendRedirect("http://localhost:9999/weigo/person_jsp/order.jsp");
				}
				
			
		}
		}
		 
		
	}


