package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Goods;
import com.etc.util.MyData;
import com.google.gson.Gson;
import com.service.Goodsservice;

/**
 * Servlet implementation class Goodsservlet
 */
@WebServlet("/Goodsservlet")
public class Goodsservlet extends HttpServlet {
	Goodsservice gs = new Goodsservice();
	List<Goods> list = new ArrayList<>();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Goodsservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		if(request.getParameter("op")!="") {
			String op = request.getParameter("op");
			if(op.equals("searchbycloth")) {
				//if(request.getParameter("cloth")!="") {
					list = gs.findbytype(21);
					System.out.println("cloth"+list);
					
				//}
			}
			if(op.equals("searchbyphone")) {
				//if(request.getParameter("phone")!="") {
					list = gs.findbytype(43);
					System.out.println("phone"+list);
					
				//}
			}
			if(op.equals("searchbyfoods")) {
				//if(request.getParameter("foods")!="") {
					list = gs.findbytype(46);
					System.out.println("foods"+list);
					
				//}
			}
			//根据父类类别查找商品
			if(op.equals("searchbyparentsid")) {
				String parnetsidstr = request.getParameter("PARENTSID");
				int PARENTSID = Integer.parseInt(parnetsidstr);
				System.out.println(PARENTSID);
				list = gs.chabymtype(PARENTSID);
				System.out.println("parentid"+list);
				request.setAttribute("list", list);
				request.getRequestDispatcher("home_jsp/search.jsp").forward(request, response);
			}
			//转发到商品详情
			if(op.equals("information")) {
				 String GOODSID = request.getParameter("goodsid");
				 int goodsid = Integer.parseInt(GOODSID);
				list = gs.chagoodsinformation(goodsid);
				System.out.println("goods:"+list);
				request.setAttribute("list", list);
				request.getRequestDispatcher("home_jsp/introduction.jsp").forward(request, response);
				return;
			}
			if (op.equals("searchbystoreid")) {
				String storeidstr = request.getParameter("storeid");
				int storeid =Integer.parseInt(storeidstr);
				list = gs.searchbystoreid(storeid);
			}
			//删除商品
			if(op.equals("delete")) {
				String storeidstr = request.getParameter("storeid");
				int storeid =Integer.parseInt(storeidstr);
				String goodsidstr = request.getParameter("goodsid");
				int goodsid = Integer.parseInt(goodsidstr);
				gs.changevisible(goodsid);
				list=gs.searchbystoreid(storeid);
			}
			//根据storeid和goodsstate（上下架状态）查找
			if(op.equals("searchbyidandstate")) {
				String storeidstr = request.getParameter("storeid");
				int storeid =Integer.parseInt(storeidstr);
				String goodsstatestr = request.getParameter("goodsstate");
				int goodsstate = Integer.parseInt(goodsstatestr);
				list=gs.searchbystate(storeid, goodsstate);
				
			}
			//显示已删除商品
			if(op.equals("deletegoods")) {
				String storeidstr = request.getParameter("storeid");
				int storeid =Integer.parseInt(storeidstr);
				list = gs.searchdelete(storeid);
			}
			//一键上下架，全部商品不做了
			if(op.equals("change")) {
				String storeidstr = request.getParameter("storeid");
				int storeid =Integer.parseInt(storeidstr);
				String statestr = request.getParameter("state");
				int state = Integer.parseInt(statestr);
				String goodsidstr = request.getParameter("goodsid");
				int goodsid = Integer.parseInt(goodsidstr);
				gs.changestate(goodsid, state);
				list=gs.searchbystate(storeid, state);
			}
			
			
		}
		Gson gson = new Gson();
		MyData mydata =  new MyData<Goods>();
		mydata.setData(list);	
		String gsonstring =gson.toJson(mydata);
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
