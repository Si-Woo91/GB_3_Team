package com.gushipsam.goods;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.goods.dao.goodsDAO;

public class GoodsListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		goodsDAO gdao = new goodsDAO();

		String gCatg = req.getParameter("gCatg");
		String gBrand = req.getParameter("gBrand");
		
		if(gBrand == null || gBrand.equals("")) {
			req.setAttribute("goodsList", gdao.getgoodsList(gCatg));
			forward.setPath(req.getContextPath() + "/goods/goodsList.jsp");

		} else {
			req.setAttribute("goodsList", gdao.getgoodsList(gCatg,gBrand));
			forward.setPath(req.getContextPath() + "/goods/goodsList.jsp");
		}
		
		forward.setRedirect(false);
		return forward;
	}

}








