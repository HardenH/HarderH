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

import com.etc.weigo.entity.Wallet;
import com.etc.weigo.service.WalletService;
import com.google.gson.Gson;

/**
 * Servlet implementation class WalletServlet
 */
@WebServlet("/WalletServlet")
public class WalletServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WalletServlet() {
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
		List<Wallet> list= new ArrayList<Wallet>();
		WalletService ws= new WalletService();
		String op="";
		PrintWriter out= response.getWriter();
		Gson g= new Gson();
		response.setContentType("application/json");
		
		if(request.getParameter("op")!=null) {
			
			op= request.getParameter("op");
			
			if(op.equals("queryBalanceById")) {
				String userid=request.getParameter("userid");
				
				
				list=ws.queryBalanceById(Integer.parseInt(userid));
				String jsonstring=g.toJson(list);
				
				out.print(jsonstring);
				out.close();
			}
			if(op.equals("updrecharge")) {
				String rechargeaccount=request.getParameter("rechargeaccount");
				String recharge0= request.getParameter("recharge0");
				System.out.println("ÓÃ»§Id:"+rechargeaccount+"½ð¶î£º"+recharge0);
				 ws.updrecharge(Double.parseDouble(recharge0), Integer.parseInt(rechargeaccount));
				out.close();
			   }
			
			if(op.equals("updwithdrawals")) {
				String withdrawalsaccount =request.getParameter("withdrawalsaccount");
				
				String withdrawals0 =request.getParameter("withdrawals0");
				ws.updwithdrawals(Double.parseDouble(withdrawals0),Integer.parseInt(withdrawalsaccount));
				out.close();
				
			}
			
		}
		
		
	}

}
