package com.Dao;

import java.util.ArrayList;
import java.util.List;

import com.entity.Goods;
import com.entity.GoodsCar;
import com.etc.util.BaseDao;

public class GoodsCarDao {
	/**
	 * ��ѯ���ﳵ���м�¼-��Ʒ��¼��
	 * @return
	 */
 public List<GoodsCar> AllGoodsCar(int userid){
	
	 return (List<GoodsCar>) BaseDao.select("select * from GoodsCar where userid= ?", 
			 GoodsCar.class,userid);
 }
 
 /**
	 * ���빺�ﳵ��¼
	 * @return
	 */
public boolean Addgoods(GoodsCar goodscar){
	
	 return  BaseDao.execute("INSERT INTO GOODSCAR VALUES (null,?,?,?)",goodscar.getGOODSID(),goodscar.getGOODSCOUT(),goodscar.getUSERID())>0;
			 }




 
 
}
 
