package com.gushipsam.shoppingmall;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.user.UserJoinAction;
import com.gushipsam.shoppingmall.user.UserLoginOkAction;



@WebServlet("*.spm")
public class ShoppingmMallFrontController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp)  
			throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		System.out.println("requestURI : " + requestURI);
		
		switch (requestURI) {
		
		//회원가입 여부 체크 실행, 가입 기록 없으면 회원가입페이지로 이동
		case "/IDPW/signupcheck.spm":
			forward = new SignupCheckAction().execute(req, resp);
			break;
			
		//회원가입 실행, 성공시 로그인페이지로 이동
		case "/IDPW/login.spm" :
			forward = new UserJoinAction().execute(req, resp);
			break;
			
		//로그인 실행, 성공시 메인페이지로 이동
		case "/main/main.spm" : 
			try {
				forward = new UserLoginOkAction().execute(req, resp);
			} catch (Exception e) {
			}
			break;
		
		//아이디찾기 실행, 성공 및 실패시 팝업창 뜸
		case "/IDPW/id.spm" :
			forward = new UseridAction().execute(req, resp);
			break;
		
		//비번찾기 실행, 성공 및 실패시 팝업창 뜸
		case "/IDPW/pw.spm" :
			forward = new UserpwAction().execute(req, resp);
			break;
			
		// 마이페이지 로비
		case "/lobby/mypage.spm":
			System.out.println("/lobby/Mypage.spm 도착");
			forward = new MypageAction().execute(req, resp);
			break;

		// 주문목록 페이지 이동
		case "/OrderList/OrderList.spm":
			 System.out.println("/OrderList/OrderList.spm 도착");
			 forward = new OrderListAction().execute(req, resp);
			 break;
			
		// 관리자 상품관리
		case "/admin/Goodslist.spm":
			System.out.println("/AD-Page/Goodslist.spm 도착");
			forward = new ADGoodsListAction().execute(req, resp);
			break;

		// 관리자 상품관리에서 상품 추가 페이지로 이동
		case "/AD-Page/ADDgoods.spm":
			System.out.println("/AD-Page/ADDgoods.spm 도착");
			forward = new ActionForward(true, req.getContextPath() + "/AD-Page/ADDgoods.jsp");
			break;

		// 관리자 상품관리에서 상품 추가
		case "/AD-Page/ADDgoodsOk.spm":
			System.out.println("/AD-Page/ADDgoodsOk.spm 도착");
			forward = new AddGoodsOkAction().execute(req, resp);
			break;

		// 관리자 상품관리에서 상품 삭제하기 전 장바구니/주문내역에 있는지 확인
		case "/AD-Page/DELgoodsConfirm.spm":
			 System.out.println("/AD-Page/cart.spm 도착");
			 forward = new DelGoodConfirmAction().execute(req, resp);
			 break;
			
		// 관리자 상품관리에서 상품 삭제
		case "/AD-Page/DELgoodsOk.spm":
			System.out.println("/AD-Page/cart.spm 도착");
			forward = new DelGoodsOkAction().execute(req, resp);
			break;
			 
		// 관리자 회원 리스트
		case "/admin/Memberlist.spm":
			 System.out.println("/admin/Memberlist.spm 도착");
			 forward = new ADMemberListAction().execute(req, resp);
			 break;
			 
		// 관리자 홈으로
		case "/AD-Page/adHome.spm":
			 System.out.println("/AD-Page/adHome.spm 도착");
			 forward = new ADHomeAction().execute(req, resp);
			 break;			
			
		// 관리자 - 전체 상품 중 검색
		case "/AD-Page/SearchGoods.spm":
			System.out.println("/AD-Page/SearchGoods.spm 도착");
			forward = new SearchGoodsAction().execute(req, resp);
			break;
		} 
		
		
		// 일괄처리
		if( forward != null ) {
			if( forward.isRedirect() ) {	// redirect
				resp.sendRedirect(forward.getPath());
			} else {						// forward
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
		
	}
	
}


















