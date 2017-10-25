package com.etc.weigo.dao;

import java.util.List;

import com.etc.weigo.entity.Type;
import com.etc.weigo.util.BaseDao;

public class TypeDao {
	/**
	 * ��ҳ����Ĳ����������ʾ����
	 * @param GRAPARENTSID
	 * @return
	 */
public List<Type> gettype(int GRAPARENTSID){
	return (List<Type>) BaseDao.select("select  DISTINCT PARENTSNAME,PARENTSID from GOODSTYPE where  GRAPARENTSID=? AND CHILDID IS NOT NULL", Type.class, GRAPARENTSID);
}
/**
 * ��ҳ�����С�����ʾ
 * @param PARENTSID
 * @return
 */
public List<Type> gettypename(int PARENTSID){
	return (List<Type>) BaseDao.select("select typeid,typename,parentsid from goodstype where PARENTSID=? AND TYPENAME IS NOT NULL", Type.class, PARENTSID);
			}
/**
 * �õ�����ĸ������
 */
public List<Type> getgraparentsname(){
	return (List<Type>) BaseDao.select("select DISTINCT GRAPARENTSNAME,GRAPARENTSID from goodstype ", Type.class);
}
}
