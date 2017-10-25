package com.etc.weigo.service;

import java.util.List;

import com.etc.weigo.dao.GoodsCarDao;
import com.etc.weigo.entity.GoodsCar;
import com.etc.weigo.entity.VIEW_GOODSCAR;


public class GoodsCarService {
	GoodsCarDao gcd = new GoodsCarDao();
	
	/**
	 * 根据用户id查找购物车记录数
	 * @return
	 */
 public List<GoodsCar> AllGoodsCar(int userid){
	 return gcd.AllGoodsCar(userid);
 }
 
 /**
	 * 根据用户id查找购物车记录数
	 * @return
	 */
public boolean Addgoods(GoodsCar goodscar){
	 return gcd.Addgoods(goodscar);
}
 

/**
 * 修改加入购物车的商品数量
 * @return
 */
public boolean updateGoodsCar(int goodsCarId,int goodsCount){
	return gcd.updateGoodsCar(goodsCarId, goodsCount);
}


/**
 * 根据购物车id删除对应的购物车
 * @return
 */
public boolean deleteGoodsCar(int goodsCarId){
	return gcd.deleteGoodsCar(goodsCarId);
}

/**
 * 根据用户id查找购物车视图
 * @return
 */
public List<VIEW_GOODSCAR> getAllViews(int userId){
 return gcd.getAllView(userId);
}

/**
 * 根据购物车id查找购物车视图
 * @return
 */
public List<VIEW_GOODSCAR> getAllViewbyCartIds(int goodsCarId){
 return gcd.getAllViewByCartId(goodsCarId);
}

/**
 * 根据购物车id查找购物车视图
 * @return
 */
public List<VIEW_GOODSCAR> getOrder(int goodsCarId){
 return gcd.getOrder(goodsCarId);
}


}
