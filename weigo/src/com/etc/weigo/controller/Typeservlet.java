package com.etc.weigo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.etc.weigo.entity.Goods;
import com.etc.weigo.entity.Type;
import com.etc.weigo.service.Typeservice;
import com.etc.weigo.util.MyData;
import com.google.gson.Gson;

/**
 * Servlet implementation class Typeservlet
 */
@WebServlet("/Typeservlet")
public class Typeservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<Type> list = new ArrayList<Type>();
	Typeservice ts = new Typeservice();
	List<Type> list1 = new ArrayList<Type>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Typeservlet() {
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
		if(request.getParameter("op")!="") {
			String op = request.getParameter("op");
			if(op.equals("cloth")) {
				list = ts.gettype(1);
					System.out.println(list);
			}
			if(op.equals("smallcloth")) {
				String parentsidstr = request.getParameter("parentsid");
				int parentsid = Integer.parseInt(parentsidstr);
				System.out.println("parentsid:"+parentsid);
				list = ts.gettypename(parentsid);
				System.out.println("Ð¡Àà±ð"+list);
			}
			if(op.equals("phone")) {
				list = ts.gettype(3);
			}
			if(op.equals("foods")) {
				list = ts.gettype(6);
			}
			if(op.equals("graparentsname")) {
				list = ts.getgraparentsname();
			}
			if(op.equals("parentsname")) {
				String graparentsidstr = request.getParameter("fatherid");
				int graparentsid = Integer.parseInt(graparentsidstr);
				list = ts.gettype(graparentsid);
			}
			}
		
		Gson gson = new Gson();
		PrintWriter out = response.getWriter();
		MyData mydata =  new MyData<Goods>();
		mydata.setData(list);	
		String gsonstring =gson.toJson(mydata);
		out.print(gsonstring);
		System.out.println("gsonstring"+gsonstring);
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
