--DROP TABLE ADMIN;
--DROP TABLE "MEMBER";
--DROP TABLE product;
--DROP TABLE cart;
--DROP TABLE orders;
--DROP TABLE qna;
--DROP TABLE FK_CART_MEM ;
--DROP TABLE FK_CART_PRODUCT ;

CREATE TABLE ADMIN(						-- ����������
	aID VARCHAR2(10) PRIMARY KEY,		-- ������ ���̵�
	aPW VARCHAR2(100),					-- ������ ��й�ȣ
	aNAME VARCHAR2(100)					-- ������ �̸�
);

CREATE TABLE "MEMBER"(					-- ȸ������
    mID VARCHAR2(100) PRIMARY KEY,		-- ȸ�� ���̵�
    mPW VARCHAR2(15), 					-- ȸ�� ��й�ȣ
    mNickNAME VARCHAR2(100),			-- ȸ�� �г���
    mEmail VARCHAR2(50),				-- ȸ�� �̸��� 
    mPHONE VARCHAR2(100)				-- ȸ�� ��ȭ��ȣ
);

CREATE TABLE GOODS(					-- ��ǰ ����
	gID NUMBER(4) PRIMARY KEY,			-- ��ǰ ���̵�
    gNumber NUMBER(4),					-- ��ǰ ��ȣ
    gName VARCHAR2(100),				-- ��ǰ �̸�
    gBrand VARCHAR2(100),				-- ��ǰ �귣���
    gPRICE NUMBER(10),					-- ��ǰ ����
    gSTOCK NUMBER(3),					-- ��ǰ ����
    gDATE DATE DEFAULT SYSDATE			-- ��ǰ �����
);

CREATE TABLE CART(								-- ��ٱ���
	cID NUMBER(10) PRIMARY KEY,
    mID VARCHAR2(100),								
    gID NUMBER(4),						
    cQTY NUMBER(3) DEFAULT 1					-- ��ٱ��Ͽ� ����ִ� ��ǰ�� ����
);

CREATE TABLE fk_Cart_Mem(						-- ��ٱ���, ��� fk
	 mID VARCHAR2(500)
);

CREATE TABLE fk_Cart_Product(					-- ��ٱ���, ��ǰ fk
	  gNumber NUMBER(4)
);


CREATE TABLE ORDERS(							-- �ֹ�����
    oID NUMBER(10) PRIMARY KEY,					
    mID VARCHAR2(100),	
    gID NUMBER(4),								
    oDATE DATE DEFAULT SYSDATE,					-- �ֹ� ��¥
    oPHONE VARCHAR2(100),						-- �ֹ��� ����ó
    oADDRESS VARCHAR2(500),						-- �ּ�				
    oPAYMENT NUMBER(20),						-- �����ݾ�
--    oINVOICE NUMBER(10),						-- �����ȣ
CONSTRAINT fk_ord_mem FOREIGN KEY(mID) 
REFERENCES member(mID),
CONSTRAINT fk_ord_goods FOREIGN KEY(gID) 
REFERENCES GOODS(gID)
);

CREATE TABLE ImageFile(							-- �̹�������
	iID number(10) PRIMARY KEY,					
	fileNm varchar2(1000), 						-- �̹��� �̸�
	fileExtension varchar2(10),					-- �̹��� Ȯ����
	fileFullNm varchar2(1000),					-- �̹��� �̸�+Ȯ����
	fileRoute varchar2(1000)					-- �̹��� ���
)



SELECT * FROM ADMIN;
SELECT * FROM "MEMBER";
SELECT * FROM GOODS;
SELECT * FROM CART;
SELECT * FROM ORDERS;
SELECT * FROM ImageFile;
