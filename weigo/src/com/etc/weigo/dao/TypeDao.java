package com.etc.weigo.dao;

import java.util.List;

import com.etc.weigo.entity.Type;
import com.etc.weigo.util.BaseDao;

public class TypeDao {
	/**
	 * ï¿½ï¿½Ò³ï¿½ï¿½ï¿½ï¿½Ä²ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ê¾ï¿½ï¿½ï¿½ï¿½
	 * @param GRAPARENTSID
	 * @return
	 */
public List<Type> gettype(int GRAPARENTSID){
	return (List<Type>) BaseDao.select("select  DISTINCT PARENTSNAME,PARENTSID from GOODSTYPE where  GRAPARENTSID=? AND CHILDID IS NOT NULL", Type.class, GRAPARENTSID);
}
/**
 * ï¿½ï¿½Ò³ï¿½ï¿½ï¿½ï¿½ï¿½Ð¡ï¿½ï¿½ï¿½ï¿½ï¿½Ê¾
 * @param PARENTSID
 * @return
 */
public List<Type> gettypename(int PARENTSID){
	return (List<Type>) BaseDao.select("select typeid,typename,parentsid from goodstype where PARENTSID=? AND TYPENAME IS NOT NULL", Type.class, PARENTSID);
			}
/**
 * µÃµ½¸¸ÀàµÄ¸¸ÀàÀà±ð
 */
public List<Type> getgraparentsname(){
	return (List<Type>) BaseDao.select("select DISTINCT GRAPARENTSNAME,GRAPARENTSID from goodstype ", Type.class);
}
}
