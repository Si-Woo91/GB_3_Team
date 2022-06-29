package com.gushipsam.goods.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gushipsam.goods.mybatis.SqlMapConfig;



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

	
}



















