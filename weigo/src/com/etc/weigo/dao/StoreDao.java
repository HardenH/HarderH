package com.etc.weigo.dao;

import java.util.List;

import com.etc.weigo.entity.Store;
import com.etc.weigo.util.BaseDao;

public class StoreDao {
	
	public List<Store> getstoreinfo(int storeid){
		String sql="select * from store where storeid=?";
		return (List<Store>) BaseDao.select(sql, Store.class,storeid);
	}
	
	
	public boolean updstoreinfo(Store store) {
		String sql= "update store set userid=?,storename=?,storescore=?,storeintro=?,storephone=?,storeclick=?,storestate=? where storeid=?";
		return BaseDao.execute(sql,1,store.getSTORENAME(),1000,store.getSTOREINTRO(),store.getSTOREPHONE(),1000,0,1)>0;
	}
	/**
	 * 根据userId查询店铺信息
	 */
	public List<Store> getStore(int userId){
		String sql = "select * from store where userId =?";
		return (List<Store>) BaseDao.select(sql, Store.class, userId);
	}
	
}
