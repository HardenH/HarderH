package com.etc.weigo.service;

import com.etc.weigo.dao.OrdersDao;
import com.etc.weigo.entity.Orders;

public class OrdersService {
	
	OrdersDao od=new OrdersDao();

			//��Ӷ���--��֧��
		public boolean addOrders(Orders orders){
			return od.addOrders(orders);
			
			
		}
	
	
}
