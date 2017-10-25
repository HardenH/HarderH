package com.etc.weigo.dao;

import java.util.List;

import com.etc.weigo.entity.GoodsCar;
import com.etc.weigo.entity.VIEW_GOODSCAR;
import com.etc.weigo.util.BaseDao;

public class GoodsCarDao {
	/**
	 * 查询购物车所有记录-商品记录数
	 * @return
	 */
 public List<GoodsCar> AllGoodsCar(int userid){
	
	 return (List<GoodsCar>) BaseDao.select("select * from GoodsCar where userid= ?", 
			 GoodsCar.class,userid);
 }
 
 /**
	 * 插入购物车记录
	 * @return
	 */
public boolean Addgoods(GoodsCar goodscar){
	
	 return  BaseDao.execute("INSERT INTO GOODSCAR VALUES (null,?,?,?)",goodscar.getGOODSID(),goodscar.getGOODSCOUT(),goodscar.getUSERID())>0;
			 }

    /*
     * 修改加入购物车的商品数量
     */
	public boolean updateGoodsCar(int goodsCarId,int goodsCount){
		return BaseDao.execute("update goodscar set goodsCout=? where goodsCarId=?", goodsCount,goodsCarId)>0;
	}
	
	
	 /*
     * 根据购物车id删除对应的购物车
     */
	public boolean deleteGoodsCar(int goodsCarId){
		return BaseDao.execute("delete from GOODSCAR where goodsCarId=?",goodsCarId)>0;
	}
	
	
	
	
	/**
	 * 根据用户id查询视图的所有记录
	 * @return
	 */
 public List<VIEW_GOODSCAR> getAllView(int userId){
	
	 return (List<VIEW_GOODSCAR>) BaseDao.select("select * from VIEW_GOODSCAR where userid= ?", 
			 VIEW_GOODSCAR.class,userId);
 }
 
 /**
	 * 根据购物车id查询视图的所有记录
	 * @return
	 */
public List<VIEW_GOODSCAR> getAllViewByCartId(int goodsCarId){
	
	 return (List<VIEW_GOODSCAR>) BaseDao.select("select * from VIEW_GOODSCAR where GOODSCARID= ?", 
			 VIEW_GOODSCAR.class,goodsCarId);
}

/**
	 * 根据购物车id查询视图的所有记录
	 * @return
	 */
public List<VIEW_GOODSCAR> getOrder(int goodsCarId){
	
	 return (List<VIEW_GOODSCAR>) BaseDao.select("select * from VIEW_GOODSCAR where GOODSCARID= ?", 
			 VIEW_GOODSCAR.class,goodsCarId);
}


 
 
}
 
