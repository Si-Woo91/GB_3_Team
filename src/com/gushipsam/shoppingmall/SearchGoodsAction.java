package com.gushipsam.shoppingmall;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;

public class SearchGoodsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("searchgoodsAction 도착");
		// default settings (Server encoding, Client encoding)
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html; charset=UTF-8");
				
				// request encoding
				try {
					req.setCharacterEncoding("UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println("utf-8검사");
				
		ActionForward forward = new ActionForward();
		System.out.println("action 객체생성");
		
		ShoppingMallDAO dao = new ShoppingMallDAO();
		System.out.println("dao객체생성");
		
		String searchtext = req.getParameter("searchtext");
		System.out.println("파라미터 넣음");
		System.out.println(searchtext);
		
		req.setAttribute("searchlist", dao.getSearchList(searchtext));
		System.out.println("로직 실행함");
		System.out.println(dao.getSearchList(searchtext));
		
		forward.setRedirect(false);
		forward.setPath( req.getContextPath() + "/goods/goodsList.jsp" );
		
		return forward;
	}

}
