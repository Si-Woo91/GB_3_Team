package com.gushipsam.shoppingmall.dao;

public class ShoppingMallDTO {
	//login
	private String userid;	
	private String userpw;
	private String username;
	private String userphone;
	private String userdata;
	private String useremail;
	
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


	// admin
	private String aID;	
	private String aPW;					
	private String aNAME;
	
    
    // goods
	private String gID;			
    private int gNumber;					
    private String gName;				
    private String gBrand;				
    private int gPRICE;					
    private int gSTOCK;
    private String gDATE;
    
    // cart
    private int cID;
    private int cQTY;
    
    // orders
    private String oDate;
    private String oPHONE;
    private String oADDRESS;
    private int oPAYMENT;
    
    // imagefile
    private int iID;
    private String fileNm; 						
	private String fileExtension;					
	private String fileFullNm;					
	private String fileRoute;	

}
    
