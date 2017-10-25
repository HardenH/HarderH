package com.etc.weigo.entity;

public class Comments {
private int COMID;
private int GOODSID;
private String USERNAME;
private String CONTENT;
private int STARS;
private String 	COMTIME;
public int getCOMID() {
	return COMID;
}
public void setCOMID(int cOMID) {
	COMID = cOMID;
}
public int getGOODSID() {
	return GOODSID;
}
public void setGOODSID(int gOODSID) {
	GOODSID = gOODSID;
}
public String getUSERNAME() {
	return USERNAME;
}
public void setUSERNAME(String uSERNAME) {
	USERNAME = uSERNAME;
}
public String getCONTENT() {
	return CONTENT;
}
public void setCONTENT(String cONTENT) {
	CONTENT = cONTENT;
}
public int getSTARS() {
	return STARS;
}
public void setSTARS(int sTARS) {
	STARS = sTARS;
}
public String getCOMTIME() {
	return COMTIME;
}
public void setCOMTIME(String cOMTIME) {
	COMTIME = cOMTIME;
}
public Comments(int cOMID, int gOODSID, String uSERNAME, String cONTENT, int sTARS, String cOMTIME) {
	super();
	COMID = cOMID;
	GOODSID = gOODSID;
	USERNAME = uSERNAME;
	CONTENT = cONTENT;
	STARS = sTARS;
	COMTIME = cOMTIME;
}
public Comments() {
	super();
}
@Override
public String toString() {
	return "Comments [COMID=" + COMID + ", GOODSID=" + GOODSID + ", USERNAME=" + USERNAME + ", CONTENT=" + CONTENT
			+ ", STARS=" + STARS + ", COMTIME=" + COMTIME + "]";
}



}
