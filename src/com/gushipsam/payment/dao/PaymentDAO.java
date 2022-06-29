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
		System.out.println("getCartList 도착");
		
		List<CartDTO> cartList = sqlsession.selectList("Payment.getCartList",userid);
		
		System.out.println("CartList 조회");
		
		return cartList;
	}

	public List<CartDTO> getCheckoutList(String userid, String[] cIDs){
		System.out.println("getCheckoutList 도착");
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("cIDs", cIDs);
		
		List<CartDTO> checkoutList = sqlsession.selectList("Payment.getCheckoutList",datas);
		
		System.out.println("checkoutList 조회");
		
		return checkoutList;
	}
	
	public MemberDTO getMemberInfo(String userid){
		System.out.println("getMemberInfo 도착");
		
		MemberDTO memberInfo = sqlsession.selectOne("Payment.getMemberInfo",userid);
		
		System.out.println("memberInfo 조회");
		
		return memberInfo;
	}

	public boolean deleteCartItem(String userid, String[] del_cIDs){
		System.out.println("deleteCartItem 도착");
		boolean result = false;
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("del_cIDs", del_cIDs);
		
		if(sqlsession.delete("Payment.deleteCartItem",datas) != 0) {
			result = true;
		}
			return result;
	}
	
	
	public CartDTO getCartItem(String cID){
		System.out.println("getCartItem 도착");
		
		CartDTO cartItem = sqlsession.selectOne("Payment.getCartItem",cID);
		System.out.println("CartItem 조회");
		
		return cartItem;
	}
	
	public boolean insertOrder(OrderDTO odto) {
		System.out.println("insertOrder 도착");
		boolean result = false;
		
		if(sqlsession.insert("Payment.insertOrder", odto) == 1) {
			result = true;
		}
		
		return result;
	}
	
	public boolean deleteCartItemAll(String userid, String[] cIDs){
		System.out.println("deleteCartItemAll 도착");
		boolean result = false;
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("cIDs", cIDs);
		
		if(sqlsession.delete("Payment.deleteCartItemAll",datas) != 0) {
			result = true;
		}
			return result;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////
	
	public CartDTO getCheckoutDirect(int gID, int gQTY){
		System.out.println("directCheckout 도착");
		
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("gID", gID);
		datas.put("gQTY", gQTY);
		
		CartDTO checkoutItem = sqlsession.selectOne("Payment.getCheckoutDirect",datas);
		
		System.out.println("checkoutItem 받음 완료");
		
		return checkoutItem;
	}
	
	public boolean insertCart(String userid, int gID, int gQTY) {
		System.out.println("insertCart 도착");
		boolean result = false;
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("gID", gID);
		datas.put("gQTY", gQTY);
		
		if(sqlsession.insert("Payment.insertCart", datas) == 1) {
			result = true;
		}
		
		return result;
	}
	
}



















