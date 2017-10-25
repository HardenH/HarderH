package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.GoodsCar;
import com.entity.Users;
import com.service.GoodsCarService;
import com.service.UserService;



/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		UserService us = new UserService();
		
		String op = request.getParameter("op");
		if (request.getParameter("op") != "") {
			if(op.equals("loginVerify")) {
				List<Users> list = us.loginVerify();
				String userPhone = request.getParameter("l_userPhone");
				String userPwd = request.getParameter("l_userPwd");
				String errorMsg = "账号或密码出错了！";
				
				boolean flag = false;
				
				for (Users users : list) {
					if(userPhone.equals(users.getUSERPHONE()) && userPwd.equals(users.getUSERPWD())) {
						
						HttpSession session = request.getSession();
						// 如果匹配，将用户的相关信息通过session传递
						// 将用户名传到欢迎页面
						session.setAttribute("user",users.getUSERNAME());
						// 将用户id传到购物车页面
						session.setAttribute("user_Id", users.getUSERID());
						
						// 定义了一个全局的 GoodsCarService 任何的方法中可以使用GoodsCarService对象的方法
						GoodsCarService gcs = new GoodsCarService();
						// 调用service dao 完成查询
						List<GoodsCar> gclist = gcs.AllGoodsCar(users.getUSERID());
						
						//商品的记录数
						int count = gclist.size();
						session.setAttribute("buyCount", count);
						
						
						// 登录成功 页面跳转到index.jsp
						response.sendRedirect("home_jsp/home.jsp");
						flag = true;
						break;
					}
				}
				
				if(flag == false) {
					/*request.setAttribute("l_userPhone", userPhone);
					request.setAttribute("l_userPwd02", errorMsg);
					request.getRequestDispatcher("home_jsp/login.jsp").forward(request, response);*/
					response.sendRedirect("home_jsp/login.jsp");
				}
			}
		}
	}

}
