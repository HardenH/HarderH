package com.etc.weigo.service;

import java.util.List;

import com.etc.weigo.dao.GoodsDao;
import com.etc.weigo.entity.Goods;

public class GoodsService {
	GoodsDao gd = new GoodsDao();
	/**
	 * ģ��������Ʒ
	 * @return
	 */
 public List<Goods> findsomegoods(String goodsname){
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
 /**
  * �������Ͳ�ѯ��Ʒ
  * @param PARENTSID
  * @return
  */
 public List<Goods> chabymtype(int PARENTSID){
	 return gd.chabymtype(PARENTSID);
 }
 /**
  * ��ѯ��Ʒ����
  */
 public List<Goods> chagoodsinformation(int GOODSID){
	 return gd.chagoodsinformation(GOODSID);
 }
 /**
  * ��������id��ѯ��Ʒ
  */
 public List<Goods> searchbystoreid(int storeid){
	 return gd.searchbystoreid(storeid);
 }
 /**
  * ������Ʒid����GOODSVISIBLE
  */
 public int changevisible(int goodsid) {
	 return gd.changevisible(goodsid);
 }
 /**
  * ���ݵ���id����Ʒ���¼�����ѯ
  */
 public List<Goods> searchbystate(int storeid ,int goodsstate) {
	 return gd.searchbystate(storeid, goodsstate);
 }
 /**
  * ����GOODSVISIBLE��������Ʒ
  */
 public List<Goods> searchdelete(int storeid){
	 return gd.searchdelete(storeid);
 }
 /**
  * ����state goodsid�жϸı����¼�״̬
  */
 public int changestate(int goodsid , int state) {
	 return gd.changestate(goodsid, state);
 }
	 
 }
