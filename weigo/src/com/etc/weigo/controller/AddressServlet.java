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
import javax.servlet.http.HttpSession;

import com.etc.weigo.entity.Address;
import com.etc.weigo.service.AddressService;
import com.google.gson.Gson;

/**
 * 商品的Servlet
 * @author zhuzhen
 *
 */
@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L;
   // private GoodsService gs= new GoodsService();
  //  private OrdersService os = new OrdersService();
   // private GoodsCartService gcs = new GoodsCartService();
   // private UsersService us = new UsersService();
    private AddressService as = new AddressService();
    
    public AddressServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		HttpSession session = request.getSession();
		String backString=null;
		//List<GoodsCart> listgc = null;
		List<Address> listui = null;
		 List<Address> list= new ArrayList<Address>();
		//Users_info users_info = null;
		String username = null;
		if(request.getParameter("op")!=null){
			String op = request.getParameter("op");
			System.out.println("操作:"+op);
			//初始化收货地址和购物车中的商品信息
			if(op.equals("queryAllAddress")){	
				int userId =Integer.parseInt(request.getParameter("userId"));
				
				listui = as.getAddressByUserId(userId);
				Gson g = new Gson();
				backString = g.toJson(listui);
				/*回传jsp页面*/
				PrintWriter  out = response.getWriter();
				out.print(backString);
				//System.out.println(backString);
				out.close();
			}
			if(op.equals("queryaddress")) {
				
			//String addressid= request.getParameter("addressid");
			 String userid=	request.getParameter("userid");
			System.out.println("用户的id："+userid);
			 PrintWriter out = response.getWriter();
				list=as.getinfo(Integer.parseInt(userid));
				
				Gson g= new Gson();
				String pd = g.toJson(list);
//				/如果这里加了这句话，意味着视图那一层不需要JSON.parse
				//这里已经将返回的数据变成了json对象
				System.out.println(pd);
				
				out.print(pd);
				out.close();
				
			}
			//添加用户的收货地址			
			if(op.equals("queryAddress")){	
				//System.out.println("111");
				
				int	userId =Integer.parseInt(request.getParameter("userId"));											
				String	useraddress = request.getParameter("UserAddress");
				String	receivertel = request.getParameter("ReceiverTel");
				String	receivername = request.getParameter("ReceiverName");
				int addrestate=Integer.parseInt(request.getParameter("AddrsState"));
				//System.out.println("伟杰大哥：userId="+userId+",useraddress="+useraddress+",receivertel="+receivertel+",receivername="+receivername+",addresState="+addrestate);
				//把数据存到收货地址表中
				Address address=new Address(userId, useraddress,receivername , receivertel,addrestate);
				//Address address2 = new Address(uSERID, aDDRESS, rECEIVER, rECEIVERPHONE, aDDRSTATE)
				//System.out.println("ture:"+as.addAddress(address));
				as.addAddress(address);
				listui= as.getAddressByUserId(userId);				
					Gson g = new Gson();
					backString = g.toJson(listui);
					/*回传jsp页面*/
					PrintWriter  out = response.getWriter();
					out.print(backString);
					//System.out.println(backString);
					out.close();
				}
				if(op.equals("addAddress")) {
					String statement="0";
				    String receiver= request.getParameter("receiver");
					String receiverphone= request.getParameter("receiverphone");
					String address0= request.getParameter("address");
					String province1= request.getParameter("province1");
					String city1=request.getParameter("city1");
					String district1=request.getParameter("district1");
					address0=province1+city1+district1+address0;
					HttpSession session1 = request.getSession();
					String userId = (String) session1.getAttribute("user_Id");
					Address address=new Address(Integer.parseInt("1"), address0,receiver , receiverphone,Integer.parseInt(statement));
				
				    as.addAddress(address);
				    
				    request.setAttribute("list", list);
					request.getRequestDispatcher("person_jsp/address.jsp").forward(request, response);	
				}						
			
			//删除用户的收货地址			
			if(op.equals("querydeleteAddress")){
				int	userId =Integer.parseInt(request.getParameter("userId"));
				int	addressId = Integer.parseInt(request.getParameter("AddressId"));
				
					//把这条数据删除
					as.deleteAddress(addressId);
					listui= as.getAddressByUserId(userId);				
					Gson g = new Gson();
					backString = g.toJson(listui);
					/*回传jsp页面*/
					PrintWriter  out = response.getWriter();
					out.print(backString);
					//System.out.println(backString);
					out.close();
				}
			if(op.equals("updAddress")) {
				String updreceiver=request.getParameter("updreceiver");
				String updphone= request.getParameter("updphone");
				String updadd= request.getParameter("updadd");
				String addressid= request.getParameter("addressid");
				HttpSession session1 = request.getSession();
				String userId = (String) session1.getAttribute("user_Id");
			   Address updaddress= new Address(Integer.parseInt(addressid) , Integer.parseInt("1"), updadd, updreceiver, updphone,0);
				as.updaddress(updaddress);
				request.setAttribute("list", list);
				request.getRequestDispatcher("person_jsp/address.jsp").forward(request, response);	
				
			}
			if(op.equals("deladdressbyaddressid")) {
				String addressid= request.getParameter("addressid");
				int addressid1=Integer.parseInt(addressid);
				as.deladdressbyaddressid(addressid1);
				
				request.setAttribute("list", list);
				request.getRequestDispatcher("person_jsp/address.jsp").forward(request, response);	
				
			}if(op.equals("updaddresstate")) {
				String userid=request.getParameter("userid");
				String addressid=request.getParameter("addressid");
				as.updaddresstate(Integer.parseInt(userid), Integer.parseInt(addressid));
				request.getRequestDispatcher("person_jsp/address.jsp").forward(request, response);	
				
			}
			/*判断是否是提交按钮的操作*/
			if(op.equals("submitOrder")){
				
			}
			
		}
	}

		
}
