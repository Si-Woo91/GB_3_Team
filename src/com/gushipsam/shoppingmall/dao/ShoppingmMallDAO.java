package com.gushipsam.shoppingmall.dao;

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


	
}



















