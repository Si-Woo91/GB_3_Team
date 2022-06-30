package com.gushipsam.goods.dao;

public class goodsDTO {

	private int 	gID;		// 상품 아이디
	private String 	gCatg;		// 상품 카테고리
	private String 	gBrand;		// 상품 브랜드명
	private String 	gName;		// 상품 제품명
	private String 	gModel;		// 상품 모델명
	private int		gPRICE;		// 상품 가격
	private String 	gSize;		// 상품 크기
	private String 	gEtc;		// 상품 기타정보		
	private String 	gImgs;		// 상품 이미지1(메인)
	private String 	gImgl;		// 상품 이미지2(상세)
	private String 	gDATE;		// 상품 등록일
	private int		gSTOCK;
	


	public int getgID() {
		return gID;
	}

	public void setgID(int gID) {
		this.gID = gID;
	}

	public String getgCatg() {
		return gCatg;
	}

	public void setgCatg(String gCatg) {
		this.gCatg = gCatg;
	}

	public String getgBrand() {
		return gBrand;
	}

	public void setgBrand(String gBrand) {
		this.gBrand = gBrand;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String getgModel() {
		return gModel;
	}

	public void setgModel(String gModel) {
		this.gModel = gModel;
	}

	public int getgPRICE() {
		return gPRICE;
	}

	public void setgPRICE(int gPRICE) {
		this.gPRICE = gPRICE;
	}

	public String getgSize() {
		return gSize;
	}

	public void setgSize(String gSize) {
		this.gSize = gSize;
	}

	public String getgEtc() {
		return gEtc;
	}

	public void setgEtc(String gEtc) {
		this.gEtc = gEtc;
	}

	public String getgImgs() {
		return gImgs;
	}

	public void setgImgs(String gImgs) {
		this.gImgs = gImgs;
	}

	public String getgImgl() {
		return gImgl;
	}

	public void setgImgl(String gImgl) {
		this.gImgl = gImgl;
	}

	public String getgDATE() {
		return gDATE;
	}

	public void setgDATE(String gDATE) {
		this.gDATE = gDATE;
	}
	
	public int getgSTOCK() {
		return gSTOCK;
	}

	public void setgSTOCK(int gSTOCK) {
		this.gSTOCK = gSTOCK;
	}
	
	
}