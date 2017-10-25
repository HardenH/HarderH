package com.Dao;

import java.util.List;

import com.entity.Users;
import com.etc.util.BaseDao;


//插入记录
public class UserDao {
	
	public boolean addUser(Users users) {
		return BaseDao.execute("insert into users values(null,?,?,?,0,null,null)", users.getUSERNAME(),
				users.getUSERPWD(),users.getUSERPHONE())>0;
	}
//查询是否存在改用户名	
	public boolean isMatchee(String USERNAME) {
		Object returnvalue = BaseDao.getFirst("select count(1) from users where USERNAME = ?", USERNAME);
		String numstr = String.valueOf(returnvalue);
		int num = Integer.parseInt(numstr);
		return num>0;
	}
	//查询是否存在手机号
	public boolean isphone(String USERPHONE) {
		Object returnvalue = BaseDao.getFirst("select count(1) from users where USERPHONE = ?", USERPHONE);
		String numstr = String.valueOf(returnvalue);
		int num = Integer.parseInt(numstr);
		return num>0;
	}
	/**
	 * 验证账号和密码是否匹配
	 * @return
	 */
	public List<Users> loginVerify() {
		return (List<Users>)BaseDao.select("select * from users", Users.class, null);
	}
	
	
}
