package com.Dao;

import java.util.List;

import com.entity.GoodsCar;
import com.entity.VIEW_GOODSCAR;
import com.etc.util.BaseDao;

public class VIEW_GOODSCAR_DAO {
	/**
	 * 根据用户id查询视图的所有记录
	 * @return
	 */
 public List<VIEW_GOODSCAR> getAllView(int userId){
	
	 return (List<VIEW_GOODSCAR>) BaseDao.select("select * from VIEW_GOODSCAR where userid= ?", 
			 VIEW_GOODSCAR.class,userId);
 }
 





 
 
}
 
