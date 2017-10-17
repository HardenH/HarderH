package com.entity;

public class Store {
	private int STOREID;
private int USERID;
private String STORENAME;
private double STORESCORE;
private String STOREINTRO;
private String STOREPHONE;
private int STORECLICK;
private int STORESTATE;
public int getSTOREID() {
	return STOREID;
}
public void setSTOREID(int sTOREID) {
	STOREID = sTOREID;
}
public int getUSERID() {
	return USERID;
}
public void setUSERID(int uSERID) {
	USERID = uSERID;
}
public String getSTORENAME() {
	return STORENAME;
}
public void setSTORENAME(String sTORENAME) {
	STORENAME = sTORENAME;
}
public double getSTORESCORE() {
	return STORESCORE;
}
public void setSTORESCORE(double sTORESCORE) {
	STORESCORE = sTORESCORE;
}
public String getSTOREINTRO() {
	return STOREINTRO;
}
public void setSTOREINTRO(String sTOREINTRO) {
	STOREINTRO = sTOREINTRO;
}
public String getSTOREPHONE() {
	return STOREPHONE;
}
public void setSTOREPHONE(String sTOREPHONE) {
	STOREPHONE = sTOREPHONE;
}
public int getSTORECLICK() {
	return STORECLICK;
}
public void setSTORECLICK(int sTORECLICK) {
	STORECLICK = sTORECLICK;
}
public int getSTORESTATE() {
	return STORESTATE;
}
public void setSTORESTATE(int sTORESTATE) {
	STORESTATE = sTORESTATE;
}
public Store(int sTOREID, int uSERID, String sTORENAME, double sTORESCORE, String sTOREINTRO, String sTOREPHONE,
		int sTORECLICK, int sTORESTATE) {
	super();
	STOREID = sTOREID;
	USERID = uSERID;
	STORENAME = sTORENAME;
	STORESCORE = sTORESCORE;
	STOREINTRO = sTOREINTRO;
	STOREPHONE = sTOREPHONE;
	STORECLICK = sTORECLICK;
	STORESTATE = sTORESTATE;
}
public Store() {
	super();
}
@Override
public String toString() {
	return "Store [STOREID=" + STOREID + ", USERID=" + USERID + ", STORENAME=" + STORENAME + ", STORESCORE="
			+ STORESCORE + ", STOREINTRO=" + STOREINTRO + ", STOREPHONE=" + STOREPHONE + ", STORECLICK=" + STORECLICK
			+ ", STORESTATE=" + STORESTATE + "]";
}

}
