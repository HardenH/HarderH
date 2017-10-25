package com.etc.weigo.dao;

import java.util.List;

import com.etc.weigo.entity.Password;
import com.etc.weigo.util.BaseDao;

public class PasswordDao {
	public boolean updpwd(int userid,String newpwd) {
		String sql= "update  users set  userpwd=? where userid=?";
		return BaseDao.execute(sql, newpwd,userid)>0;
		
	}
	public List<Password> queryPassword(int userid){
		String sql= "select * from users where userid=?";
		return (List<Password>) BaseDao.select(sql, Password.class, userid);
	}

}
