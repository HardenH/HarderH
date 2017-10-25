package com.service;

import java.util.List;

import com.Dao.GoodsAndOrderDao;
import com.entity.goodsAndOrder;

public class GoodsAndOrderservice {
GoodsAndOrderDao gaod = new GoodsAndOrderDao(); 
	/**
	 * 根据用户id查询所有订单
	 */
		public List<goodsAndOrder> getallorders(int storeid){
			return gaod.getallorders(storeid);
		}
		/**
		 * 根据商品状态和店铺id查询订单
		 * 
		 */
		public List<goodsAndOrder> getorders(int storeid,int ORDERSTATE){
			return gaod.getorders(storeid, ORDERSTATE);
		}
		public List<goodsAndOrder>  getgoodsinfo(int myordernum){
			return gaod.getgoodsinfo(myordernum);
		}
		/**
		 * 根据店铺id查询和状态查询订单
		 */
			public List<goodsAndOrder> getordersnum(int storeid,int ORDERSTATE){
				return gaod.getordersnum(storeid, ORDERSTATE);
			}
		/**
		 * 更改订单状态
		 */
		public int changestatus(int ORDERSTATE,int ordersnum) {
			return gaod.changestatus(ORDERSTATE, ordersnum);
		}
		
		
}
