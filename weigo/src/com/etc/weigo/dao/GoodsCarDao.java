package com.etc.weigo.dao;

import java.util.List;

import com.etc.weigo.entity.GoodsCar;
import com.etc.weigo.entity.VIEW_GOODSCAR;
import com.etc.weigo.util.BaseDao;

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

    /*
     * �޸ļ��빺�ﳵ����Ʒ����
     */
	public boolean updateGoodsCar(int goodsCarId,int goodsCount){
		return BaseDao.execute("update goodscar set goodsCout=? where goodsCarId=?", goodsCount,goodsCarId)>0;
	}
	
	
	 /*
     * ���ݹ��ﳵidɾ����Ӧ�Ĺ��ﳵ
     */
	public boolean deleteGoodsCar(int goodsCarId){
		return BaseDao.execute("delete from GOODSCAR where goodsCarId=?",goodsCarId)>0;
	}
	
	
	
	
	/**
	 * �����û�id��ѯ��ͼ�����м�¼
	 * @return
	 */
 public List<VIEW_GOODSCAR> getAllView(int userId){
	
	 return (List<VIEW_GOODSCAR>) BaseDao.select("select * from VIEW_GOODSCAR where userid= ?", 
			 VIEW_GOODSCAR.class,userId);
 }
 
 /**
	 * ���ݹ��ﳵid��ѯ��ͼ�����м�¼
	 * @return
	 */
public List<VIEW_GOODSCAR> getAllViewByCartId(int goodsCarId){
	
	 return (List<VIEW_GOODSCAR>) BaseDao.select("select * from VIEW_GOODSCAR where GOODSCARID= ?", 
			 VIEW_GOODSCAR.class,goodsCarId);
}

/**
	 * ���ݹ��ﳵid��ѯ��ͼ�����м�¼
	 * @return
	 */
public List<VIEW_GOODSCAR> getOrder(int goodsCarId){
	
	 return (List<VIEW_GOODSCAR>) BaseDao.select("select * from VIEW_GOODSCAR where GOODSCARID= ?", 
			 VIEW_GOODSCAR.class,goodsCarId);
}


 
 
}
 
