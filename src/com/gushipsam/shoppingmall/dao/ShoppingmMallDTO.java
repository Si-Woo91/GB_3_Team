package com.gushipsam.shoppingmall.dao;

public class ShoppingmMallDTO {
	// admin
	private String aID;	
	private String aPW;					
	private String aNAME;
	
	// member
    private String mID; 		
    private String mPW; 					
    private String mNickNAME;			
    private String mEmail;				 
    private String mPHONE;
    
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
    
