package com.gushipsam.shoppingmall;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.goods.dao.goodsDAO;
import com.gushipsam.goods.dao.goodsDTO;

@MultipartConfig(
		location = "C:\\Users\\ksh98\\git\\GB_3_Team\\WebContent\\img",
					
		maxFileSize = -1,
		maxRequestSize = -1,
		fileSizeThreshold = 1024
		)

public class AddGoodsOkAction implements Action{

	private static final String CHARSET = "utf-8";
	private static final String ATTACHES_DIR = "C:\\Users\\ksh98\\git\\GB_3_Team\\WebContent\\img";
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("AddGoodsOkAction 도착");
		
		resp.setContentType("text/html; charset=UTF-8");
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("인코딩");
		
		ActionForward forward = new ActionForward();
		// 데이터 받아올 객체
		goodsDAO gDAO = new goodsDAO();
		
		// goodsDTO에 담아서 넘김
		goodsDTO gDTO = new goodsDTO();
		String fileName = null;

		
		// 이미지관련
		//	PrintWriter out = resp.getWriter();
		String contentType = req.getContentType();
		System.out.println("contype");

		if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
			Collection<Part> parts = null;
			try {
				parts = req.getParts();
			} catch (IOException | ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("parts");
			for (Part part : parts) {
				System.out.printf("파라미터 명 : %s, contnetType : %s, size : %d bytes \n", part.getName(),
						part.getContentType(), part.getSize());

				if (part.getHeader("Content-Disposition").contains("filename=")) {
					fileName = extractFileName(part.getHeader("Content-Disposition"));
					
					if (part.getSize() > 0) {
						System.out.printf("업로드 파일 명 : %s   \n", fileName);
						try {
							part.write(ATTACHES_DIR + File.separator + fileName);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						try {
							part.delete();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				} else {
					String formValue = req.getParameter(part.getName());
					System.out.printf("name : %s, value : %s \n", part.getName(), formValue);
				}
			}

			//out.println("<h1>업로드완료</h1>");
			System.out.println("<h1>업로드완료</h1>");
		} else {
			//out.println("<h1>enctype이 multipart/form-data가 아님 </h1>");
			System.out.println("<h1>enctype이 multipart/form-data가 아님 </h1>");
		}
		

		
		String gImgs = fileName;
		String gName = req.getParameter("description");
		String gBrand = req.getParameter("brand");
		int gPRICE = Integer.parseInt(req.getParameter("price"));
		int gSTOCK = Integer.parseInt(req.getParameter("stock"));
		
		
		gDTO.setgImgs(gImgs);
		System.out.println(gImgs);	//
		gDTO.setgName(gName);
		System.out.println(gName);	//
		gDTO.setgBrand(gBrand);
		System.out.println(gBrand);	//
		gDTO.setgPRICE(gPRICE);
		System.out.println(gPRICE);	//
		gDTO.setgSTOCK(gSTOCK);
		System.out.println(gSTOCK);	//

		System.out.println("shopDTO.객체");
		
		req.setAttribute("searchlist", gDAO.getGoodslist());
		
		forward.setRedirect(true);
		
		if(gDAO.insertGoods(gDTO)) { // 성공시
			forward.setPath(req.getContextPath() + "/admin/Goodslist.spm");
			System.out.println("상품 추가 성공");
		} else {
			forward.setPath(req.getContextPath() + "/AD-Page/ADDgoods.spm");
			System.out.println("상품 추가 실패");
		}
		return forward;
	}
	private String extractFileName (String partHeader) {
		System.out.println("파일이름메서드 ㅎㅇ");
		for(String cd : partHeader.split(";")) {
			if(cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf("=") + 1).trim().replace("\"","");;
				int index = fileName.lastIndexOf(File.separator);
				System.out.println(fileName.substring(index + 1));
				return fileName.substring(index + 1);
			}
		}
		return null;
	}
	
}
