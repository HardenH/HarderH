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
	//���û����и�����ʵ���������֤��
		public boolean updateUser(String PERSONNAME ,String CARDID, String USERPHONE) {
			return ud.updateUser(PERSONNAME, CARDID, USERPHONE);
		}
		//�����û�id��ѯ�û�״̬������ѿ����Ϊ�ҵĵ��̣�
		public int searchUserstateByUserid(int USERID){
			return ud.searchUserstateByUserid(USERID);
		}
		//�Ƿ����û��绰����
		public boolean isphone(String USERPHONE) {
			return ud.isphone(USERPHONE);
		}
}
