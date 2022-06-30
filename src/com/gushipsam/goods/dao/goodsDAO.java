package com.gushipsam.goods.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gushipsam.goods.mybatis.SqlMapConfig;
import com.gushipsam.shoppingmall.dao.ShoppingMallDTO;



public class goodsDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public goodsDAO() {
		// autocommit
		sqlsession = factory.openSession(true);
	}

	// 제품 목록
	public List<goodsDTO> getgoodsList(String gCatg){
		
		List<goodsDTO> goodsList = sqlsession.selectList("goods.getgoodsList", gCatg);
		
		return goodsList;
	}
	
	// 제품 상세
	public goodsDTO getgoodsDetail(int gID){
		
		goodsDTO goodsDetail = sqlsession.selectOne("goods.getgoodsDetail", gID);
		
		return goodsDetail;
	}

	
	// (관리자 페이지)상품 수
	public int getGoodsCnt() {
		return sqlsession.selectOne("goods.getGoodsCnt");
	}
	
	// (관리자) 상품리스트 데이터
	public List<ShoppingMallDTO> getGoodsList() {
		System.out.println("getGoodsList 도착");

		List<ShoppingMallDTO> goodsList = sqlsession.selectList("goods.getGoodsList");
		System.out.println("goodsList 조회");

		return goodsList;
	}
	
	// (관리자 페이지) 상품 삭제
	public boolean delGoodItem(String[] delgids) throws Exception{
		boolean result = false;
		System.out.println("delgooditem 도착");

		for (int i = 0; i < delgids.length; i++) {
			System.out.println("delgids의" + i + "번째 항목" + delgids[i]);
		}

		HashMap<String, Object> deldata = new HashMap<>();
		deldata.put("delgids", delgids);

		if (sqlsession.delete("goods.delGoodItem", deldata) != 0) {
			result = true;
			System.out.println("delgooditem sql문 돌림 성공");

		}
		System.out.println("delgooditem 끝");

		return result;

	}		
	
	// (관리자 페이지) 상품 리스트
	public List<ShoppingMallDTO> getGoodslist() {
		List<ShoppingMallDTO> goodlist = sqlsession.selectList("goods.insertGoods");
		return goodlist;
	}
	
	
	// (관리자 페이지) 상품추가
	public boolean insertGoods(goodsDTO goods) {
		boolean result = false;

		// insert 성공시
		if (sqlsession.insert("goods.insertGoods", goods) == 1) {
			result = true;
		}

		System.out.println("result : " + result);

		return result;
	}

	
}



















