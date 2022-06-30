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
	
	//장바구니 조회에 필요한 정보를 가져오는 기능 
	public List<CartDTO> getCartList(String userid){
		System.out.println("getCartList 도착");
		
		List<CartDTO> cartList = sqlsession.selectList("Payment.getCartList",userid);
		
		System.out.println("CartList 조회");
		
		return cartList;
	}

	//주문결제 창 표현에 필요한 정보를 가져오는 기능1
	public List<CartDTO> getCheckoutList(String[] cIDs){
		System.out.println("getCheckoutList 도착");
		
		HashMap<String, Object> ciddata = new HashMap<>();
		ciddata.put("cIDs", cIDs);
		
		List<CartDTO> checkoutList = sqlsession.selectList("Payment.getCheckoutList",ciddata);
		
		System.out.println("checkoutList 조회");
		
		return checkoutList;
	}
	
	//주문결제 창 표현에 필요한 정보를 가져오는 기능2
	public MemberDTO getMemberInfo(String userid){
		System.out.println("getMemberInfo 도착");
		
		MemberDTO memberInfo = sqlsession.selectOne("Payment.getMemberInfo",userid);
		
		System.out.println("memberInfo 조회");
		
		return memberInfo;
	}

	//특정한 장바구니 요소들을 삭제하는 기능
	public boolean deleteCartItem(String[] del_cIDs){
		System.out.println("deleteCartItem 도착");
		boolean result = false;
		
		HashMap<String, Object> ciddata = new HashMap<>();
		ciddata.put("del_cIDs", del_cIDs);
		
		if(sqlsession.delete("Payment.deleteCartItem",ciddata) != 0) {
			result = true;
		}
			return result;
	}
	
	//특정한 장바구니 요소만을 가져오는 기능
	public CartDTO getCartItem(String cID){
		System.out.println("getCartItem 도착");
		
		CartDTO cartItem = sqlsession.selectOne("Payment.getCartItem",cID);
		System.out.println("CartItem 조회");
		
		return cartItem;
	}
	
	//주문 테이블에 요소를 삽입
	public boolean insertOrder(OrderDTO odto) {
		System.out.println("insertOrder 도착");
		boolean result = false;
		
		if(sqlsession.insert("Payment.insertOrder", odto) == 1) {
			result = true;
		}
		
		return result;
	}
	
	//주문 테이블에 요소를 삽입 후 해당되는 상품들을 전부 삭제
	public boolean deleteCartItemAll(String[] cIDs){
		System.out.println("deleteCartItemAll 도착");
		boolean result = false;
		
		HashMap<String, Object> ciddata = new HashMap<>();
		ciddata.put("cIDs", cIDs);
		
		if(sqlsession.delete("Payment.deleteCartItemAll",ciddata) != 0) {
			result = true;
		}
			return result;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////
	
	public List<CartDTO> getCheckoutDirect(int gID, int gQTY){
		System.out.println("directCheckout 도착");

		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("gID", gID);
		datas.put("gQTY", gQTY);
		
		List<CartDTO> checkoutList = sqlsession.selectList("Payment.getCheckoutDirect",datas);
				
		System.out.println("checkoutItem 받음 완료");
		
		return checkoutList;
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
	
	public boolean updateCart(int samecID, int gQTY) {
		System.out.println("updateCart 도착");
		boolean result = false;
		
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("samecID", samecID);
		datas.put("gQTY", gQTY);
		
		if(sqlsession.insert("Payment.updateCart", datas) == 1) {
			result = true;
		}
		
		return result;
	}
	
}