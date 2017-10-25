package com.etc.weigo.service;

import java.util.List;

import com.etc.weigo.dao.GoodsCarDao;
import com.etc.weigo.entity.GoodsCar;
import com.etc.weigo.entity.VIEW_GOODSCAR;


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
 

/**
 * �޸ļ��빺�ﳵ����Ʒ����
 * @return
 */
public boolean updateGoodsCar(int goodsCarId,int goodsCount){
	return gcd.updateGoodsCar(goodsCarId, goodsCount);
}


/**
 * ���ݹ��ﳵidɾ����Ӧ�Ĺ��ﳵ
 * @return
 */
public boolean deleteGoodsCar(int goodsCarId){
	return gcd.deleteGoodsCar(goodsCarId);
}

/**
 * �����û�id���ҹ��ﳵ��ͼ
 * @return
 */
public List<VIEW_GOODSCAR> getAllViews(int userId){
 return gcd.getAllView(userId);
}

/**
 * ���ݹ��ﳵid���ҹ��ﳵ��ͼ
 * @return
 */
public List<VIEW_GOODSCAR> getAllViewbyCartIds(int goodsCarId){
 return gcd.getAllViewByCartId(goodsCarId);
}

/**
 * ���ݹ��ﳵid���ҹ��ﳵ��ͼ
 * @return
 */
public List<VIEW_GOODSCAR> getOrder(int goodsCarId){
 return gcd.getOrder(goodsCarId);
}


}
