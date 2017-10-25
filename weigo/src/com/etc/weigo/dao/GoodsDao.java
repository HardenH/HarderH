package com.etc.weigo.dao;

import java.util.List;

import com.etc.weigo.entity.Goods;
import com.etc.weigo.util.BaseDao;

public class GoodsDao {
	/**
	 * ģ��������Ʒ
	 * @return
	 */
 public List<Goods> find(String goodsname){
	 return (List<Goods>) BaseDao.select("select GOODSID,GOODSNAME,GOODSIMG,GOODSCOUNT,GOODSPRICE,GOODSSALECOUNT from goods where goodsname like ?", 
			 Goods.class,"%"+goodsname+"%" );
 }
 /**
  * �������Ͳ�����Ʒ
  * @param args
  */
 public List<Goods> findbytype(int goodstype){
	 return (List<Goods>) BaseDao.select("select * from goods where goodstype = ? ", Goods.class, goodstype);
 }
 /**
  * �̼��ϴ���Ʒ
  * @param args
  */
 public int addgoods(int storeid,String goodsname,String goodsimg,String goodsdeimg,int goodscount,double goodsprice,
		 int goodstype,String goodsremark){
	 return BaseDao.execute("insert into goods values(null,?,?,?,?,?,?,?,0,?,1,0)", storeid,goodsname,goodsimg,
			 goodsdeimg,goodscount,goodsprice,goodstype,goodsremark);
	 
 }
 /**
  * ��Ʒ�¼�
  * @param args
  */
 public int changeyisible(int goodsid) {
	 return BaseDao.execute("update goods set GOOdSVISIBLE = 1 where goodsid = ? ", goodsid);
 }
 /**
  * �޸���Ʒ����
  */
 public int change(int goodscount ,String goodsimg,String goodsdeimg,double goodsprice,String goodsremark) {
 return BaseDao.execute("update goods set GOODSCOUNT = ? ,GOODSIMG =?,GOODSDEIMG = ? ,GOODSPRICE =?,GOODSREMARK = ?", goodscount,goodsimg,goodsdeimg,goodsprice,goodsremark);
 }
 /**
  * �������Ͳ�����Ʒ
  * @param PARENTSID
  * @return
  */
 public List<Goods> chabymtype(int PARENTSID){
	 return (List<Goods>) BaseDao.select("select * from VIEW_GOODS_GOODSTYPE where PARENTSID =?", Goods.class, PARENTSID);
 }
 /**
  * ��ѯ��Ʒ����
  */
 public List<Goods> chagoodsinformation(int GOODSID){
	 return (List<Goods>) BaseDao.select("select * from GOODS where GOODSID = ?", Goods.class, GOODSID);
 }
/**
 * ��������id��ѯ��Ʒ
 */
public List<Goods> searchbystoreid(int storeid){
	 return (List<Goods>) BaseDao.select("select * from GOODS where STOREID = ? and GOODSVISIBLE=0 ", Goods.class, storeid);
}
/**
 * ������Ʒid����GOODSVISIBLE
 */
public int changevisible(int goodsid) {
	 return BaseDao.execute("update goods set GOODSVISIBLE=1 where goodsid = ? ", goodsid);
}
/**
 * ���ݵ���id����Ʒ���¼�����ѯ
 */
public List<Goods> searchbystate(int storeid ,int goodsstate) {
	 return  (List<Goods>) BaseDao.select("select * from goods where STOREID =? AND GOODSSTATE = ?and GOODSVISIBLE=0", Goods.class, storeid,goodsstate);
	 
}
/**
 * ����GOODSVISIBLE��������Ʒ
 */
public List<Goods> searchdelete(int storeid){
	 return (List<Goods>) BaseDao.select("select * from goods where GOODSVISIBLE=1 and storeid = ?", Goods.class, storeid);
}
/**
 * ����state goodsid�жϸı����¼�״̬
 */
public int changestate(int goodsid , int state) {
	 String sql ="";
	 if(state==1) {
	sql = "update goods set GOODSSTATE = 0 WHERE GOODSID = ?";
}
else {
	sql = "update goods set GOODSSTATE = 1 WHERE GOODSID = ?";
}
	 return BaseDao.execute(sql, goodsid);
}
 
}
 
