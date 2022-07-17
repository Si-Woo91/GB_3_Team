package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.goods.dao.goodsDAO;
import com.gushipsam.goods.dao.goodsDTO;

public class UpdateStockAllAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("UpdateStockOneAction 도착");
		ActionForward forward = new ActionForward();
		goodsDAO gdao = new goodsDAO();

		
		// .. gids=1,2,3 ..
		String[] gIDs = req.getParameter("gids").split(",");
		String[] newstocks = req.getParameter("newstocks").split(",");
		// 1,2,3 - split -> { 1, 2, 3} 
		
		gdao.updateStockAll(gIDs,newstocks);
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/admin/adminGoods.spm");

		return forward;
	}

}
