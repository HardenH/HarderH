package com.entity;

public class VIEW_GOODSCAR {
	private int GOODSID;
	private String GOODSIMG;
	private String GOODSNAME;
	private double GOODSPRICE;
	private int USERID;
	private int GOODSCOUT;
	private int STOREID;
	private int GOODSSTATE;
	public int getGOODSID() {
		return GOODSID;
	}
	public void setGOODSID(int gOODSID) {
		GOODSID = gOODSID;
	}
	public String getGOODSIMG() {
		return GOODSIMG;
	}
	public void setGOODSIMG(String gOODSIMG) {
		GOODSIMG = gOODSIMG;
	}
	public String getGOODSNAME() {
		return GOODSNAME;
	}
	public void setGOODSNAME(String gOODSNAME) {
		GOODSNAME = gOODSNAME;
	}
	public double getGOODSPRICE() {
		return GOODSPRICE;
	}
	public void setGOODSPRICE(double gOODSPRICE) {
		GOODSPRICE = gOODSPRICE;
	}
	public int getUSERID() {
		return USERID;
	}
	public void setUSERID(int uSERID) {
		USERID = uSERID;
	}
	public int getGOODSCOUT() {
		return GOODSCOUT;
	}
	public void setGOODSCOUT(int gOODSCOUT) {
		GOODSCOUT = gOODSCOUT;
	}
	public int getSTOREID() {
		return STOREID;
	}
	public void setSTOREID(int sTOREID) {
		STOREID = sTOREID;
	}
	public int getGOODSSTATE() {
		return GOODSSTATE;
	}
	public void setGOODSSTATE(int gOODSSTATE) {
		GOODSSTATE = gOODSSTATE;
	}
	@Override
	public String toString() {
		return "VIEW_GOODSCAR [GOODSID=" + GOODSID + ", GOODSIMG=" + GOODSIMG + ", GOODSNAME=" + GOODSNAME
				+ ", GOODSPRICE=" + GOODSPRICE + ", USERID=" + USERID + ", GOODSCOUT=" + GOODSCOUT + ", STOREID="
				+ STOREID + ", GOODSSTATE=" + GOODSSTATE + "]";
	}
	public VIEW_GOODSCAR(int gOODSID, String gOODSIMG, String gOODSNAME, double gOODSPRICE, int uSERID, int gOODSCOUT,
			int sTOREID, int gOODSSTATE) {
		super();
		GOODSID = gOODSID;
		GOODSIMG = gOODSIMG;
		GOODSNAME = gOODSNAME;
		GOODSPRICE = gOODSPRICE;
		USERID = uSERID;
		GOODSCOUT = gOODSCOUT;
		STOREID = sTOREID;
		GOODSSTATE = gOODSSTATE;
	}
	
	public VIEW_GOODSCAR() {
		// TODO Auto-generated constructor stub
	}

}
