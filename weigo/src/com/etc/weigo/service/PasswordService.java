package com.etc.weigo.service;

import java.util.List;

import com.etc.weigo.dao.PasswordDao;
import com.etc.weigo.entity.Password;

public class PasswordService {
	PasswordDao pd= new PasswordDao();
	public boolean  updpwd(int userid,String newpwd) {
		return pd.updpwd(userid, newpwd);
		
	}
	public List<Password> queryPassword(int userid){
		return pd.queryPassword(userid);
	}

}
