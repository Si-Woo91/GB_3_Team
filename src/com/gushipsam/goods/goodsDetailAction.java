package com.gushipsam.goods;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.goods.dao.goodsDAO;

public class goodsDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("goodsDetailAction 도착");
		ActionForward forward = new ActionForward();
		goodsDAO gdao = new goodsDAO();

		int gID = Integer.parseInt(req.getParameter("gID"));

		req.setAttribute("goodsDetail", gdao.getgoodsDetail(gID));

		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/goods/goodsDetail.jsp");

		return forward;
	}

}
