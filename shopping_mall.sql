--
--DROP TABLE ADMIN;
--DROP TABLE MEMBERS;
--DROP TABLE GOODS ;
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

CREATE TABLE MEMBERS(
   userid      		varchar2(200) PRIMARY KEY ,	-- ���̵�
   userpw     		varchar2(200) ,			-- ��й�ȣ
   username   		varchar2(200) ,			-- �̸�
   userphone		varchar2(400),			-- ��ȭ��ȣ
   userdata			varchar2(400) ,			-- ����
   useremail  		varchar2(800)			-- �̸���
);

CREATE TABLE GOODS(						-- ��ǰ ����
	gID		NUMBER(4) PRIMARY KEY,		-- ��ǰ ���̵�
	gCatg	VARCHAR2(100),				-- ��ǰ ī�װ�
	gBrand	VARCHAR2(100),				-- ��ǰ �귣���
    gName 	VARCHAR2(100),				-- ��ǰ ��ǰ��
    gModel	VARCHAR2(100),				-- ��ǰ �𵨸�	
    gPRICE 	NUMBER(10),					-- ��ǰ ����
    gSize	VARCHAR2(100),				-- ��ǰ ũ��
    gEtc	VARCHAR2(100),				-- ��ǰ ��Ÿ����
    gImgs	VARCHAR2(300),				-- ��ǰ �̹���1
    gImgl	VARCHAR2(300),				-- ��ǰ �̹���2
    gDATE	DATE NOT NULL 				-- ��ǰ �����
);

-- ��ǰ ������
CREATE SEQUENCE seq_gidx;

--gid seq
CREATE SEQUENCE Good_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 1000
MINVALUE 1
nocycle;

--������
CREATE TABLE SERVICE(
	servicenum		number(10) PRIMARY KEY,
	servicename		varchar2(300),
	servicedate		date,
	servicetitle	varchar2(300),
	servicecontent	Varchar2(4000),
	servicereadcount	number(10)
);

-- ������ ���
CREATE TABLE SERVICE_REPLY(
	replynum		number(10) PRIMARY KEY,
	replycontent	varchar2(600),
	servicename		varchar2(300),
	password		varchar2(300),
	servicenum		number(10),
	CONSTRAINT rep_db_fk FOREIGN KEY(servicenum) REFERENCES service(servicenum)
);

--ORDERS ���̺� �ֹ������÷� oQTY �߰� �Ϸ�, �����ݾ� ���� �Ϸ�(����, 2022.06.24)
CREATE TABLE ORDERS(							-- �ֹ�����
    oID NUMBER(10) PRIMARY KEY,					
    mID VARCHAR2(100),	
    gID NUMBER(4),
    oQTY NUMBER(3) DEFAULT 1,					--�ֹ� ����
    oDATE DATE DEFAULT SYSDATE,					-- �ֹ� ��¥
    oPHONE VARCHAR2(100),						-- �ֹ��� ����ó
    oADDRESS VARCHAR2(500),						-- �ּ�				
--    oPAYMENT NUMBER(20),						-- �����ݾ�(GOODS join�ؼ� ����ϸ� �ǹǷ� �ʿ�x)
--    oINVOICE NUMBER(10),						-- �����ȣ
CONSTRAINT fk_ord_mem FOREIGN KEY(mID) 
REFERENCES MEMBERS(mID),
CONSTRAINT fk_ord_goods FOREIGN KEY(gID) 
REFERENCES GOODS(gID)
);

SELECT * FROM GOODS g ;

-- oid seq
CREATE SEQUENCE Order_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 1000
MINVALUE 1
nocycle;

ALTER TABLE GOODS add(gIMG varchar2(100));

--CART ���̺� fk ���� �߰� �Ϸ�(����, 2022.06.24)
CREATE TABLE CART(								-- ��ٱ���
	cID NUMBER(10) PRIMARY KEY,
    userid VARCHAR2(100),								
    gID NUMBER(4),						
    cQTY NUMBER(3) DEFAULT 1,					-- ��ٱ��Ͽ� ����ִ� ��ǰ�� ����
CONSTRAINT fk_cart_mem FOREIGN KEY(userid) 
REFERENCES MEMBERS(userid),
CONSTRAINT fk_cart_goods FOREIGN KEY(gID) 
REFERENCES GOODS(gID)
);

--fridge
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '�����', 'LG', 'LG ����� �������÷��� ��Ʈ�� Ÿ��', 'M623GTB052', 3550000, '914X186X69.8cm', '610L', 'fridge1.png', 'fridge1_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '�����', '�Ｚ', 'BESPOKE ����� 4���� �������ĵ� ', 'RF85B90023Y', 1859000, '910X185.3X93cm', '875L', 'fridge2.png', 'fridge2_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '�����', 'LG', 'LG �������÷��� �����ͺ� �õ���', 'Y321MW3S', 1187000, '595X186X670cm', '321L', 'fridge5.png', 'fridge5_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '�����', 'LG', 'LG �������÷��� ���γ����', 'W0082GBE', 424500, '282X497X534cm', '12kg', 'fridge4.png', 'fridge4_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '�����', 'LG', 'LG ����� �������÷��� ��������������', 'W822MWW452S', 4700000, '914X918X186cm', '820L', 'fridge3.png', 'fridge3_spec1.png', sysdate );

-- washer
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '��Ź��', 'LG', 'LG Ʈ�� �������÷���', 'FX25EA', 1879000, '700X990X830mm', '25kg', 'washer1.png', 'washer1_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '��Ź��', '�Ｚ', '�׶��� AI[���ο���Ʈ��]', 'WF21T9500KW7T', 2000000, '686X984X796mm', '21kg+17kg', 'washer2.png', 'washer2_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '��Ź��', 'LG', 'LG Ʈ�� Ʈ������', 'FX24WSB', 2450000, '700X1360X830mm', '24kg+4kg', 'washer3.png', 'washer3_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '��Ź��', 'LG', 'LG �뵹��', 'T20HVD', 755000, '690X1023X730mm', '20kg', 'washer4.png', 'washer4_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '��Ź��', '�Ｚ', 'BESPOKE �׶��� AI', 'WF25B8400KV', 1626000, '686X984X875mm', '25kg', 'washer5.png', 'washer5_spec1.png', sysdate );

--tv
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, 'TV', '�Ｚ', 'Neo QLED 4K TV (55��ġ)', 'KQ55QNA88AFXKR', 1990000, '1227.4X706.2X26.9mm', 'LED', 'tv1.png', 'tv1_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, 'TV', 'LG', 'LG OLED evo TV (83��ġ)', 'OLED83G2KNA', 11505000, '1847X1052X28mm', 'OLED', 'tv2.png', 'tv2_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, 'TV', 'LG', 'LG ��Ʈ�� HD TV (75��ġ)', '75UQ8300ENA', 2685000, '1678X964X59.9mm', 'LED', 'tv3.png', 'tv3_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, 'TV', 'LG', 'LG QNED TV (86��ġ)', '86QNED80KQA', 3520000, '218.44cm', 'LED', 'tv4.png', 'tv4_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, 'TV', '�Ｚ', '2022 Crystal UHD TV', 'KU85UB8070FXKR', 1682000, '1900.9X1086.2X26.9mm', 'QLED', 'tv5.png', 'tv5_spec1.png', sysdate );

--ac
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '������', '�Ｚ', '��ǳ������ Ŭ���� û��', 'AF17A7972RFRT', 2099000, '(363X1883X330mm)+(820X345X215mm)', '(56.9��)+(18.7��)', 'ac1.png', 'ac1_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '������', '�Ｚ', 'BESPOKE ��ǳ������ ������', 'AF18AX778EZERT', 2549000, '(415X1830X286mm)+(820X299X215mm)', '(58.5 �� + 18.7 ��)', 'ac2.png', 'ac2_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '������', 'LG', 'LG �ּ� ��󿡾��� (���丮)', 'FQ17VCDWC2', 1850000, '(390X1870X332mm)+(870X650X330mm)', '(56.9��)+(18.7��)', 'ac3.png', 'ac3_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '������', '���Ͼ�', '���Ͼ� 2in1 �ѷ��ٶ� ������', 'WPVW17GDSGQM', 2250000, '(390X1892X378mm)+(870X680X300mm)', '(56.9��)+(22.8��)', 'ac4.png', 'ac4_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '������', '�Ｚ', 'BESPOKE ��ǳ������ ü��ǳ', 'AF19BX890NFRS', 4434000, '(415X1910X309mm)+(820X345X215mm)', '(62.6��)+(18.7��)', 'ac5.png', 'ac5_spec1.png', sysdate );

-- pc
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '��ǻ��', 'LG', 'LG gram 16', '16Z90Q-EA5WK', 2340000, '356X244X16.8mm', '�� 1190g', 'pc1.png', 'pc1_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '��ǻ��', '�Ｚ', 'Galaxy Book2 Pro', 'NT950XEV-G51A', 2148000, '355.4X225.8X13.3mm', '1.17kg', 'pc2.png', 'pc2_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '��ǻ��', '����', 'MacBook Pro 14', 'MKGR3KH/A', 2690000, '35.97cm(14.2��ġ)', '1.6kg', 'pc3.png', 'pc3_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '��ǻ��', 'LG', 'LG UItraGear ��Ʈ��', '17U70P-PA7DK', 2240000, '381X274X19.9mm', '�� 1950g', 'pc4.png', 'pc4_spec1.png', sysdate );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '��ǻ��', 'LG', 'LG ��Ʈ�� PC', '15U40Q-GR3DK', 920000, '359X237X19.1mm', '�� 1750g', 'pc5.png', 'pc5_spec1.png', sysdate );

SELECT * FROM ADMIN;
SELECT * FROM SERVICE ;
SELECT * FROM MEMBERS;
SELECT * FROM GOODS;
SELECT * FROM CART;
SELECT * FROM ORDERS;
SELECT * FROM ImageFile;