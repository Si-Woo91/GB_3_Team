package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.shoppingmall.action.Action;
import com.gushipsam.shoppingmall.action.ActionForward;

public class MainGoodsSelectAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		forward.setPath("상품페이지");	//경로설정
		
		return forward;
	}


}
