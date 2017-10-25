package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Users;
import com.service.UserService;


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
						msg = "已存在";

					} else {
						msg = "可以使用";
						//可以使用
					}

				} else {
					msg = "不能为空";
					
				}
			} // �ж��ֻ�����
			else if (op.equals("r_userPhone")) {				
				String reg = "^((13[0-9])|(15[0-3]|[5-9])|(17[0-3]|[5-9])|(18[0-3]|[6-9]))\\d{8}$";
				if (request.getParameter("r_userPhone") != "") {
					String r_userPhone = request.getParameter("r_userPhone");					
					// ����������ʽ
					Pattern pattern = Pattern.compile(reg);
					Matcher matcher = pattern.matcher(r_userPhone);
					// �ַ����Ƿ���������ʽ��ƥ��
					boolean rs = matcher.matches();
					//判断手机号是否存在
					boolean flag = us.isphone(r_userPhone);
					if (rs&flag==false) {
						msg = "格式正确，可以使用";
						//格式正确
					} else if(rs==false&flag==false){
						msg = "��������ȷ���ֻ��ţ�";
						//请输入正确的手机号
					}
					else if(flag) {
						msg="手机号已存在，请重新输入";
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
						msg = "可以使用";
						//可以使用
					} else {
						msg = "��ʽ����";
						//不符合规范
					}
				} else {
					    msg = "����Ϊ��";
					    //不能为空
				}
			} else if (op.equals("pwdrepeat")) {
				// �ж������Ƿ�һ��
				if (request.getParameter("r_passwordrepeat") != "") {
					String pwdrepeat = request.getParameter("r_passwordrepeat");
					String password = request.getParameter("r_password");					
					if (password.equals(pwdrepeat)) {
						msg = "设置成功";
//设置成功
					} else {
						msg = "���벻һ��";
						//密码不一致
					}
				} else {
					msg = "���벻��Ϊ��";
					//不能为空
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