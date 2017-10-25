package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.entity.GoodsCar;
import com.service.GoodsCarService;
import com.service.VIEW_GOODSCAR_SERVICE;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/GoodsCarServlet")
public class GoodsCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// ������һ��ȫ�ֵ� GoodsCarService �κεķ����п���ʹ��GoodsCarService����ķ���
	GoodsCarService gcs = new GoodsCarService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GoodsCarServlet() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		// ���빺�ﳵ���� Addgoods
		if (request.getParameter("op") != null) {
			String op = request.getParameter("op");
			if (op.equals("Addgoods")) {

				// String goodsCarId=request.getParameter("goodsCarId");
				String strgoodId = request.getParameter("goodsId");
				String strgoodsCount = request.getParameter("goodsCout");
				String struserId = request.getParameter("user_Id");
				int goodsId = Integer.parseInt(strgoodId);
				int goodsCount = Integer.parseInt(strgoodsCount);
				int user_Id = Integer.parseInt(struserId);
				System.out.println(goodsId + "," + goodsCount + "," + user_Id);
				System.out.println("�������ݳɹ�");

				/* ���²�ѯ���ݿ⣬��ȡ��¼�� */
				// �õ�һ��goodscar
				GoodsCar goodscar = new GoodsCar(0, goodsId, goodsCount, user_Id);

				// ����service�ķ���Addgoods
				gcs.Addgoods(goodscar);

				
				 // ����service dao ��ɲ�ѯ 
				List<GoodsCar> list=gcs.AllGoodsCar(user_Id);
				 
				 //��Ʒ�ļ�¼�� 
				int count=list.size(); session.setAttribute("buyCount", count);
				System.out.println("���ݲ�ѯ�ɹ�������ҳ��");
				 

				response.sendRedirect("home_jsp/introduction.jsp");
			}
		}
	}

}
