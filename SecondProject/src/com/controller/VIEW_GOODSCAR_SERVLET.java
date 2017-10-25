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
	
	// ������һ��ȫ�ֵ� VIEW_GOODSCAR_SERVICE �κεķ����п���ʹ��VIEW_GOODSCAR_SERVICE����ķ���
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
		
		int userId=1;//��ǰ�û���id
		
			/*
		if(request.getParameter("userId") !=null) {
			System.out.println("userId"+userId);
	   userId=Integer.parseInt(request.getParameter("userId1"));
	   		System.out.println("userId"+userId);
		}*/
		System.out.println("1111");
		
		//����ʵ����service�ķ���
		List<VIEW_GOODSCAR> vd=vgs.getAllViews(userId);
		System.out.println(vd);
		//AJAX��ʵ��
		//�������������json��ʽ �ⲿ��jar�� gson
		Gson gson = new Gson();
		String jsonString = gson.toJson(vd);
		//ʹ��PrintWrite����
		PrintWriter out = response.getWriter();
		out.print(jsonString);
		out.close();
		 
		// response.sendRedirect("home_jsp/introduction.jsp");
		}}
		
		
