package com.service;

import java.util.List;

import com.Dao.GoodsCarDao;
import com.Dao.VIEW_GOODSCAR_DAO;
import com.entity.GoodsCar;
import com.entity.VIEW_GOODSCAR;


public class VIEW_GOODSCAR_SERVICE {
	VIEW_GOODSCAR_DAO vgd = new VIEW_GOODSCAR_DAO();
	
	/**
	 * 根据用户id查找购物车记录数
	 * @return
	 */
 public List<VIEW_GOODSCAR> getAllViews(int userId){
	 return vgd.getAllView(userId);
 }
 

}
