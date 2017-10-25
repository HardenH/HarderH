package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.entity.GoodsCar;
import com.entity.VIEW_GOODSCAR;
import com.google.gson.Gson;
import com.service.GoodsCarService;
import com.service.VIEW_GOODSCAR_SERVICE;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/VIEW_GOODSCAR_SERVLET")
public class VIEW_GOODSCAR_SERVLET extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 定义了一个全局的 VIEW_GOODSCAR_SERVICE 任何的方法中可以使用VIEW_GOODSCAR_SERVICE对象的方法
	VIEW_GOODSCAR_SERVICE vgs=new VIEW_GOODSCAR_SERVICE();


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VIEW_GOODSCAR_SERVLET() {
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
		
		int userId=1;//当前用户的id
		
			/*
		if(request.getParameter("userId") !=null) {
			System.out.println("userId"+userId);
	   userId=Integer.parseInt(request.getParameter("userId1"));
	   		System.out.println("userId"+userId);
		}*/
		System.out.println("1111");
		
		//调用实体类service的方法
		List<VIEW_GOODSCAR> vd=vgs.getAllViews(userId);
		System.out.println(vd);
		//AJAX来实现
		//返回数据最好是json格式 外部的jar包 gson
		Gson gson = new Gson();
		String jsonString = gson.toJson(vd);
		//使用PrintWrite对象
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.close();
		 
		// response.sendRedirect("home_jsp/introduction.jsp");
		}}
		
		
