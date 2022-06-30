package com.gushipsam.shoppingmall.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	
	public String id(String username, String userphone, String useremail) {
		
		HashMap<String, String> datas = new HashMap<>();
		datas.put("username", username);
		datas.put("userphone", userphone);
		datas.put("useremail", useremail);
		
		String user_id = sqlsession.selectOne("shoppingmall.id", datas);
		
		return user_id;
	}
	
	public String pw(String userid, String username, String userphone, String useremail) {
		
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("username", username);
		datas.put("userphone", userphone);
		datas.put("useremail", useremail);
		
		String user_pw = sqlsession.selectOne("shoppingmall.pw", datas);
		
		return user_pw;
	}
	
	// mypage 최근 주문 리스트
	public List<ShoppingMallDTO> getRecentList() {
		System.out.println("getRecentList 도착");

		List<ShoppingMallDTO> recentList = sqlsession.selectList("shoppingmall.getRecentList");
		System.out.println("recentList 조회");

		return recentList;
	}

	// 관리자 상품리스트
	public List<ShoppingMallDTO> getGoodsList() {
		System.out.println("getGoodsList 도착");

		List<ShoppingMallDTO> goodsList = sqlsession.selectList("shoppingmall.getGoodsList");
		System.out.println("goodsList 조회");

		return goodsList;
	}

	// 관리자 상품추가
	public boolean insertGoods(ShoppingMallDTO shop) {
		boolean result = false;

		// insert 성공시
		if (sqlsession.insert("shoppingmall.insertGoods", shop) == 1) {
			result = true;
		}

		System.out.println("result : " + result);

		return result;
	}

	// goods_seq
	public int getGoods_seq() {
		return sqlsession.selectOne("shoppingmall.getGoods_seq");
	}

	public List<ShoppingMallDTO> getGoodslist() {
		List<ShoppingMallDTO> goodlist = sqlsession.selectList("shoppingmall.selectGoods");
		return goodlist;
	}

	// search 메서드(상품명,브랜드)
	public List<ShoppingMallDTO> getSearchList(String searchtext) {
		System.out.println("getSearchList 메서드 dao 에용");
		System.out.println(searchtext);
		/*
		 * HashMap<String, String> datas = new HashMap<>();
		 * datas.put("searchtext",searchtext);
		 */
		List<ShoppingMallDTO> searchlist = new ArrayList<>();
		System.out.println("arraylist 생성!");
		System.out.println(sqlsession.selectList("shoppingmall.getSearchList", searchtext));
		searchlist.addAll(sqlsession.selectList("shoppingmall.getSearchList", searchtext));
		System.out.println("select 실행햇어용");

		return searchlist;
	}
	
	
	
}


















