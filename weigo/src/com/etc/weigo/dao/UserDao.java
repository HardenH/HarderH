package com.etc.weigo.dao;

import java.util.List;

import com.etc.weigo.entity.Users;
import com.etc.weigo.util.BaseDao;


public class UserDao {
	
	public boolean addUser(Users users) {
		return BaseDao.execute("insert into users values(null,?,?,?,0,null,null)", users.getUSERNAME(),
				users.getUSERPWD(),users.getUSERPHONE())>0;
	}

	public boolean isMatchee(String USERNAME) {
		Object returnvalue = BaseDao.getFirst("select count(1) from users where USERNAME = ?", USERNAME);
		String numstr = String.valueOf(returnvalue);
		int num = Integer.parseInt(numstr);
		return num>0;
	}

	public String searchPhoneByName(String USERNAME) {
		 return  (String) BaseDao.select("select userphone from users where username=?", Users.class, USERNAME);
	}

		public boolean isphone(String USERPHONE) {
			Object returnvalue = BaseDao.getFirst("select count(1) from users where USERPHONE = ?", USERPHONE);
			String numstr = String.valueOf(returnvalue);
			int num = Integer.parseInt(numstr);
			return num>0;
		}
	
	public List<Users> loginVerify() {
		return (List<Users>)BaseDao.select("select * from users", Users.class, null);
	}

	public boolean updateUser(String PERSONNAME,String CARDID ,String USERPHONE){
		Object returnvalue =BaseDao.execute("update users set PERSONNAME=?,CARDID=? where USERPHONE=?",PERSONNAME,CARDID,USERPHONE);
		String numstr = String.valueOf(returnvalue);
		int num = Integer.parseInt(numstr);
		return num>0;
	}

	public int searchUserstateByUserid(int USERID){
		return BaseDao.execute("select userstate from users where userid=?", USERID);
	}
	}
	

