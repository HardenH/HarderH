package com.etc.weigo.service;

import java.util.List;

import com.etc.weigo.dao.GoodsAndOrderDao;
import com.etc.weigo.entity.goodsAndOrder;

public class GoodsAndOrderservice {
	GoodsAndOrderDao gaod = new GoodsAndOrderDao(); 
	/**
	 * �����û�id��ѯ���ж���
	 */
		public List<goodsAndOrder> getallorders(int storeid){
			return gaod.getallorders(storeid);
		}
		/**
		 * ������Ʒ״̬�͵���id��ѯ����
		 * 
		 */
		public List<goodsAndOrder> getorders(int storeid,int ORDERSTATE){
			return gaod.getorders(storeid, ORDERSTATE);
		}
		public List<goodsAndOrder>  getgoodsinfo(int myordernum){
			return gaod.getgoodsinfo(myordernum);
		}
		/**
		 * ���ݵ���id��ѯ��״̬��ѯ����
		 */
			public List<goodsAndOrder> getordersnum(int storeid,int ORDERSTATE){
				return gaod.getordersnum(storeid, ORDERSTATE);
			}
		/**
		 * ���Ķ���״̬
		 */
		public int changestatus(int ORDERSTATE,int ordersnum) {
			return gaod.changestatus(ORDERSTATE, ordersnum);
		}
		
		
}
