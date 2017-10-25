package com.etc.weigo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.weigo.entity.Store;
import com.etc.weigo.service.StoreService;

/**
 * Servlet implementation class StoreServlet
 */
@WebServlet("/StoreServlet")
public class StoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String op="";
		StoreService ss= new StoreService();
		if(request.getParameter("op")!=null) {
			op= request.getParameter("op");
			System.out.println("op"+op);
			if(op.equals("updStore")) {
				String storename= request.getParameter("storename");
				System.out.println(storename);
				String storeintro=request.getParameter("storeintro");
				String storephone=request.getParameter("storephone");
				Store store =new Store(storename, storeintro, storephone);
				ss.updstoreinfo(store);
				
			}
			
			
			
			
		}
		
		request.getRequestDispatcher("person_jsp/information-storge.jsp").forward(request, response);
		
	}

}
