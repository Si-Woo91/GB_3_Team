package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;

public class OrderListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		ShoppingMallDAO shopDAO = new ShoppingMallDAO();
		
		// 전체 주문 수
		int orderCnt = shopDAO.getOrderCnt();
		System.out.println("orderCnt : " + orderCnt);
		
		// 페이징 처리
		// 현재 넘겨받은 페이지
		String temp = req.getParameter("page");
		int page = 0;
		
		page = temp == null ? 1 : Integer.parseInt(temp);
		
		
		// 페이지 처리 [1][2]...[10] : 10개씩
		int pageSize = 10;
				
		// 1페이지 endRow = 10, 4 페이지 endRow = 40
		int endRow = page *10;
		// 1페이지 startRow = 1, 4 페이지 startRow = 31
		int startRow = endRow -9;
		
		// [1][2]...[10] : [1], [11][12]..[20] : [11]
		int startPage = (page -1) / pageSize*pageSize + 1;
		// [1][2]...[10] : [10], [11][12]..[20] : [20]
		int endPage = startPage + pageSize -1;
		int totalPage = (orderCnt -1)/pageSize + 1;
		
		System.out.println("endRow : " + endRow);
		System.out.println("startRow : " + startRow);
		System.out.println("startPage : " + startPage);
		System.out.println("endPage : " + endPage);
		System.out.println("totalPage : " + totalPage);
		System.out.println("----------------------------------");
				
		// endPage가 totalPage보다 크다면 totalPage를 보여주고 아니라면 endPage를 보여줘
		endPage = endPage > totalPage ? totalPage : endPage;
		
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("nowPage", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);		
		
		req.setAttribute("orderCnt", orderCnt);
		req.setAttribute("orderList", shopDAO.getOrderList(startRow, endRow));
		
		
		forward.setRedirect(false);
		forward.setPath( req.getContextPath() + "/OrderList/OrderList-Page.jsp");
		System.out.println("/OrderList/OrderList.jsp");
		
		return forward;
	}

}
