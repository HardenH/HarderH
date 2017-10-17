package com.testdao;



import java.util.ArrayList;
import java.util.List;

import com.Dao.GoodsDao;
import com.entity.Goods;


public class Testgoodsdao {
public static void main(String[] args) {
	GoodsDao gd = new GoodsDao();
	List<Goods> list = new ArrayList<>(); 
	gd.changeyisible(41);
	
	 
}
}
