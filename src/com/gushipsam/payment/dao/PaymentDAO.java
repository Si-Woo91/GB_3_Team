package com.gushipsam.payment.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gushipsam.payment.mybatis.SqlMapConfig;

public class PaymentDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public PaymentDAO() {
		// autocommit
		sqlsession = factory.openSession(true);
	}
	
	public List<CartDTO> getCartList(String userid){
		
		List<CartDTO> cartList = sqlsession.selectList("Payment.getCartList",userid);
		
		return cartList;
	}

	public List<CartDTO> getCheckoutList(String userid, String[] cIDs){
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("cIDs", cIDs);
		
		List<CartDTO> checkoutList = sqlsession.selectList("Payment.getCheckoutList",datas);
		
		return checkoutList;
	}
	
	public MemberDTO getMemberInfo(String userid){
		
		MemberDTO memberInfo = sqlsession.selectOne("Payment.getMemberInfo",userid);
		
		return memberInfo;
	}

	public boolean deleteCartItem(String userid, int del_cID){
		boolean result = false;
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("del_cID", del_cID);
		
		if(sqlsession.delete("Payment.deleteCartItem",datas) != 0) {
			result = true;
		}
			return result;
	}
	
	
	public CartDTO getCartItem(String cID){
		
		CartDTO cartItem = sqlsession.selectOne("Payment.getCartItem",cID);
		
		return cartItem;
	}
	
	public boolean insertOrder(OrderDTO odto) {
		boolean result = false;
		
		if(sqlsession.insert("Payment.insertOrder", odto) == 1) {
			result = true;
		}
		
		return result;
	}
	
	public boolean deleteCartItemAll(String userid, String[] cIDs){
		boolean result = false;
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("cIDs", cIDs);
		
		if(sqlsession.delete("Payment.deleteCartItemAll",datas) != 0) {
			result = true;
		}
			return result;
	}
	
	
	
	
}



















