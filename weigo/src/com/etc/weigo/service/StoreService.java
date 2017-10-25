package com.etc.weigo.service;

import java.util.List;

import com.etc.weigo.dao.StoreDao;
import com.etc.weigo.entity.Store;

public class StoreService {
	StoreDao sd= new StoreDao();
	public List<Store> getstoreinfo(int storeid){
		return sd.getstoreinfo(storeid);
	}
	
	public boolean updstoreinfo(Store store) {
		return sd.updstoreinfo(store);
	}
	/**
	 * 根据userId查询店铺信息
	 */
	public List<Store> getStore(int userId){
		return sd.getStore(userId);
	}

}
