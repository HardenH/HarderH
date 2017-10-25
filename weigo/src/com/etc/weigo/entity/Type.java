package com.etc.weigo.entity;

public class Type {
private int TYPEID;
private int PARENTSID;
private String TYPENAME;
private int CHILDID;
private int GRAPARENTSID;
private String PARENTSNAME;
private String GRAPARENTSNAME;
public int getTYPEID() {
	return TYPEID;
}
public void setTYPEID(int tYPEID) {
	TYPEID = tYPEID;
}
public int getPARENTSID() {
	return PARENTSID;
}
public void setPARENTSID(int pARENTSID) {
	PARENTSID = pARENTSID;
}
public String getTYPENAME() {
	return TYPENAME;
}
public void setTYPENAME(String tYPENAME) {
	TYPENAME = tYPENAME;
}
public int getCHILDID() {
	return CHILDID;
}
public void setCHILDID(int cHILDID) {
	CHILDID = cHILDID;
}
public int getGRAPARENTSID() {
	return GRAPARENTSID;
}
public void setGRAPARENTSID(int gRAPARENTSID) {
	GRAPARENTSID = gRAPARENTSID;
}
public String getPARENTSNAME() {
	return PARENTSNAME;
}
public void setPARENTSNAME(String pARENTSNAME) {
	PARENTSNAME = pARENTSNAME;
}
public String getGRAPARENTSNAME() {
	return GRAPARENTSNAME;
}
public void setGRAPARENTSNAME(String gRAPARENTSNAME) {
	GRAPARENTSNAME = gRAPARENTSNAME;
}
public Type(int tYPEID, int pARENTSID, String tYPENAME, int cHILDID, int gRAPARENTSID, String pARENTSNAME,
		String gRAPARENTSNAME) {
	super();
	TYPEID = tYPEID;
	PARENTSID = pARENTSID;
	TYPENAME = tYPENAME;
	CHILDID = cHILDID;
	GRAPARENTSID = gRAPARENTSID;
	PARENTSNAME = pARENTSNAME;
	GRAPARENTSNAME = gRAPARENTSNAME;
}
public Type() {
	super();
}
@Override
public String toString() {
	return "Type [TYPEID=" + TYPEID + ", PARENTSID=" + PARENTSID + ", TYPENAME=" + TYPENAME + ", CHILDID=" + CHILDID
			+ ", GRAPARENTSID=" + GRAPARENTSID + ", PARENTSNAME=" + PARENTSNAME + ", GRAPARENTSNAME=" + GRAPARENTSNAME
			+ "]";
}


}
