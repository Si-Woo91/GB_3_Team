package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;

public class ADGoodsListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		ShoppingMallDAO shopDAO = new ShoppingMallDAO();
		
		req.setAttribute("goodsList", shopDAO.getGoodsList());
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/AD-Page/Goodslist.jsp");
		
		return forward;
	}

}
