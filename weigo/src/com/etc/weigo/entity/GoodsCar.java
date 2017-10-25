package com.etc.weigo.entity;

public class GoodsCar {
	
	private int GOODSCARID;
	private int GOODSID;
	private int GOODSCOUT;
	private int USERID;
	public int getGOODSCARID() {
		return GOODSCARID;
	}
	public void setGOODSCARID(int gOODSCARID) {
		GOODSCARID = gOODSCARID;
	}
	public int getGOODSID() {
		return GOODSID;
	}
	public void setGOODSID(int gOODSID) {
		GOODSID = gOODSID;
	}
	public int getGOODSCOUT() {
		return GOODSCOUT;
	}
	public void setGOODSCOUT(int gOODSCOUT) {
		GOODSCOUT = gOODSCOUT;
	}
	public int getUSERID() {
		return USERID;
	}
	public void setUSERID(int uSERID) {
		USERID = uSERID;
	}
	public GoodsCar(int gOODSCARID, int gOODSID, int gOODSCOUT, int uSERID) {
		super();
		GOODSCARID = gOODSCARID;
		GOODSID = gOODSID;
		GOODSCOUT = gOODSCOUT;
		USERID = uSERID;
	}
	@Override
	public String toString() {
		return "GoodsCar [GOODSCARID=" + GOODSCARID + ", GOODSID=" + GOODSID + ", GOODSCOUT=" + GOODSCOUT + ", USERID="
				+ USERID + "]";
	}
	
	public GoodsCar() {
		// TODO Auto-generated constructor stub
	}



}
