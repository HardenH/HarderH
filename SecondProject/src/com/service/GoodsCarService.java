package com.service;

import java.util.List;

import com.Dao.GoodsCarDao;
import com.entity.GoodsCar;


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
 

}
