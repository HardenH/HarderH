package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Comments;
import com.entity.Goods;
import com.etc.util.MyData;
import com.google.gson.Gson;
import com.service.Commentsservice;

/**
 * Servlet implementation class Commentsservlet
 */
@WebServlet("/Commentsservlet")
public class Commentsservlet extends HttpServlet {
	Commentsservice cs = new Commentsservice();
	List<Comments> list = new ArrayList<>();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Commentsservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		int page = 1;
		int goodsid = 0;
		int pageSize = 5;
		if(request.getParameter("op")!="") {
			String op = request.getParameter("op");
			if(op.equals("getallbygoodsid")) {
				String goodsidstr = request.getParameter("goodsid");
				goodsid = Integer.parseInt(goodsidstr);
				list = cs.getcomments(goodsid);
			}
			/*if(op.equals("fivecoms")) {
				if(request.getParameter("goodsid")!="") {
					String goodsidstr = request.getParameter("goodsid");
					System.out.println("goodsidstr"+goodsidstr);
					goodsid = Integer.parseInt(goodsidstr);
				}
				
				if(request.getParameter("page")!="") {
					String pagestr = request.getParameter("page");
					System.out.println("pagestr"+pagestr);
					page = Integer.parseInt(pagestr);
				}*/
		}
				//list =  null;// cs.getfivecoms(goodsid, page);
				Gson gson = new Gson();
				MyData mydata =  new MyData<Comments>();
				mydata.setData(list);	
				String gsonstring =gson.toJson(mydata);
				out.print(gsonstring);
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
