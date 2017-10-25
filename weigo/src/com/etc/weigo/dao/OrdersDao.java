package com.etc.weigo.dao;

import com.etc.weigo.entity.Orders;
import com.etc.weigo.util.BaseDao;



public class OrdersDao {
	
	      //Ìí¼Ó¶©µ¥--´ýÖ§¸¶
		   public boolean addOrders(Orders orders){
			System.out.println("DAO-orders:"+orders);
			return BaseDao.execute("INSERT INTO ORDERS(ORDERNUM, GOODSID, ORDERTOTALPRICE, COUNT, CADDRESS, CPHONE, CONSIGNEE, USERID, STOREID, ORDERREMARK) VALUES (?,?,?,?,?,?,?,?,?,?)",
					orders.getORDERNUM(),orders.getGOODSID(),orders.getORDERTOTALPRICE(),orders.getCOUNT(),orders.getCADDRESS(),orders.getCPHONE(),orders.getCONSIGNEE(),orders.getUSERID(),orders.getSTOREID(),orders.getORDERREMARK())>0;
					
		}

}
