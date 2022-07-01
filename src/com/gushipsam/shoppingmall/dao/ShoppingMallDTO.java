package com.gushipsam.shoppingmall.dao;

public class ShoppingMallDTO {

	// login
	private String uID;
	private String userid;
	private String userpw;
	private String username;
	private String userphone;
	private String userdata;
	private String useremail;

	// admin
	private String aID;
	private String aPW;
	private String aNAME;

	// goods
	private String gID;
	private String gCatg;
	private int gNumber;
	private String gName;
	private String gBrand;
	private int gPRICE;
	private int gSTOCK;
	private String gDATE;
	private String gIMG;
	private String gIMGS;

	// cart
	private int cID;
	private int cQTY;

	// orders
	private String oDate;
	private String oPHONE;
	private String oADDRESS;
	private int oQTY;

	// imagefile
	private int iID;
	private String fileNm;
	private String fileExtension;
	private String fileFullNm;
	private String fileRoute;

	// 로그인 , 회원가입, 아이디,비밀번호 찾기
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public String getUserdata() {
		return userdata;
	}

	public void setUserdata(String userdata) {
		this.userdata = userdata;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	// 관리자
	public String getaID() {
		return aID;
	}

	public void setaID(String aID) {
		this.aID = aID;
	}

	public String getaPW() {
		return aPW;
	}

	public void setaPW(String aPW) {
		this.aPW = aPW;
	}

	public String getaNAME() {
		return aNAME;
	}

	public void setaNAME(String aNAME) {
		this.aNAME = aNAME;
	}

	// order 관련
	public int getcID() {
		return cID;
	}

	public void setcID(int cID) {
		this.cID = cID;
	}

	public int getcQTY() {
		return cQTY;
	}

	public void setcQTY(int cQTY) {
		this.cQTY = cQTY;
	}

	public String getoPHONE() {
		return oPHONE;
	}

	public void setoPHONE(String oPHONE) {
		this.oPHONE = oPHONE;
	}

	public String getoADDRESS() {
		return oADDRESS;
	}

	public void setoADDRESS(String oADDRESS) {
		this.oADDRESS = oADDRESS;
	}

	public String getgName() {
		return gName;
	}

	public String getuID() {
		return uID;
	}

	public void setmID(String mID) {
		this.uID = mID;
	}

	public String getgID() {
		return gID;
	}

	public void setgID(String gID) {
		this.gID = gID;
	}

	public String getgNAME() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	public int getoQTY() {
		return oQTY;
	}

	public void setoQTY(int oQTY) {
		this.oQTY = oQTY;
	}

	public String getgBrand() {
		return gBrand;
	}

	public void setgBrand(String gBrand) {
		this.gBrand = gBrand;
	}

	public int getgSTOCK() {
		return gSTOCK;
	}

	public void setgSTOCK(int gSTOCK) {
		this.gSTOCK = gSTOCK;
	}

	public String getgIMG() {
		return gIMG;
	}

	public void setgIMG(String gIMG) {
		this.gIMG = gIMG;
	}

	public int getgPRICE() {
		return gPRICE;
	}

	public void setgPRICE(int gPRICE) {
		this.gPRICE = gPRICE;
	}

	public int getgNumber() {
		return gNumber;
	}

	public void setgNumber(int gNumber) {
		this.gNumber = gNumber;
	}

	public String getgDATE() {
		return gDATE;
	}

	public void setgDATE(String gDATE) {
		this.gDATE = gDATE;
	}

	public String getgCatg() {
		return gCatg;
	}

	public void setgCatg(String gCatg) {
		this.gCatg = gCatg;
	}

	public String getgIMGS() {
		return gIMGS;
	}

	public void setgIMGS(String gIMGS) {
		this.gIMGS = gIMGS;
	}
}
