package com.gushipsam.shoppingmall.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gushipsam.shoppingmall.mybatis.SqlMapConfig;


public class ShoppingMallDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public ShoppingMallDAO() {
		// autocommit
		sqlsession = factory.openSession(true);
	}
	
	public boolean checkId(String userid) {
        boolean result = false;
        int cnt = 0;
        
        cnt = sqlsession.selectOne("shoppingmall.checkId", userid);
        if( cnt >= 1 ) {
           result = true;
        }

        return result;
     }


	public int join(ShoppingMallDTO user) {
		int result;
	    
		result = sqlsession.insert("shoppingmall.join",user);
		 
		System.out.println("result : " + result);
	    return result;
	}

	public boolean login(String userid, String userpw) {
		boolean result = false;
		
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		
		if((Integer)sqlsession.selectOne("shoppingmall.login", datas) == 1) {
			result = true;
		}
		
		return result;
	}
	


	
}


















