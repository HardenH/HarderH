package com.service;

import java.util.List;

import com.Dao.GoodsCarDao;
import com.Dao.VIEW_GOODSCAR_DAO;
import com.entity.GoodsCar;
import com.entity.VIEW_GOODSCAR;


public class VIEW_GOODSCAR_SERVICE {
	VIEW_GOODSCAR_DAO vgd = new VIEW_GOODSCAR_DAO();
	
	/**
	 * �����û�id���ҹ��ﳵ��¼��
	 * @return
	 */
 public List<VIEW_GOODSCAR> getAllViews(int userId){
	 return vgd.getAllView(userId);
 }
 

}
