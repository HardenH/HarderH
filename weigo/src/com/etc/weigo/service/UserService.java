package com.etc.weigo.service;

import java.util.List;

import com.etc.weigo.dao.UserDao;
import com.etc.weigo.entity.Users;

public class UserService {
	UserDao ud = new UserDao();
	
	public boolean isMatchee(String USERNAME) {
		return ud.isMatchee(USERNAME);
	}
	
	public boolean addUser(Users user) {
		return ud.addUser(user);
	}
	
	public List<Users> loginVerify() {
		return ud.loginVerify();
	}
	//向用户表中更新真实姓名、身份证号
		public boolean updateUser(String PERSONNAME ,String CARDID, String USERPHONE) {
			return ud.updateUser(PERSONNAME, CARDID, USERPHONE);
		}
		//根据用户id查询用户状态（将免费开店变为我的店铺）
		public int searchUserstateByUserid(int USERID){
			return ud.searchUserstateByUserid(USERID);
		}
		//是否是用户电话号码
		public boolean isphone(String USERPHONE) {
			return ud.isphone(USERPHONE);
		}
}
