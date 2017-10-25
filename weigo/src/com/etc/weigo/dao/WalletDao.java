package com.etc.weigo.dao;

import java.util.List;

import com.etc.weigo.entity.Wallet;
import com.etc.weigo.util.BaseDao;

public class WalletDao {
	public List<Wallet> queryBalanceById(int userid){
		String sql="select * from purse where userid=? ";
		return (List<Wallet>) BaseDao.select(sql, Wallet.class, userid);
		
	}
	public boolean updrecharge(double recharge,int userid) {
		String sql="update  purse set recharge=? where userid=?";
		return BaseDao.execute(sql, recharge,userid)>0;
	  }
	
	public boolean updwithdrawals(double withdrawals,int userid) {
		String sql="update  purse set withdrawals=? where userid=?";
		return BaseDao.execute(sql, withdrawals,userid)>0;
	  }
	

}
