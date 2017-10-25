package com.etc.weigo.entity;

public class Goods {
private int GOODSID;
private int STOREID;
private String GOODSNAME;
private String GOODSIMG;
private String GOODSDEIMG;
private int GOODSCOUNT;
private double GOODSPRICE;
private int GOODSTYPE;
private int GOODSSALECOUNT;
private String GOODSREMARK;
private int GOODSSTATE;
private int GOODSVISIBLE;
public int getGOODSID() {
	return GOODSID;
}
public void setGOODSID(int gOODSID) {
	GOODSID = gOODSID;
}
public int getSTOREID() {
	return STOREID;
}
public void setSTOREID(int sTOREID) {
	STOREID = sTOREID;
}
public String getGOODSNAME() {
	return GOODSNAME;
}
public void setGOODSNAME(String gOODSNAME) {
	GOODSNAME = gOODSNAME;
}
public String getGOODSIMG() {
	return GOODSIMG;
}
public void setGOODSIMG(String gOODSIMG) {
	GOODSIMG = gOODSIMG;
}
public String getGOODSDEIMG() {
	return GOODSDEIMG;
}
public void setGOODSDEIMG(String gOODSDEIMG) {
	GOODSDEIMG = gOODSDEIMG;
}
public int getGOODSCOUNT() {
	return GOODSCOUNT;
}
public void setGOODSCOUNT(int gOODSCOUNT) {
	GOODSCOUNT = gOODSCOUNT;
}
public double getGOODSPRICE() {
	return GOODSPRICE;
}
public void setGOODSPRICE(double gOODSPRICE) {
	GOODSPRICE = gOODSPRICE;
}
public int getGOODSTYPE() {
	return GOODSTYPE;
}
public void setGOODSTYPE(int gOODSTYPE) {
	GOODSTYPE = gOODSTYPE;
}
public int getGOODSSALECOUNT() {
	return GOODSSALECOUNT;
}
public void setGOODSSALECOUNT(int gOODSSALECOUNT) {
	GOODSSALECOUNT = gOODSSALECOUNT;
}
public String getGOODSREMARK() {
	return GOODSREMARK;
}
public void setGOODSREMARK(String gOODSREMARK) {
	GOODSREMARK = gOODSREMARK;
}
public int getGOODSSTATE() {
	return GOODSSTATE;
}
public void setGOODSSTATE(int gOODSSTATE) {
	GOODSSTATE = gOODSSTATE;
}
public int getGOODSVISIBLE() {
	return GOODSVISIBLE;
}
public void setGOODSVISIBLE(int gOODSVISIBLE) {
	GOODSVISIBLE = gOODSVISIBLE;
}
public Goods(int gOODSID, int sTOREID, String gOODSNAME, String gOODSIMG, String gOODSDEIMG, int gOODSCOUNT,
		double gOODSPRICE, int gOODSTYPE, int gOODSSALECOUNT, String gOODSREMARK, int gOODSSTATE, int gOODSVISIBLE) {
	super();
	GOODSID = gOODSID;
	STOREID = sTOREID;
	GOODSNAME = gOODSNAME;
	GOODSIMG = gOODSIMG;
	GOODSDEIMG = gOODSDEIMG;
	GOODSCOUNT = gOODSCOUNT;
	GOODSPRICE = gOODSPRICE;
	GOODSTYPE = gOODSTYPE;
	GOODSSALECOUNT = gOODSSALECOUNT;
	GOODSREMARK = gOODSREMARK;
	GOODSSTATE = gOODSSTATE;
	GOODSVISIBLE = gOODSVISIBLE;
}
public Goods() {
	super();
}
@Override
public String toString() {
	return "Goods [GOODSID=" + GOODSID + ", STOREID=" + STOREID + ", GOODSNAME=" + GOODSNAME + ", GOODSIMG=" + GOODSIMG
			+ ", GOODSDEIMG=" + GOODSDEIMG + ", GOODSCOUNT=" + GOODSCOUNT + ", GOODSPRICE=" + GOODSPRICE
			+ ", GOODSTYPE=" + GOODSTYPE + ", GOODSSALECOUNT=" + GOODSSALECOUNT + ", GOODSREMARK=" + GOODSREMARK
			+ ", GOODSSTATE=" + GOODSSTATE + ", GOODSVISIBLE=" + GOODSVISIBLE + "]";
}

}
