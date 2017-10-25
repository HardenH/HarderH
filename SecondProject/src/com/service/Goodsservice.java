package com.service;

import java.util.ArrayList;
import java.util.List;

import com.Dao.GoodsDao;
import com.entity.Goods;

public class Goodsservice {
	GoodsDao gd = new GoodsDao();
	/**
	 * ģ��������Ʒ
	 * @return
	 */
 public List<Goods> find(String goodsname){
	 return gd.find(goodsname);
 }
 /**
  * ����������ʾ��Ʒ
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
 /**
  * ���������Ͳ�����Ʒ
  */
 public List<Goods> chabymtype(int PARENTSID){
	 return gd.chabymtype(PARENTSID);
 }
 /**
  * 查询商品详情
  */
 public List<Goods> chagoodsinformation(int GOODSID){
	 return gd.chagoodsinformation(GOODSID);
 }
 /**
  * 根据商铺id查询商品
  */
 public List<Goods> searchbystoreid(int storeid){
	 return gd.searchbystoreid(storeid);
 }
 /**
  * 根据商品id更改GOODSVISIBLE
  */
 public int changevisible(int goodsid) {
	 return gd.changevisible(goodsid);
 }
 /**
  * 根据店铺id和商品上下架来查询
  */
 public List<Goods> searchbystate(int storeid ,int goodsstate) {
	 return gd.searchbystate(storeid, goodsstate);
 }
 /**
  * 根据GOODSVISIBLE来查找商品
  */
 public List<Goods> searchdelete(int storeid){
	 return gd.searchdelete(storeid);
 }
 /**
  * 根据state goodsid判断改变上下架状态
  */
 public int changestate(int goodsid , int state) {
	 return gd.changestate(goodsid, state);
 }
	 
 }
