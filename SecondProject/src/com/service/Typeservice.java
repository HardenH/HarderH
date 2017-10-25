package com.service;
import com.entity.Type;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.Dao.TypeDao;

public class Typeservice {
	TypeDao td = new TypeDao();
	
	List<Type> list = new ArrayList<>();
	public List<Type> gettype(int GRAPARENTSID){
	return  list = td.gettype(GRAPARENTSID);
	
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
