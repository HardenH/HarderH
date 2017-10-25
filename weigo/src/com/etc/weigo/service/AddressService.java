package com.etc.weigo.service;

import java.util.List;

import com.etc.weigo.dao.AddressDao;
import com.etc.weigo.entity.Address;

public class AddressService {
	
	AddressDao ad = new AddressDao();
	
	//����id��ȡ��ַ
	public List<Address> getAddressByUserId(int userId){
		return ad.getAddressByUserId(userId);
	}
	public  List<Address> getinfo(int userid){
		return ad.getinfo(userid);
		
	}
	//��ӵ�ַ
	public boolean addAddress(Address address){
		return ad.addAddress(address);
		
		
	}
	public boolean updaddress(Address updaddress) {
		   return ad.updaddress(updaddress);
	   }
	//ɾ����ַ deleteAddress
	public boolean deleteAddress(int addressId){
		return ad.deleteAddress(addressId);
		
	}
	public boolean deladdressbyaddressid(int addressid) {
		   return ad.deladdressbyaddressid(addressid);
	   }
	public boolean updaddresstate(int userid,int addressid) {
		   return ad.updaddresstate(userid, addressid);
	   }
}
