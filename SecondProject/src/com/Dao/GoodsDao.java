package com.Dao;

import java.util.ArrayList;
import java.util.List;

import com.entity.Goods;
import com.etc.util.BaseDao;

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
  * ����������ʾ��Ʒ
  * @param args
  */
 public List<Goods> findbytype(int goodstype){
	 return (List<Goods>) BaseDao.select("select GOODSID,GOODSNAME,GOODSIMG,GOODSCOUNT,GOODSPRICE,GOODSSALECOUNT from goods where goodstype = ? ", Goods.class, goodstype);
 }
 /**
  * �̼��ϴ���Ʒ
  * @param args
  */
 public int addgoods(int storeid,String goodsname,String goodsimg,String goodsdeimg,int goodscount,double goodsprice,
		 int goodstype,String goodsremark){
	 return BaseDao.execute("insert into goods values(null,?,?,?,?,?,?,?,0,?,0,0)", storeid,goodsname,goodsimg,
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
  * ���������Ͳ�����Ʒ
  */
 public List<Goods> chabymtype(int PARENTSID){
	 return (List<Goods>) BaseDao.select("select * from VIEW_GOODS_GOODSTYPE where PARENTSID =?", Goods.class, PARENTSID);
 }
 /**
  * 查询商品详情
  */
 public List<Goods> chagoodsinformation(int GOODSID){
	 return (List<Goods>) BaseDao.select("select * from GOODS where GOODSID = ?", Goods.class, GOODSID);
 }
 /**
  * 根据商铺id查询商品
  */
 public List<Goods> searchbystoreid(int storeid){
	 return (List<Goods>) BaseDao.select("select * from GOODS where STOREID = ? and GOODSVISIBLE=0 ", Goods.class, storeid);
 }
 /**
  * 根据商品id更改GOODSVISIBLE
  */
 public int changevisible(int goodsid) {
	 return BaseDao.execute("update goods set GOODSVISIBLE=1 where goodsid = ? ", goodsid);
 }
 /**
  * 根据店铺id和商品上下架来查询
  */
 public List<Goods> searchbystate(int storeid ,int goodsstate) {
	 return  (List<Goods>) BaseDao.select("select * from goods where STOREID =? AND GOODSSTATE = ?and GOODSVISIBLE=0", Goods.class, storeid,goodsstate);
	 
 }
 /**
  * 根据GOODSVISIBLE来查找商品
  */
 public List<Goods> searchdelete(int storeid){
	 return (List<Goods>) BaseDao.select("select * from goods where GOODSVISIBLE=1 and storeid = ?", Goods.class, storeid);
 }
 /**
  * 根据state goodsid判断改变上下架状态
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
 
