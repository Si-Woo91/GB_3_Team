package com.gushipsam.shoppingmall;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.goods.dao.goodsDAO;
import com.gushipsam.goods.dao.goodsDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AddGoodsOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("AddGoodsOkAction 도착");
		ActionForward forward = new ActionForward();
		goodsDAO gdao = new goodsDAO();
		goodsDTO gdto = new goodsDTO();
		MultipartRequest multi = null;

		// 파일 업로드 구현시 참고한 자료:
		// https://makecodework.tistory.com/entry/JSP-cosjar-를-이용하여-eclipse-에서-파일-업로드-기능-구현하기
		
		String category = req.getParameter("category");
		String foldername = "";
		switch( category ){
			case "냉장고": foldername = "fridge"; break;
			case "세탁기": foldername = "washer"; break;
			case "TV": foldername = "tv"; break;
			case "에어컨": foldername = "ac"; break;
			case "컴퓨터": foldername = "pc"; break;
		}
		
		//realpath이 원하는 디렉토리 경로로 나오지 않는다면 사용중인 Server를 멈추고 더블클릭>Overview아래>Server Options 중
		//"Serve Models Without Publishing"을 체크해주세요.
		//(참고: https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=ksi4687&logNo=220527469366)
		String realpath = req.getSession().getServletContext().getRealPath("/img");
		System.out.println("real path: " + realpath);
		String directory = realpath.replace("\\", "/") + "/" + foldername;
		int sizeLimit = 100 * 1024 * 1024; // 100MB 제한

		try {
			multi = new MultipartRequest(req, directory, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}

		String file = multi.getOriginalFileName("file");
		String file2 = multi.getOriginalFileName("file2");
		String name = multi.getParameter("name");
		String catg = multi.getParameter("catg");
		String modelcode = multi.getParameter("modelcode");
		String brand = multi.getParameter("brand");
		String size = multi.getParameter("size");
		int price = Integer.parseInt(multi.getParameter("price"));
		String etc = multi.getParameter("etc");
		int stock = Integer.parseInt(multi.getParameter("stock"));

		gdto.setgCatg(catg);
		gdto.setgBrand(brand);
		gdto.setgName(name);
		gdto.setgEtc(etc);
		gdto.setgImgs(file);
		gdto.setgImgl(file2);
		gdto.setgModel(modelcode);
		gdto.setgPRICE(price);
		gdto.setgSTOCK(stock);
		gdto.setgSize(size);

		if (gdao.insertGoods(gdto)) { // 성공시
			System.out.println("상품 추가 성공");
			forward.setPath(req.getContextPath() + "/admin/adminGoods.spm");
		} else {
			System.out.println("상품 추가 실패");
			forward.setPath(req.getContextPath() + "/AD-Page/addgoods.jsp");
		}
		
		forward.setRedirect(true);
		return forward;
	}

}
