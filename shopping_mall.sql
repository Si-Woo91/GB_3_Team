--DROP TABLE ADMIN;
--DROP TABLE "MEMBER";
--DROP TABLE product;
--DROP TABLE cart;
--DROP TABLE orders;
--DROP TABLE qna;
--DROP TABLE FK_CART_MEM ;
--DROP TABLE FK_CART_PRODUCT ;

CREATE TABLE ADMIN(						-- 관리자정보
	aID VARCHAR2(10) PRIMARY KEY,		-- 관리자 아이디
	aPW VARCHAR2(100),					-- 관리자 비밀번호
	aNAME VARCHAR2(100)					-- 관리자 이름
);

CREATE TABLE "MEMBER"(					-- 회원정보
    mID VARCHAR2(100) PRIMARY KEY,		-- 회원 아이디
    mPW VARCHAR2(15), 					-- 회원 비밀번호
    mNickNAME VARCHAR2(100),			-- 회원 닉네임
    mEmail VARCHAR2(50),				-- 회원 이메일 
    mPHONE VARCHAR2(100)				-- 회원 전화번호
);

CREATE TABLE GOODS(					-- 상품 정보
	gID NUMBER(4) PRIMARY KEY,			-- 상품 아이디
    gNumber NUMBER(4),					-- 상품 번호
    gName VARCHAR2(100),				-- 상품 이름
    gBrand VARCHAR2(100),				-- 상품 브랜드명
    gPRICE NUMBER(10),					-- 상품 가격
    gSTOCK NUMBER(3),					-- 상품 수량
    gDATE DATE DEFAULT SYSDATE			-- 상품 등록일
);

CREATE TABLE CART(								-- 장바구니
	cID NUMBER(10) PRIMARY KEY,
    mID VARCHAR2(100),								
    gID NUMBER(4),						
    cQTY NUMBER(3) DEFAULT 1					-- 장바구니에 담겨있는 상품의 수량
);

CREATE TABLE fk_Cart_Mem(						-- 장바구니, 멤버 fk
	 mID VARCHAR2(500)
);

CREATE TABLE fk_Cart_Product(					-- 장바구니, 상품 fk
	  gNumber NUMBER(4)
);


CREATE TABLE ORDERS(							-- 주문내역
    oID NUMBER(10) PRIMARY KEY,					
    mID VARCHAR2(100),	
    gID NUMBER(4),								
    oDATE DATE DEFAULT SYSDATE,					-- 주문 날짜
    oPHONE VARCHAR2(100),						-- 주문자 연락처
    oADDRESS VARCHAR2(500),						-- 주소				
    oPAYMENT NUMBER(20),						-- 결제금액
--    oINVOICE NUMBER(10),						-- 송장번호
CONSTRAINT fk_ord_mem FOREIGN KEY(mID) 
REFERENCES member(mID),
CONSTRAINT fk_ord_goods FOREIGN KEY(gID) 
REFERENCES GOODS(gID)
);

CREATE TABLE ImageFile(							-- 이미지관리
	iID number(10) PRIMARY KEY,					
	fileNm varchar2(1000), 						-- 이미지 이름
	fileExtension varchar2(10),					-- 이미지 확장자
	fileFullNm varchar2(1000),					-- 이미지 이름+확장자
	fileRoute varchar2(1000)					-- 이미지 경로
)



SELECT * FROM ADMIN;
SELECT * FROM "MEMBER";
SELECT * FROM GOODS;
SELECT * FROM CART;
SELECT * FROM ORDERS;
SELECT * FROM ImageFile;
