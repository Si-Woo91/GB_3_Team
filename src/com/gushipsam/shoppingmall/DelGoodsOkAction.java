package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.goods.dao.goodsDAO;

public class DelGoodsOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("DelGoodsOkAction 도착");
		ActionForward forward = new ActionForward();
		goodsDAO gDAO = new goodsDAO();
		
		// ~~delgids=1,2,3
		String[] delgids = req.getParameter("delgids").split(",");
		// 1,2,3 - split -> { 1, 2,3} 

		if(gDAO.delGoodItem(delgids)) {
			
			req.setAttribute("goodsList", gDAO.getGoodsList());
			req.setAttribute("goodsCnt", gDAO.getGoodsCnt());
			
			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/AD-Page/goods_tb.jsp");
		} else {
			
			req.setAttribute("goodsList", gDAO.getGoodsList());
			req.setAttribute("goodsCnt", gDAO.getGoodsCnt());
			
			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/AD-Page/goods_tb.jsp");
		}
		
		return forward;
	}

}
