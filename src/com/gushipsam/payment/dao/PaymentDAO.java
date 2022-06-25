package com.gushipsam.payment.dao;

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
	
	public List<CartDTO> getCartList(String mID){
		System.out.println("getCartList 도착");
		
		List<CartDTO> cartList = sqlsession.selectList("Payment.getCartList",mID);
		
		System.out.println("CartList 조회");
		
		return cartList;
	}
	
	
}



















