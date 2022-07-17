package com.gushipsam.shoppingmall;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.goods.dao.goodsDAO;

public class SearchGoodsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("SearchGoodsAction 도착");
		ActionForward forward = new ActionForward();
		goodsDAO gdao = new goodsDAO();

		String[] searchtext = req.getParameter("searchtext").trim().split(" ");
		// "GCATG","GBRAND","GNAME","GMODEL","GSIZE","GETC","GIMGS" 컬럼에 대해서 검색한다.

		// 번역 등 기능
		for (int i = 0; i < searchtext.length; i++) {
			String t = searchtext[i];
			if (t.equalsIgnoreCase("samsung"))
				searchtext[i] = "삼성";
			if (t.equalsIgnoreCase("apple"))
				searchtext[i] = "애플";
			if (t.equalsIgnoreCase("winia"))
				searchtext[i] = "위니아";
			if (t.equalsIgnoreCase("엘지"))
				searchtext[i] = "lg";
			if (t.equalsIgnoreCase("ac"))
				searchtext[i] = "에어컨";
			if (t.equalsIgnoreCase("갤럭시"))
				searchtext[i] = "galaxy";
			if (t.equalsIgnoreCase("갤럭시북"))
				searchtext[i] = "galaxy book";
			if (t.equalsIgnoreCase("맥북"))
				searchtext[i] = "macbook";
			if (t.equalsIgnoreCase("울트라기어"))
				searchtext[i] = "ultragear";
			if (t.equalsIgnoreCase("울트라"))
				searchtext[i] = "ultra";
			if (t.equalsIgnoreCase("비스포크"))
				searchtext[i] = "bespoke";
			if (t.equalsIgnoreCase("그램"))
				searchtext[i] = "gram";
		}

		req.setAttribute("goodsList", gdao.getGoodsList(searchtext));
		req.setAttribute("goodsCnt", gdao.getGoodsCnt(searchtext));

		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/AD-Page/admingoods.jsp");

		return forward;
	}

}
