package com.gushipsam.goods;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.goods.dao.goodsDAO;

public class goodsListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		goodsDAO gdao = new goodsDAO();

		String gCatg = req.getParameter("gCatg");
		
		req.setAttribute("goodsList", gdao.getgoodsList(gCatg));
		
	
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/goods/goodsList.jsp");
		
		return forward;
	}

}








