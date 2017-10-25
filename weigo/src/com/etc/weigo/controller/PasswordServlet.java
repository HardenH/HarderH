package com.etc.weigo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.weigo.entity.Password;
import com.etc.weigo.service.PasswordService;

/**
 * Servlet implementation class PasswordServlet
 */
@WebServlet("/PasswordServlet")
public class PasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordServlet() {
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
		PasswordService ps= new PasswordService();
		List<Password> li =new ArrayList<Password>();
		
		String op="";
		String msg="";
		//PrintWriter out =response.getWriter();
		if(request.getParameter("op")!=null) {
		
			op= request.getParameter("op");
			if(op.equals("updpassword")) {
		 String oldpwd =request.getParameter("oldpwd");
		 String newpwd =request.getParameter("newpwd");
		 String newpwd2= request.getParameter("newpwd2");
		 
			 ps.updpwd(1, newpwd);
		 
			}
			
			
		}
		
	 request.getRequestDispatcher("person_jsp/password.jsp").forward(request, response);	
		
	}
	
	

}
