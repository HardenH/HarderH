package com.etc.weigo.dao;

import java.util.List;

import com.etc.weigo.entity.goodsAndOrder;
import com.etc.weigo.util.BaseDao;

public class GoodsAndOrderDao {
	/**
	 * ���ݵ���id��ѯ���ж���
	 */
		public List<goodsAndOrder> getallorders(int storeid){
			return (List<goodsAndOrder>) BaseDao.select("select DISTINCT ordernum,ORDERDATE from VIEW_ORDER_GOODS where STOREID = ?", goodsAndOrder.class, storeid);
		}
		/**
		 * ���ݵ���id��ѯ��״̬��ѯ����
		 */
			public List<goodsAndOrder> getordersnum(int storeid,int ORDERSTATE){
				return (List<goodsAndOrder>) BaseDao.select("select DISTINCT ordernum,ORDERDATE from VIEW_ORDER_GOODS where STOREID = ?and ORDERSTATE =?", goodsAndOrder.class, storeid,ORDERSTATE);
			}
		/**
		 * ������Ʒ״̬�͵���id��ѯ����
		 * 
		 */
		public List<goodsAndOrder> getorders(int storeid,int ORDERSTATE){
			return (List<goodsAndOrder>) BaseDao.select("select * from VIEW_ORDER_GOODS where STOREID =? and ORDERSTATE =?", goodsAndOrder.class, storeid,ORDERSTATE);
		}
		/**
		 * ���ݶ�����Ų�ѯ��Ʒ
		 * @param myordernum
		 * @return
		 */
		public List<goodsAndOrder>  getgoodsinfo(int myordernum){
			return (List<goodsAndOrder>) BaseDao.select("select * from VIEW_ORDER_GOODS where ORDERNUM = ?", goodsAndOrder.class, myordernum);
		}
		/**
		 * ���Ķ���״̬
		 */
		public int changestatus(int ORDERSTATE,int ordersnum) {
			return BaseDao.execute("update ORDERS set ORDERSTATE=?+1 where ordernum = ?", ORDERSTATE,ordersnum);
		}
}
