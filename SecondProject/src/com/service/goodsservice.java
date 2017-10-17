package com.service;

import java.util.ArrayList;
import java.util.List;

import com.Dao.GoodsDao;
import com.entity.Goods;

public class goodsservice {
	GoodsDao gd = new GoodsDao();
	/**
	 * 模糊查找商品
	 * @return
	 */
 public List<Goods> find(String goodsname){
	 return gd.find(goodsname);
 }
 /**
  * 根据类型查找商品
  * @param args
  */
 public List<Goods> findbytype(int goodstype){
return gd.findbytype(goodstype);	 
 }
 /**
  * 商家上传商品
  * @param args
  */
 public int addgoods(int storeid,String goodsname,String goodsimg,String goodsdeimg,int goodscount,double goodsprice,
		 int goodstype,String goodsremark){
	 return gd.addgoods(storeid, goodsname, goodsimg, goodsdeimg, goodscount, goodsprice, goodstype, goodsremark);
 }
 /**
  * 商品下架
  * @param args
  */
 public int changeyisible(int goodsid) {
	 return gd.changeyisible(goodsid);
 }
 /**
  * 修改商品属性
  */
 public int change(int goodscount ,String goodsimg,String goodsdeimg,double goodsprice,String goodsremark) {
	 return gd.change(goodscount, goodsimg, goodsdeimg, goodsprice, goodsremark);
 }


	 
 }
