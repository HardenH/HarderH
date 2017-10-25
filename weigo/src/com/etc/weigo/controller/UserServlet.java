package com.etc.weigo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.etc.weigo.entity.Users;
import com.etc.weigo.service.UserService;


/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		UserService us = new UserService();
		PrintWriter out = response.getWriter();
		String msg = "";
		String op = request.getParameter("op");		
		if (request.getParameter("op") != "") {			
			// ï¿½Ð¶ï¿½ï¿½Ç·ï¿½ï¿½ï¿½ï¿?
			if (op.equals("r_userName")) {
				if (request.getParameter("r_userName") != "") {
					String USERNAME = request.getParameter("r_userName");					
					boolean flag =us.isMatchee(USERNAME);					
					if (flag == true) {
						msg = "¸ÃÓÃ»§ÃûÒÑ´æÔÚ";

					} else {
						msg = "ÓÃ»§Ãû¿ÉÓÃ";
					}

				} else {
					msg = "²»ÄÜÎª¿Õ";
					
				}
			} // ï¿½Ð¶ï¿½ï¿½Ö»ï¿½ï¿½ï¿½ï¿½ï¿½
			else if (op.equals("r_userPhone")) {				
				String reg = "^((13[0-9])|(15[0-9]|[5-9])|(18[0-3]|[6-9]))\\d{8}$";
				if (request.getParameter("r_userPhone") != "") {
					String r_userPhone = request.getParameter("r_userPhone");					
					// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ê½
					Pattern pattern = Pattern.compile(reg);
					Matcher matcher = pattern.matcher(r_userPhone);
					// ï¿½Ö·ï¿½ï¿½ï¿½ï¿½Ç·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ê½ï¿½ï¿½Æ¥ï¿½ï¿½
					boolean rs = matcher.matches();
					boolean flag = us.isphone(r_userPhone);
					if (rs&flag==false) {
						msg = "¸ñÊ½ÕýÈ·£¬¿ÉÒÔÊ¹ÓÃ";
						//¸ñÊ½ÕýÈ·
					} else if(rs==false&flag==false){
						msg = "¸ñÊ½´íÎó";
						//ÇëÊäÈëÕýÈ·µÄÊÖ»úºÅ
					}
					else if(flag) {
						msg="ÊÖ»úºÅÒÑ´æÔÚ£¬ÇëÖØÐÂÊäÈë";
					}
				} else {
					msg = "²»ÄÜÎª¿Õ";
				}
			} else if (op.equals("r_password")) {
				// ï¿½Ð¶ï¿½ï¿½ï¿½ï¿½ï¿½6~16Î» ï¿½ï¿½ï¿½Ö¡ï¿½ï¿½ï¿½Ä¸ï¿½ï¿½ï¿½Â»ï¿½ï¿½ï¿½
				String reg = "^\\w{6,16}$";
				if (request.getParameter("r_password") != "") {
					String password = request.getParameter("r_password");
					// ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ê½
					Pattern pattern = Pattern.compile(reg);
					Matcher matcher = pattern.matcher(password);
					// ï¿½Ö·ï¿½ï¿½ï¿½ï¿½Ç·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ê½ï¿½ï¿½Æ¥ï¿½ï¿½
					boolean rs = matcher.matches();
					if (rs) {
						msg = "¿ÉÒÔÊ¹ÓÃ";
					} else {
						msg = "²»·ûºÏ¹æ·¶";
					}
				} else {
					    msg = "²»ÄÜÎª¿Õ";
				}
			} else if (op.equals("pwdrepeat")) {
				// ï¿½ï¿½Ö¤ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ç·ï¿½Ò»ï¿½ï¿½
				if (request.getParameter("r_passwordrepeat") != "") {
					String pwdrepeat = request.getParameter("r_passwordrepeat");
					String password = request.getParameter("r_password");					
					if (password.equals(pwdrepeat)) {
						msg = "ÉèÖÃ³É¹¦";

					} else {
						msg = "ÃÜÂë²»Ò»ÖÂ";
					}
				} else {
					msg = "²»ÄÜÎª¿Õ";
				}
			}
			else if (op.equals("addUser")) {
				//ï¿½ï¿½ï¿½ï¿½ï¿½Ã»ï¿½				
					String username= request.getParameter("r_userName");
					String password = request.getParameter("r_password");
					String userphone = request.getParameter("r_userPhone");	
					
					// ï¿½Ãµï¿½ï¿½ï¿½Ò»ï¿½ï¿½articleï¿½ï¿½ï¿½ï¿½
					Users users = new Users(username, password, userphone);
					// ï¿½ï¿½ï¿½ï¿½serviceï¿½Ä·ï¿½ï¿½ï¿½
					System.out.println(users);
					us.addUser(users);
					// ×ªï¿½ï¿½
					request.getRequestDispatcher("home/register.jsp").forward(request,
							response);
		}
		//Ïòuser±íÖÐ¸üÐÂÐÅÏ¢
			else if (op.equals("updateuser")) {
				//»ñÈ¡apply1.jspÒ³ÃæµÄÖµ							
					String username = request.getParameter("a_name");					
					String cardid = request.getParameter("a_cardid");					
					String userphone= request.getParameter("a_phone");
					//½«Öµ´æÈësession
					HttpSession session = request.getSession();
					session.setAttribute("userphone", userphone);
					us.updateUser(username, cardid, userphone);
					request.getRequestDispatcher("home_jsp/apply2.jsp").forward(request, response);
		}
			//»ñÈ¡ÓÃ»§×´Ì¬£¬´«µ½Ö÷Ò³
			else if (op.equals("searchUserstatebyUserid")) {
				//´ÓsessionÖÐÈ¡³öÖµ
					HttpSession session = request.getSession();
					String USERID= (String) session.getAttribute("userid");
					us.searchUserstateByUserid(Integer.parseInt(USERID));				
					request.getRequestDispatcher("${path}home_jsp/home1.jsp").forward(request, response);
		}
		out.print(msg);
		out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		doGet(request, response);
	}
}