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

	// 제품 목록 (카테고리만 제한)
	public List<goodsDTO> getgoodsList(String gCatg){
		
		List<goodsDTO> goodsList = sqlsession.selectList("goods.getgoodsList", gCatg);
		
		return goodsList;
	}
	
	// 제품 목록 (카테고리+브랜드 제한, 오버로딩)
	public List<goodsDTO> getgoodsList(String gCatg, String gBrand){
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("gCatg", gCatg);
		datas.put("gBrand", gBrand);
		
		List<goodsDTO> goodsList = sqlsession.selectList("goods.getgoodsListwBrand", datas);
		
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
	public List<goodsDTO> getGoodsList() {
		System.out.println("getGoodsList 도착");

		List<goodsDTO> goodsList = sqlsession.selectList("goods.getGoodsList");
		System.out.println("goodsList 조회");

		return goodsList;
	}
	
	// (관리자 페이지)검색내용 반영한 상품 수 (오버로딩)
	public int getGoodsCnt(String[] searchtext) {
		System.out.println("검색내용 반영하는 getGoodsCnt 도착");
		HashMap<String, Object> searchdata = new HashMap<>();
		searchdata.put("searchtext", searchtext);
		
		return sqlsession.selectOne("goods.getGoodsCntSearch", searchdata);
	}
	
	// (관리자) 검색내용 반영한 상품리스트 데이터  (오버로딩)
	public List<goodsDTO> getGoodsList(String[] searchtext) {
		System.out.println("검색내용 반영하는 getGoodsList 도착");
		HashMap<String, Object> searchdata = new HashMap<>();
		searchdata.put("searchtext", searchtext);
		
		List<goodsDTO> goodsList = sqlsession.selectList("goods.getGoodsListSearch",searchdata);
		System.out.println("검색내용 반영한 goodsList 조회");
		
		return goodsList;
	}

	// (관리자 페이지) 상품 삭제 전 장바구니 확인
	public boolean searchCartForDel(String[] delgids) {
		boolean result = false;
		int searchcount = 0;
		HashMap<String, Object> deldata = new HashMap<>();
		deldata.put("delgids", delgids);
		
		searchcount = sqlsession.selectOne("goods.searchCartForDel", deldata);
		
		if(searchcount != 0) result = true;
		
		return result;
	}
	
	// (관리자 페이지) 상품 삭제 전 주문내역 확인
	public boolean searchOrdersForDel(String[] delgids) {
		boolean result = false;
		int searchcount = 0;
		HashMap<String, Object> deldata = new HashMap<>();
		deldata.put("delgids", delgids);
		
		searchcount = sqlsession.selectOne("goods.searchOrdersForDel", deldata);
		
		if(searchcount != 0) result = true;
		
		return result;
	}	
	
	// (관리자 페이지) 상품 삭제
	public boolean delGoodItem(String[] delgids){
		boolean result = false;
		int deletecount = 0;
		
		System.out.println("delgooditem 도착");

		for (int i = 0; i < delgids.length; i++) {
			System.out.println("delgids의" + i + "번째 항목" + delgids[i]);
		}

		HashMap<String, Object> deldata = new HashMap<>();
		deldata.put("delgids", delgids);
		
		deletecount = sqlsession.delete("goods.delGoodFromCart", deldata)
						+ sqlsession.delete("goods.delGoodFromOrders", deldata)
						+ sqlsession.delete("goods.delGoodFromGoods", deldata);
		
		if (deletecount != 0) {
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

	// (관리자페이지) 상품 1품목 재고량 변경 
	public boolean updateStockOne(int gID, int newstock) {
		boolean result = false;
		
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("gID", gID);
		datas.put("newstock", newstock);
		
		if(sqlsession.update("goods.updateStockOne", datas) == 1) {
			result = true;
		}
		
		return result;
	}
	
	// (관리자페이지) 상품 다품목 재고량 변경 
	public boolean updateStockAll(String[] gIDs, String[] newstocks) {
		boolean result = false;
		int gID = 0, newstock = 0, count = 0;
		
		for (int i = 0; i < gIDs.length; i++) {
			gID = Integer.parseInt(gIDs[i]);
			newstock = Integer.parseInt(newstocks[i]);
			updateStockOne(gID,newstock);
			count++;
		}
		
		if( count != 0) result = true;
		
		return result;
	}

	
}



















