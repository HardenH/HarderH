package com.etc.weigo.dao;

import java.util.List;

import com.etc.weigo.entity.Address;
import com.etc.weigo.util.BaseDao;



public class AddressDao {
	public List<Address> getAddressByUserId(int userId){
		//System.out.println("userId:"+userId);
		return (List<Address>)BaseDao.select("select * from address where userId=?", Address.class, userId);
	
	}
	
	public List<Address> getinfo( int userid){
//		String sql="select * from ADDRESS where addressid=(\r\n" + 
//				"select max(addressid) from ADDRESS\r\n" + 
//				")";
		String sql="select * from address where userid=?";
		
		return (List<Address>) BaseDao.select(sql, Address.class, userid);
		
	}
	//添加地址
	public boolean addAddress(Address address){
		System.out.println("这address:"+address);
		return BaseDao.execute("insert into ADDRESS(userId, address, receiverphone, receiver,addrstate) values(?,?,?,?,?)", address.getUSERID(),address.getADDRESS(),address.getRECEIVERPHONE(),address.getRECEIVER(),address.getADDRSTATE() )>0;
				
	}
	public boolean deladdressbyaddressid(int addressid) {
    	String sql="delete from address where addressid=?";
    	return BaseDao.execute(sql, addressid)>0;
    }
	//删除地址
	public  boolean deleteAddress(int addressId){
		return BaseDao.execute("delete from ADDRESS where addressId = ?", addressId)>0;
		
	}
	
	 public boolean updaddress(Address updaddress) {
	    	String sql= "update address set userid=?, address=?,receiver=?,receiverphone=? where addressid=?";
	    	return BaseDao.execute(sql, updaddress.getUSERID(),updaddress.getADDRESS(),updaddress.getRECEIVER(),updaddress.getRECEIVERPHONE(),updaddress.getADDRESSID())>0;
	    }
	 public boolean updaddresstate(int userid,int addressid) {
	    	String sql="update address set addrstate=? where userid=?";
	    	 BaseDao.execute(sql, userid,userid);
	    	String sql1="update address set addrstate=? where addressid=?";
	    	return BaseDao.execute(sql1, 0,addressid)>0;
	    
	    }
	
}
