package com.Dao;

import java.util.ArrayList;
import java.util.List;

import com.entity.Goods;
import com.etc.cms.util.BaseDao;

public class GoodsDao {
	/**
	 * 模糊查找商品
	 * @return
	 */
 public List<Goods> find(String goodsname){
	 return (List<Goods>) BaseDao.select("select GOODSNAME,GOODSIMG,GOODSCOUNT,GOODSPRICE,GOODSSALECOUNT from goods where goodsname like ?", 
			 Goods.class,"%"+goodsname+"%" );
 }
 /**
  * 根据类型查找商品
  * @param args
  */
 public List<Goods> findbytype(int goodstype){
	 return (List<Goods>) BaseDao.select("select GOODSNAME,GOODSIMG,GOODSCOUNT,GOODSPRICE,GOODSSALECOUNT from goods where goodstype = ? ", Goods.class, goodstype);
 }
 /**
  * 商家上传商品
  * @param args
  */
 public int addgoods(int storeid,String goodsname,String goodsimg,String goodsdeimg,int goodscount,double goodsprice,
		 int goodstype,String goodsremark){
	 return BaseDao.execute("insert into goods values(null,?,?,?,?,?,?,?,0,?,0,0)", storeid,goodsname,goodsimg,
			 goodsdeimg,goodscount,goodsprice,goodstype,goodsremark);
	 
 }
 /**
  * 商品下架
  * @param args
  */
 public int changeyisible(int goodsid) {
	 return BaseDao.execute("update goods set GOOdSVISIBLE = 1 where goodsid = ? ", goodsid);
 }
 /**
  * 修改商品属性
  */
 public int change(int goodscount ,String goodsimg,String goodsdeimg,double goodsprice,String goodsremark) {
 return BaseDao.execute("update goods set GOODSCOUNT = ? ,GOODSIMG =?,GOODSDEIMG = ? ,GOODSPRICE =?,GOODSREMARK = ?", goodscount,goodsimg,goodsdeimg,goodsprice,goodsremark);
 }
}
 
