package com.etc.weigo.entity;

public class Wallet {
	 int PURSEID;
	 int USERID;
	 double INCOMES;
	 double PAYOUT;
	 double BALANCE;
	 double FREEZE;
	 double RECHARGE;
	 double WITHDRAWALS;
	public int getPURSEID() {
		return PURSEID;
	}
	public void setPURSEID(int pURSEID) {
		PURSEID = pURSEID;
	}
	public int getUSERID() {
		return USERID;
	}
	public void setUSERID(int uSERID) {
		USERID = uSERID;
	}
	public double getINCOMES() {
		return INCOMES;
	}
	public void setINCOMES(double iNCOMES) {
		INCOMES = iNCOMES;
	}
	public double getPAYOUT() {
		return PAYOUT;
	}
	public void setPAYOUT(double pAYOUT) {
		PAYOUT = pAYOUT;
	}
	public double getBALANCE() {
		return BALANCE;
	}
	public void setBALANCE(double bALANCE) {
		BALANCE = bALANCE;
	}
	public double getFREEZE() {
		return FREEZE;
	}
	public void setFREEZE(double fREEZE) {
		FREEZE = fREEZE;
	}
	public double getRECHARGE() {
		return RECHARGE;
	}
	public void setRECHARGE(double rECHARGE) {
		RECHARGE = rECHARGE;
	}
	public double getWITHDRAWALS() {
		return WITHDRAWALS;
	}
	public void setWITHDRAWALS(double wITHDRAWALS) {
		WITHDRAWALS = wITHDRAWALS;
	}
	@Override
	public String toString() {
		return "Wallet [PURSEID=" + PURSEID + ", USERID=" + USERID + ", INCOMES=" + INCOMES + ", PAYOUT=" + PAYOUT
				+ ", BALANCE=" + BALANCE + ", FREEZE=" + FREEZE + ", RECHARGE=" + RECHARGE + ", WITHDRAWALS="
				+ WITHDRAWALS + "]";
	}
	public Wallet(int pURSEID, int uSERID, double iNCOMES, double pAYOUT, double bALANCE, double fREEZE,
			double rECHARGE, double wITHDRAWALS) {
		super();
		PURSEID = pURSEID;
		USERID = uSERID;
		INCOMES = iNCOMES;
		PAYOUT = pAYOUT;
		BALANCE = bALANCE;
		FREEZE = fREEZE;
		RECHARGE = rECHARGE;
		WITHDRAWALS = wITHDRAWALS;
	}
	
	
	 
	 public Wallet(int uSERID, double rECHARGE) {
		super();
		USERID = uSERID;
		RECHARGE = rECHARGE;
	}
	public Wallet() {
		// TODO Auto-generated constructor stub
	}
	

}
