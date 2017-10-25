package com.etc.weigo.service;
import java.util.ArrayList;
import java.util.List;


import com.etc.weigo.dao.TypeDao;
import com.etc.weigo.entity.Type;

public class Typeservice {
	TypeDao td = new TypeDao();
	List<Type> list = new ArrayList<Type>();
	public List<Type> gettype(int GRAPARENTSID){
		List<Type> list = td.gettype(GRAPARENTSID);

	
	return list;
	}
	public List<Type> gettypename(int PARENTSID){
		return td.gettypename(PARENTSID);
	}
	/**
	 * 得到父类的父类类别
	 */
	public List<Type> getgraparentsname(){
		return td.getgraparentsname();
	}
}
