package com.service;

import java.util.ArrayList;
import java.util.List;

import com.Dao.GoodsDao;
import com.entity.Goods;

public class goodsservice {
	GoodsDao gd = new GoodsDao();
	/**
	 * ģ��������Ʒ
	 * @return
	 */
 public List<Goods> find(String goodsname){
	 return gd.find(goodsname);
 }
 /**
  * �������Ͳ�����Ʒ
  * @param args
  */
 public List<Goods> findbytype(int goodstype){
return gd.findbytype(goodstype);	 
 }
 /**
  * �̼��ϴ���Ʒ
  * @param args
  */
 public int addgoods(int storeid,String goodsname,String goodsimg,String goodsdeimg,int goodscount,double goodsprice,
		 int goodstype,String goodsremark){
	 return gd.addgoods(storeid, goodsname, goodsimg, goodsdeimg, goodscount, goodsprice, goodstype, goodsremark);
 }
 /**
  * ��Ʒ�¼�
  * @param args
  */
 public int changeyisible(int goodsid) {
	 return gd.changeyisible(goodsid);
 }
 /**
  * �޸���Ʒ����
  */
 public int change(int goodscount ,String goodsimg,String goodsdeimg,double goodsprice,String goodsremark) {
	 return gd.change(goodscount, goodsimg, goodsdeimg, goodsprice, goodsremark);
 }


	 
 }
