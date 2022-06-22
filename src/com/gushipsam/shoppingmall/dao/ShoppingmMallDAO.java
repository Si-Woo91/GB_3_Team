package com.gushipsam.shoppingmall.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gushipsam.shoppingmall.mybatis.SqlMapConfig;


public class ShoppingmMallDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public ShoppingmMallDAO() {
		// autocommit
		sqlsession = factory.openSession(true);
	}


	
}


















