package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.goods.dao.goodsDAO;
import com.gushipsam.goods.dao.goodsDTO;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;

public class ADGoodsListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("ADGoodsListAction 도착");
		ActionForward forward = new ActionForward();
		ShoppingMallDAO shopDAO = new ShoppingMallDAO();
		goodsDAO gDAO = new goodsDAO();
		
		// 회원 수
		int memberCnt = shopDAO.getMemberCnt();
		// 상품 수
		int goodsCnt = gDAO.getGoodsCnt();

		req.setAttribute("goodsList", gDAO.getGoodsList());
		req.setAttribute("goodsCnt", gDAO.getGoodsCnt());
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/AD-Page/admingoods.jsp");

		req.setAttribute("memberCnt", memberCnt);
		return forward;
	}

}
