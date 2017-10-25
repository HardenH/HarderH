package com.etc.weigo.entity;

import java.io.Serializable;

public class Orders implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8602448024759209144L;
	
	private int ORDERID;
	private String ORDERNUM; //订单编号
	private int GOODSID; 
	private double ORDERTOTALPRICE; //商品总价 每个订单号的总价
	private int ORDERSTATE; //订单状态 未付款
	private int COUNT; //每款商品购买的个数
	private int ISVISIBLE; //买家删除订单时，修改当前状态
	private String ORDERDATE; //下单时间
	private String CADDRESS; //收获地址
	private String CPHONE; //收货人电话
	private String CONSIGNEE; //收货人
	private int USERID;
	private int STOREID; //商品所属商家的id
	private String ORDERREMARK;//用户留言
	public int getORDERID() {
		return ORDERID;
	}
	public void setORDERID(int oRDERID) {
		ORDERID = oRDERID;
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
	public int getCOUNT() {
		return COUNT;
	}
	public void setCOUNT(int cOUNT) {
		COUNT = cOUNT;
	}
	public int getISVISIBLE() {
		return ISVISIBLE;
	}
	public void setISVISIBLE(int iSVISIBLE) {
		ISVISIBLE = iSVISIBLE;
	}
	public String getORDERDATE() {
		return ORDERDATE;
	}
	public void setORDERDATE(String oRDERDATE) {
		ORDERDATE = oRDERDATE;
	}
	public String getCADDRESS() {
		return CADDRESS;
	}
	public void setCADDRESS(String cADDRESS) {
		CADDRESS = cADDRESS;
	}
	public String getCPHONE() {
		return CPHONE;
	}
	public void setCPHONE(String cPHONE) {
		CPHONE = cPHONE;
	}
	public String getCONSIGNEE() {
		return CONSIGNEE;
	}
	public void setCONSIGNEE(String cONSIGNEE) {
		CONSIGNEE = cONSIGNEE;
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
	public String getORDERREMARK() {
		return ORDERREMARK;
	}
	public void setORDERREMARK(String oRDERREMARK) {
		ORDERREMARK = oRDERREMARK;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Orders(int oRDERID, String oRDERNUM, int gOODSID, double oRDERTOTALPRICE, int oRDERSTATE, int cOUNT,
			int iSVISIBLE, String oRDERDATE, String cADDRESS, String cPHONE, String cONSIGNEE, int uSERID, int sTOREID,
			String oRDERREMARK) {
		super();
		ORDERID = oRDERID;
		ORDERNUM = oRDERNUM;
		GOODSID = gOODSID;
		ORDERTOTALPRICE = oRDERTOTALPRICE;
		ORDERSTATE = oRDERSTATE;
		COUNT = cOUNT;
		ISVISIBLE = iSVISIBLE;
		ORDERDATE = oRDERDATE;
		CADDRESS = cADDRESS;
		CPHONE = cPHONE;
		CONSIGNEE = cONSIGNEE;
		USERID = uSERID;
		STOREID = sTOREID;
		ORDERREMARK = oRDERREMARK;
	}
	
	
	public Orders(String oRDERNUM, int gOODSID, double oRDERTOTALPRICE, int cOUNT, String cADDRESS, String cPHONE,
			String cONSIGNEE, int uSERID, int sTOREID, String oRDERREMARK) {
		super();
		ORDERNUM = oRDERNUM;
		GOODSID = gOODSID;
		ORDERTOTALPRICE = oRDERTOTALPRICE;
		COUNT = cOUNT;
		CADDRESS = cADDRESS;
		CPHONE = cPHONE;
		CONSIGNEE = cONSIGNEE;
		USERID = uSERID;
		STOREID = sTOREID;
		ORDERREMARK = oRDERREMARK;
	}
	@Override
	public String toString() {
		return "Orders [ORDERID=" + ORDERID + ", ORDERNUM=" + ORDERNUM + ", GOODSID=" + GOODSID + ", ORDERTOTALPRICE="
				+ ORDERTOTALPRICE + ", ORDERSTATE=" + ORDERSTATE + ", COUNT=" + COUNT + ", ISVISIBLE=" + ISVISIBLE
				+ ", ORDERDATE=" + ORDERDATE + ", CADDRESS=" + CADDRESS + ", CPHONE=" + CPHONE + ", CONSIGNEE="
				+ CONSIGNEE + ", USERID=" + USERID + ", STOREID=" + STOREID + ", ORDERREMARK=" + ORDERREMARK + "]";
	}
	
	public Orders() {
		// TODO Auto-generated constructor stub
	}
	
}
