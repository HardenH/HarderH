package com.etc.weigo.entity;

import java.io.Serializable;

public class Address implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1835944698721759343L;
	private int ADDRESSID;
	private int USERID;
	private String ADDRESS;
	private String RECEIVER;
	private String RECEIVERPHONE;
	private int ADDRSTATE;
	public int getADDRESSID() {
		return ADDRESSID;
	}
	public void setADDRESSID(int aDDRESSID) {
		ADDRESSID = aDDRESSID;
	}
	public int getUSERID() {
		return USERID;
	}
	public void setUSERID(int uSERID) {
		USERID = uSERID;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getRECEIVER() {
		return RECEIVER;
	}
	public void setRECEIVER(String rECEIVER) {
		RECEIVER = rECEIVER;
	}
	public String getRECEIVERPHONE() {
		return RECEIVERPHONE;
	}
	public void setRECEIVERPHONE(String rECEIVERPHONE) {
		RECEIVERPHONE = rECEIVERPHONE;
	}
	public int getADDRSTATE() {
		return ADDRSTATE;
	}
	public void setADDRSTATE(int aDDRSTATE) {
		ADDRSTATE = aDDRSTATE;
	}
	
	public Address() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 
	 * @param aDDRESSID 地址id
	 * @param uSERID 用户id
	 * @param aDDRESS 地址详情
	 * @param rECEIVER 收货人
	 * @param rECEIVERPHONE 收货人电话
	 * @param aDDRSTATE 是否为默认地址
	 */
	public Address(int aDDRESSID, int uSERID, String aDDRESS, String rECEIVER, String rECEIVERPHONE, int aDDRSTATE) {
		super();
		ADDRESSID = aDDRESSID;
		USERID = uSERID;
		ADDRESS = aDDRESS; 
		RECEIVER = rECEIVER;
		RECEIVERPHONE = rECEIVERPHONE;
		ADDRSTATE = aDDRSTATE;
	}
	
	  public Address(int aDDRESSID, int uSERID, String aDDRESS, String rECEIVER, String rECEIVERPHONE) {
			super();
			ADDRESSID = aDDRESSID;
			USERID = uSERID;
			ADDRESS = aDDRESS;
			RECEIVER = rECEIVER;
			RECEIVERPHONE = rECEIVERPHONE;
			
		}
	
	public Address(int uSERID, String aDDRESS, String rECEIVER, String rECEIVERPHONE, int aDDRSTATE) {
		super();
		USERID = uSERID;
		ADDRESS = aDDRESS;
		RECEIVER = rECEIVER;
		RECEIVERPHONE = rECEIVERPHONE;
		ADDRSTATE = aDDRSTATE;
	}
	@Override
	public String toString() {
		return "Address [ADDRESSID=" + ADDRESSID + ", USERID=" + USERID + ", ADDRESS=" + ADDRESS + ", RECEIVER="
				+ RECEIVER + ", RECEIVERPHONE=" + RECEIVERPHONE + ", ADDRSTATE=" + ADDRSTATE + "]";
	}
	
}
