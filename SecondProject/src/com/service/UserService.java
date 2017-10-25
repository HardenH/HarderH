package com.service;

import com.entity.Users;

import java.util.List;

import com.Dao.UserDao;

public class UserService {
	UserDao ud = new UserDao();
	public boolean isMatchee(String USERNAME) {
		return ud.isMatchee(USERNAME);
	}
	public boolean isphone(String USERPHONE) {
		return ud.isphone(USERPHONE);
	}
	public boolean addUser(Users user) {
		return ud.addUser(user);
	}
	public List<Users> loginVerify() {
		return ud.loginVerify();
	}
}
