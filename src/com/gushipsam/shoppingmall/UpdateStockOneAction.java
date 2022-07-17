package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.goods.dao.goodsDAO;
import com.gushipsam.goods.dao.goodsDTO;

public class UpdateStockOneAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("UpdateStockOneAction 도착");
		ActionForward forward = new ActionForward();
		goodsDAO gdao = new goodsDAO();

		int gID =  Integer.parseInt(req.getParameter("gid")); 
		int newstock =  Integer.parseInt(req.getParameter("newstock")); 
		
		gdao.updateStockOne(gID,newstock);
		
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/admin/adminGoods.spm");

		return forward;
	}

}
