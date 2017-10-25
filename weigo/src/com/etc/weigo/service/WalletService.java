package com.etc.weigo.service;

import java.util.List;

import com.etc.weigo.dao.WalletDao;
import com.etc.weigo.entity.Wallet;

public class WalletService {
WalletDao wd= new WalletDao();
public List<Wallet> queryBalanceById(int userid){
	return wd.queryBalanceById(userid);
	
}
	public boolean updrecharge(double recharge,int userid) {
		return wd.updrecharge(recharge, userid);
	}
	public boolean updwithdrawals(double withdrawals,int userid){
		return wd.updwithdrawals(withdrawals, userid);
	}
	
	
}
