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
				String errorMsg = "�˺Ż���������ˣ�";
				
				boolean flag = false;
				
				for (Users users : list) {
					if(userPhone.equals(users.getUSERPHONE()) && userPwd.equals(users.getUSERPWD())) {
						
						HttpSession session = request.getSession();
						// ���ƥ�䣬���û��������Ϣͨ��session����
						// ���û���������ӭҳ��
						session.setAttribute("user",users.getUSERNAME());
						// ���û�id�������ﳵҳ��
						session.setAttribute("user_Id", users.getUSERID());
						
						// ������һ��ȫ�ֵ� GoodsCarService �κεķ����п���ʹ��GoodsCarService����ķ���
						GoodsCarService gcs = new GoodsCarService();
						// ����service dao ��ɲ�ѯ
						List<GoodsCar> gclist = gcs.AllGoodsCar(users.getUSERID());
						
						//��Ʒ�ļ�¼��
						int count = gclist.size();
						session.setAttribute("buyCount", count);
						
						
						// ��¼�ɹ� ҳ����ת��index.jsp
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
