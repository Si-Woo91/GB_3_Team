package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.goods.dao.goodsDAO;

public class DelGoodConfirmAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("DelGoodConfirmAction 도착");
		ActionForward forward = new ActionForward();
		goodsDAO gdao = new goodsDAO();
		
		// ~~delgids=1,2,3
		String[] delgids = req.getParameter("delgids").split(",");
		// 1,2,3 - split -> { 1, 2,3} 
		
		if(gdao.searchCartForDel(delgids) || gdao.searchOrdersForDel(delgids)) {
			req.setAttribute("result", "exist");
		} else {
			req.setAttribute("result", "nonexist");
		}
		
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/AD-Page/existornot.jsp");
		
		return forward;
	}


}
