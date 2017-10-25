package com.etc.weigo.dao;

import java.util.List;

import com.etc.weigo.entity.goodsAndOrder;
import com.etc.weigo.util.BaseDao;

public class GoodsAndOrderDao {
	/**
	 * 根据店铺id查询所有订单
	 */
		public List<goodsAndOrder> getallorders(int storeid){
			return (List<goodsAndOrder>) BaseDao.select("select DISTINCT ordernum,ORDERDATE from VIEW_ORDER_GOODS where STOREID = ?", goodsAndOrder.class, storeid);
		}
		/**
		 * 根据店铺id查询和状态查询订单
		 */
			public List<goodsAndOrder> getordersnum(int storeid,int ORDERSTATE){
				return (List<goodsAndOrder>) BaseDao.select("select DISTINCT ordernum,ORDERDATE from VIEW_ORDER_GOODS where STOREID = ?and ORDERSTATE =?", goodsAndOrder.class, storeid,ORDERSTATE);
			}
		/**
		 * 根据商品状态和店铺id查询订单
		 * 
		 */
		public List<goodsAndOrder> getorders(int storeid,int ORDERSTATE){
			return (List<goodsAndOrder>) BaseDao.select("select * from VIEW_ORDER_GOODS where STOREID =? and ORDERSTATE =?", goodsAndOrder.class, storeid,ORDERSTATE);
		}
		/**
		 * 根据订单编号查询商品
		 * @param myordernum
		 * @return
		 */
		public List<goodsAndOrder>  getgoodsinfo(int myordernum){
			return (List<goodsAndOrder>) BaseDao.select("select * from VIEW_ORDER_GOODS where ORDERNUM = ?", goodsAndOrder.class, myordernum);
		}
		/**
		 * 更改订单状态
		 */
		public int changestatus(int ORDERSTATE,int ordersnum) {
			return BaseDao.execute("update ORDERS set ORDERSTATE=?+1 where ordernum = ?", ORDERSTATE,ordersnum);
		}
}
