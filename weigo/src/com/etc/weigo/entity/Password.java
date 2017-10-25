package com.etc.weigo.entity;

public class Password {
	int USERID;
	String USERNAME;
	String USERPWD;
	String USERPHONE;
	int USERSTSTE;
	String PERSONNAME;
	String CARDID;
	public int getUSERID() {
		return USERID;
	}
	public void setUSERID(int uSERID) {
		USERID = uSERID;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getUSERPWD() {
		return USERPWD;
	}
	public void setUSERPWD(String uSERPWD) {
		USERPWD = uSERPWD;
	}
	public String getUSERPHONE() {
		return USERPHONE;
	}
	public void setUSERPHONE(String uSERPHONE) {
		USERPHONE = uSERPHONE;
	}
	public int getUSERSTSTE() {
		return USERSTSTE;
	}
	public void setUSERSTSTE(int uSERSTSTE) {
		USERSTSTE = uSERSTSTE;
	}
	public String getPERSONNAME() {
		return PERSONNAME;
	}
	public void setPERSONNAME(String pERSONNAME) {
		PERSONNAME = pERSONNAME;
	}
	public String getCARDID() {
		return CARDID;
	}
	public void setCARDID(String cARDID) {
		CARDID = cARDID;
	}
	@Override
	public String toString() {
		return "Password [USERID=" + USERID + ", USERNAME=" + USERNAME + ", USERPWD=" + USERPWD + ", USERPHONE="
				+ USERPHONE + ", USERSTSTE=" + USERSTSTE + ", PERSONNAME=" + PERSONNAME + ", CARDID=" + CARDID + "]";
	}
	public Password(int uSERID, String uSERNAME, String uSERPWD, String uSERPHONE, int uSERSTSTE, String pERSONNAME,
			String cARDID) {
		super();
		USERID = uSERID;
		USERNAME = uSERNAME;
		USERPWD = uSERPWD;
		USERPHONE = uSERPHONE;
		USERSTSTE = uSERSTSTE;
		PERSONNAME = pERSONNAME;
		CARDID = cARDID;
	}
	public Password() {
		// TODO Auto-generated constructor stub
	}
	public Password(int uSERID, String uSERPWD) {
		super();
		USERID = uSERID;
		USERPWD = uSERPWD;
	}
	

}
