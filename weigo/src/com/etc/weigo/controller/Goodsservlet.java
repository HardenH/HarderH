package com.etc.weigo.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.etc.weigo.entity.Goods;
import com.etc.weigo.entity.Store;
import com.etc.weigo.service.GoodsService;
import com.etc.weigo.service.StoreService;
import com.etc.weigo.util.MyData;
import com.google.gson.Gson;

/**
 * Servlet implementation class Goodsservlet
 */
@WebServlet("/Goodsservlet")
public class Goodsservlet extends HttpServlet {
	GoodsService gs = new GoodsService();
	List<Goods> list = new ArrayList<Goods>();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Goodsservlet() {
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
		PrintWriter out = response.getWriter();
		if(request.getParameter("op")!="") {
			String op = request.getParameter("op");
			if(op.equals("searchbycloth")) {
					list = gs.findbytype(21);
					System.out.println("cloth"+list);
			}
			if(op.equals("searchbyphone")) {
					list = gs.findbytype(43);
					System.out.println("phone"+list);
			}
			if(op.equals("searchbyfoods")) {
					list = gs.findbytype(46);
					System.out.println("foods"+list);
					
			}if(op.equals("searchbyparentsid")) {
				String parnetsidstr = request.getParameter("PARENTSID");
				int PARENTSID = Integer.parseInt(parnetsidstr);
				System.out.println(PARENTSID);
				list = gs.chabymtype(PARENTSID);
				System.out.println("parentid"+list);
				request.setAttribute("list", list);
				request.getRequestDispatcher("home_jsp/search.jsp").forward(request, response);
			}

			if(op.equals("information")) {
				 String GOODSID = request.getParameter("goodsid");
				 System.out.println("goodsid:"+GOODSID);
				 int goodsid = Integer.parseInt(GOODSID);
				list = gs.chagoodsinformation(goodsid);
				System.out.println("goods:"+list);
				request.setAttribute("list", list);
				request.getRequestDispatcher("home_jsp/introduction.jsp").forward(request, response);
				return;
			}
			if(op.equals("searchsomegoods")) {
				if(request.getParameter("goodsname")!="") {
					String goodsname = request.getParameter("index_none_header_sysc");	
					System.out.println(goodsname);
					list=gs.findsomegoods(goodsname);					
					System.out.println(list);
					request.setAttribute("list", list);									
					request.getRequestDispatcher("home_jsp/search.jsp").forward(request, response);
					return;
					/*response.sendRedirect("/shop.jsp");*/
				}
			}
			if(op.equals("searchbychildid")){
				String typeidstr = request.getParameter("typeid");
				int typeid = Integer.parseInt(typeidstr);
				list = gs.findbytype(typeid);
				request.setAttribute("list", list);									
				request.getRequestDispatcher("home_jsp/search.jsp").forward(request, response);
				return;
			}
			//删除商品
			if(op.equals("delete")) {
				String storeidstr = request.getParameter("storeid");
				int storeid =Integer.parseInt(storeidstr);
				String goodsidstr = request.getParameter("goodsid");
				int goodsid = Integer.parseInt(goodsidstr);
				gs.changevisible(goodsid);
				list=gs.searchbystoreid(storeid);
			}
			//根据storeid和goodsstate（上下架状态）查找
			if(op.equals("searchbyidandstate")) {
				String storeidstr = request.getParameter("storeid");
				int storeid =Integer.parseInt(storeidstr);
				String goodsstatestr = request.getParameter("goodsstate");
				int goodsstate = Integer.parseInt(goodsstatestr);
				list=gs.searchbystate(storeid, goodsstate);
				
			}
			//显示已删除商品
			if(op.equals("deletegoods")) {
				String storeidstr = request.getParameter("storeid");
				int storeid =Integer.parseInt(storeidstr);
				list = gs.searchdelete(storeid);
			}
			//一键上下架，全部商品不做了
			if(op.equals("change")) {
				String storeidstr = request.getParameter("storeid");
				int storeid =Integer.parseInt(storeidstr);
				String statestr = request.getParameter("state");
				int state = Integer.parseInt(statestr);
				String goodsidstr = request.getParameter("goodsid");
				int goodsid = Integer.parseInt(goodsidstr);
				gs.changestate(goodsid, state);
				list=gs.searchbystate(storeid, state);
			}
			if(op.equals("addGoods")){
				String goodsName="";
				int goodsType=0;
				double goodsPrice=0;
				String goodsRemark="";
				int goodsCount=0;
				String goodsImg="";
				//String goodsDeImg="";
				//上传文件
				DiskFileItemFactory factory = new DiskFileItemFactory();
				 
				ServletFileUpload upload = new ServletFileUpload(factory);

				// Parse the request
				try {
					
					    List items = upload.parseRequest(request);
					    InputStream is = null;
					    Iterator iter = items.iterator();
					while (iter.hasNext()) {
					    FileItem item = (FileItem) iter.next();

					    if (item.isFormField()) {
					    	
					    	String name = item.getFieldName();
					        String value = item.getString("utf-8");
					        if (name.equals("goodsName")) {
					        	goodsName=value;
							}
					       /* else if (name.equals("goodsType")) {
					        	goodsType=value;
							}*/
					        else if (name.equals("goodsPrice")) {
					        	goodsPrice=Double.parseDouble(value);
							}
					        else if (name.equals("goodsContent")) {
					        	goodsRemark=value;
							}
					        else if (name.equals("goodsStock")) {
					        	goodsCount=Integer.parseInt(value);
							}
					       /* else if (name.equals("goodsImg")) {
					        	goodsImg=value;
							}*/
					        /*else if (name.equals("goodsDeImg")) {
					        	goodsDeImg=value;
							}
					       */
					        
					        
					    }
					    else {
					    	 String fieldName = item.getFieldName();
					    	 String fileName = item.getName();
					    	 //String houzhui = fileName.substring(fileName.lastIndexOf("."));
					    	// fileName = new Date().getTime()+houzhui;
					    	 //System.out.println(fieldName);
					    	 String contentType = item.getContentType();
					    	 boolean isInMemory = item.isInMemory();
					    	 long sizeInBytes = item.getSize();
					    	 String path=request.getRealPath("/images/"+fileName);
					    	 System.out.println("path:"+path);
					    	 File uploadedFile = new File(path);
					    	// File uploadedFile1 = new File("/SnacksAdmin/WebContent/GoodImgs"+fileName);
							 item.write(uploadedFile);
							 //item.write(uploadedFile1);
							 goodsImg = "images/"+fileName;	
						    
					    }
					  
					}
					int userId = 1;
					List<Store> myList = new ArrayList<Store>();
					StoreService ss = new StoreService();
					myList  = ss.getStore(userId);
					Store store = myList.get(0);
					Goods goods= new Goods(0, store.getSTOREID(), goodsName, goodsImg, goodsImg, goodsCount, goodsPrice, 0, 0, goodsRemark, 1, 0);
					System.out.println("上传的商品"+goods);
					gs.addgoods( store.getSTOREID(), goodsName, goodsImg, goodsImg, goodsCount, goodsPrice, 41, goodsRemark);
					
					//Goods goods2 = new Goods(gOODSID, sTOREID, gOODSNAME, gOODSIMG, gOODSDEIMG, gOODSCOUNT, gOODSPRICE, gOODSTYPE, gOODSSALECOUNT, gOODSREMARK, gOODSSTATE, gOODSVISIBLE)
					 //Goods g =new Goods(GOODS_NAME, GOODS_TYPE, GOODS_PRICE, GOODS_NUMBER, GOODS_DETAIL, GOODS_DATE, GOODS_TIME, GOODS_SPEC, GOODS_IMAGE, GOODS_STATUS, SELLERS_ACCOUNT);
				    // flag= gs.addgoods(g)+" "; 
				     /*out.print(flag);
	                 out.close();*/
				     
	             }catch (FileUploadException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		Gson gson = new Gson();
		MyData mydata =  new MyData<Goods>();
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
