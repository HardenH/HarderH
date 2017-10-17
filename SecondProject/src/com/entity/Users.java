package com.entity;

import java.io.Serializable;

public class Users implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 146000344600262296L;
	private int USERID;
	private String USERNAME;
	private String USERPWD;
	private String USERPHONE;
	private int USERSTATE;
	private String PERSONNAME;
	private String CARDID;
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
	public int getUSERSTATE() {
		return USERSTATE;
	}
	public void setUSERSTATE(int uSERSTATE) {
		USERSTATE = uSERSTATE;
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
	
	public Users() {
		// TODO Auto-generated constructor stub
	}
	
	public Users(String uSERNAME, String uSERPWD, String uSERPHONE) {
		super();
		USERNAME = uSERNAME;
		USERPWD = uSERPWD;
		USERPHONE = uSERPHONE;
	}
	public Users(int uSERID, String uSERNAME, String uSERPWD, String uSERPHONE, int uSERSTATE, String pERSONNAME,
			String cARDID) {
		super();
		USERID = uSERID;
		USERNAME = uSERNAME;
		USERPWD = uSERPWD;
		USERPHONE = uSERPHONE;
		USERSTATE = uSERSTATE;
		PERSONNAME = pERSONNAME;
		CARDID = cARDID;
	}
	
	@Override
	public String toString() {
		return "Users [USERID=" + USERID + ", USERNAME=" + USERNAME + ", USERPWD=" + USERPWD + ", USERPHONE="
				+ USERPHONE + ", USERSTATE=" + USERSTATE + ", PERSONNAME=" + PERSONNAME + ", CARDID=" + CARDID + "]";
	}
	
}
