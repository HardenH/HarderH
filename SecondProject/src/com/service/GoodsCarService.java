package com.service;

import java.util.List;

import com.Dao.GoodsCarDao;
import com.entity.GoodsCar;


public class GoodsCarService {
	GoodsCarDao gcd = new GoodsCarDao();
	
	/**
	 * �����û�id���ҹ��ﳵ��¼��
	 * @return
	 */
 public List<GoodsCar> AllGoodsCar(int userid){
	 return gcd.AllGoodsCar(userid);
 }
 
 /**
	 * �����û�id���ҹ��ﳵ��¼��
	 * @return
	 */
public boolean Addgoods(GoodsCar goodscar){
	 return gcd.Addgoods(goodscar);
}
 

}
