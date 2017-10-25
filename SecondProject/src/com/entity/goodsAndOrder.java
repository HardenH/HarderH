package com.entity;

public class goodsAndOrder {
private String GOODSIMG;
private String GOODSNAME;
private double GOODSPRICE;
private String ORDERNUM;
private int GOODSID;
private double ORDERTOTALPRICE;
private int	ORDERSTATE;
private String ORDERDATE;
private int	COUNT;
private String ORDERREMARK;
private int USERID;
private int STOREID;
private int ISVISIBLE;
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
public String getORDERNUM() {
	return ORDERNUM;
}
public void setORDERNUM(String oRDERNUM) {
	ORDERNUM = oRDERNUM;
}
public int getGOODSID() {
	return GOODSID;
}
public void setGOODSID(int gOODSID) {
	GOODSID = gOODSID;
}
public double getORDERTOTALPRICE() {
	return ORDERTOTALPRICE;
}
public void setORDERTOTALPRICE(double oRDERTOTALPRICE) {
	ORDERTOTALPRICE = oRDERTOTALPRICE;
}
public int getORDERSTATE() {
	return ORDERSTATE;
}
public void setORDERSTATE(int oRDERSTATE) {
	ORDERSTATE = oRDERSTATE;
}
public String getORDERDATE() {
	return ORDERDATE;
}
public void setORDERDATE(String oRDERDATE) {
	ORDERDATE = oRDERDATE;
}
public int getCOUNT() {
	return COUNT;
}
public void setCOUNT(int cOUNT) {
	COUNT = cOUNT;
}
public String getORDERREMARK() {
	return ORDERREMARK;
}
public void setORDERREMARK(String oRDERREMARK) {
	ORDERREMARK = oRDERREMARK;
}
public int getUSERID() {
	return USERID;
}
public void setUSERID(int uSERID) {
	USERID = uSERID;
}
public int getSTOREID() {
	return STOREID;
}
public void setSTOREID(int sTOREID) {
	STOREID = sTOREID;
}
public int getISVISIBLE() {
	return ISVISIBLE;
}
public void setISVISIBLE(int iSVISIBLE) {
	ISVISIBLE = iSVISIBLE;
}
public goodsAndOrder(String gOODSIMG, String gOODSNAME, double gOODSPRICE, String oRDERNUM, int gOODSID,
		double oRDERTOTALPRICE, int oRDERSTATE, String oRDERDATE, int cOUNT, String oRDERREMARK, int uSERID,
		int sTOREID, int iSVISIBLE) {
	super();
	GOODSIMG = gOODSIMG;
	GOODSNAME = gOODSNAME;
	GOODSPRICE = gOODSPRICE;
	ORDERNUM = oRDERNUM;
	GOODSID = gOODSID;
	ORDERTOTALPRICE = oRDERTOTALPRICE;
	ORDERSTATE = oRDERSTATE;
	ORDERDATE = oRDERDATE;
	COUNT = cOUNT;
	ORDERREMARK = oRDERREMARK;
	USERID = uSERID;
	STOREID = sTOREID;
	ISVISIBLE = iSVISIBLE;
}
public goodsAndOrder() {
	super();
}
@Override
public String toString() {
	return "goodsAndOrder [GOODSIMG=" + GOODSIMG + ", GOODSNAME=" + GOODSNAME + ", GOODSPRICE=" + GOODSPRICE
			+ ", ORDERNUM=" + ORDERNUM + ", GOODSID=" + GOODSID + ", ORDERTOTALPRICE=" + ORDERTOTALPRICE
			+ ", ORDERSTATE=" + ORDERSTATE + ", ORDERDATE=" + ORDERDATE + ", COUNT=" + COUNT + ", ORDERREMARK="
			+ ORDERREMARK + ", USERID=" + USERID + ", STOREID=" + STOREID + ", ISVISIBLE=" + ISVISIBLE + "]";
}


}

