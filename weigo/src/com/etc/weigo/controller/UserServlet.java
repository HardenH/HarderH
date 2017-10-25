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
			// �ж��Ƿ����?
			if (op.equals("r_userName")) {
				if (request.getParameter("r_userName") != "") {
					String USERNAME = request.getParameter("r_userName");					
					boolean flag =us.isMatchee(USERNAME);					
					if (flag == true) {
						msg = "���û����Ѵ���";

					} else {
						msg = "�û�������";
					}

				} else {
					msg = "����Ϊ��";
					
				}
			} // �ж��ֻ�����
			else if (op.equals("r_userPhone")) {				
				String reg = "^((13[0-9])|(15[0-9]|[5-9])|(18[0-3]|[6-9]))\\d{8}$";
				if (request.getParameter("r_userPhone") != "") {
					String r_userPhone = request.getParameter("r_userPhone");					
					// ����������ʽ
					Pattern pattern = Pattern.compile(reg);
					Matcher matcher = pattern.matcher(r_userPhone);
					// �ַ����Ƿ���������ʽ��ƥ��
					boolean rs = matcher.matches();
					boolean flag = us.isphone(r_userPhone);
					if (rs&flag==false) {
						msg = "��ʽ��ȷ������ʹ��";
						//��ʽ��ȷ
					} else if(rs==false&flag==false){
						msg = "��ʽ����";
						//��������ȷ���ֻ���
					}
					else if(flag) {
						msg="�ֻ����Ѵ��ڣ�����������";
					}
				} else {
					msg = "����Ϊ��";
				}
			} else if (op.equals("r_password")) {
				// �ж�����6~16λ ���֡���ĸ���»���
				String reg = "^\\w{6,16}$";
				if (request.getParameter("r_password") != "") {
					String password = request.getParameter("r_password");
					// ����������ʽ
					Pattern pattern = Pattern.compile(reg);
					Matcher matcher = pattern.matcher(password);
					// �ַ����Ƿ���������ʽ��ƥ��
					boolean rs = matcher.matches();
					if (rs) {
						msg = "����ʹ��";
					} else {
						msg = "�����Ϲ淶";
					}
				} else {
					    msg = "����Ϊ��";
				}
			} else if (op.equals("pwdrepeat")) {
				// ��֤���������Ƿ�һ��
				if (request.getParameter("r_passwordrepeat") != "") {
					String pwdrepeat = request.getParameter("r_passwordrepeat");
					String password = request.getParameter("r_password");					
					if (password.equals(pwdrepeat)) {
						msg = "���óɹ�";

					} else {
						msg = "���벻һ��";
					}
				} else {
					msg = "����Ϊ��";
				}
			}
			else if (op.equals("addUser")) {
				//�����û�				
					String username= request.getParameter("r_userName");
					String password = request.getParameter("r_password");
					String userphone = request.getParameter("r_userPhone");	
					
					// �õ���һ��article����
					Users users = new Users(username, password, userphone);
					// ����service�ķ���
					System.out.println(users);
					us.addUser(users);
					// ת��
					request.getRequestDispatcher("home/register.jsp").forward(request,
							response);
		}
		//��user���и�����Ϣ
			else if (op.equals("updateuser")) {
				//��ȡapply1.jspҳ���ֵ							
					String username = request.getParameter("a_name");					
					String cardid = request.getParameter("a_cardid");					
					String userphone= request.getParameter("a_phone");
					//��ֵ����session
					HttpSession session = request.getSession();
					session.setAttribute("userphone", userphone);
					us.updateUser(username, cardid, userphone);
					request.getRequestDispatcher("home_jsp/apply2.jsp").forward(request, response);
		}
			//��ȡ�û�״̬��������ҳ
			else if (op.equals("searchUserstatebyUserid")) {
				//��session��ȡ��ֵ
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