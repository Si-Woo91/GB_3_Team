--
--DROP TABLE ADMIN;
--DROP TABLE MEMBERS;
--DROP TABLE GOODS ;
--DROP TABLE cart;
--DROP TABLE orders;
--DROP TABLE qna;
--DROP TABLE FK_CART_MEM ;
--DROP TABLE FK_CART_PRODUCT ;


CREATE TABLE ADMIN(                  -- 관리자정보
   aID VARCHAR2(10) PRIMARY KEY,      -- 관리자 아이디
   aPW VARCHAR2(100),               -- 관리자 비밀번호
   aNAME VARCHAR2(100)               -- 관리자 이름
);

CREATE TABLE MEMBERS(
   userid            varchar2(200) PRIMARY KEY ,   -- 아이디
   userpw           varchar2(200) ,         -- 비밀번호
   username         varchar2(200) ,         -- 이름
   userphone      varchar2(400),         -- 전화번호
   userdata         varchar2(400) ,         -- 생일
   useremail        varchar2(800)         -- 이메일
);

CREATE TABLE GOODS(                   -- 상품 정보
  	gID     NUMBER(4) PRIMARY KEY,    -- 상품 아이디
   	gCatg   VARCHAR2(100),            -- 상품 카테고리
   	gBrand  VARCHAR2(100),            -- 상품 브랜드명
    gName   VARCHAR2(100),            -- 상품 제품명
    gModel  VARCHAR2(100),            -- 상품 모델명   
    gPRICE  NUMBER(10),               -- 상품 가격
    gSize   VARCHAR2(100),            -- 상품 크기
    gEtc   	VARCHAR2(100),            -- 상품 기타정보
    gImgs   VARCHAR2(300),            -- 상품 이미지1
    gImgl   VARCHAR2(300),            -- 상품 이미지2
    gDATE   DATE NOT NULL,            -- 상품 등록일
    gStock   NUMBER(4)                -- 상품 재고   
);

-- 상품 시퀀스
CREATE SEQUENCE seq_gidx;

--gid seq
CREATE SEQUENCE Good_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 1000
MINVALUE 1
nocycle;

--고객센터
CREATE TABLE SERVICE(
   servicenum      number(10) PRIMARY KEY,
   servicename      varchar2(300),
   servicedate      date,
   servicetitle   varchar2(300),
   servicecontent   Varchar2(4000),
   servicereadcount   number(10)
);

-- 고객센터 댓글
CREATE TABLE SERVICE_REPLY(
   replynum      number(10) PRIMARY KEY,
   replycontent   varchar2(600),
   servicename      varchar2(300),
   password      varchar2(300),
   servicenum      number(10),
   CONSTRAINT rep_db_fk FOREIGN KEY(servicenum) REFERENCES service(servicenum)
);

--ORDERS 테이블 주문수량컬럼 oQTY 추가 완료, 결제금액 삭제 완료(찬우, 2022.06.24)
CREATE TABLE ORDERS(                     -- 주문내역
    oID NUMBER(10) PRIMARY KEY,               
    userid VARCHAR2(100),   
    gID NUMBER(4),
    oQTY NUMBER(3) DEFAULT 1,               --주문 수량
    oDATE DATE DEFAULT SYSDATE,               -- 주문 날짜
    oPHONE VARCHAR2(100),                  -- 주문자 연락처
    oADDRESS VARCHAR2(500),                  -- 주소            
--    oPAYMENT NUMBER(20),                  -- 결제금액(GOODS join해서 계산하면 되므로 필요x)
--    oINVOICE NUMBER(10),                  -- 송장번호
CONSTRAINT fk_ord_mem FOREIGN KEY(userid) 
REFERENCES MEMBERS(userid),
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

--ALTER TABLE GOODS add(gIMG varchar2(100));

--CART 테이블 fk 조건 추가 완료(찬우, 2022.06.24)
CREATE TABLE CART(                        -- 장바구니
   cID NUMBER(10) PRIMARY KEY,
    userid VARCHAR2(100),                        
    gID NUMBER(4),                  
    cQTY NUMBER(3) DEFAULT 1,               -- 장바구니에 담겨있는 상품의 수량
CONSTRAINT fk_cart_mem FOREIGN KEY(userid) 
REFERENCES MEMBERS(userid),
CONSTRAINT fk_cart_goods FOREIGN KEY(gID) 
REFERENCES GOODS(gID)
);

CREATE SEQUENCE cart_seq
START WITH 1
INCREMENT BY 1;

--fridge
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '냉장고', 'LG', 'LG 디오스 오브제컬렉션 빌트인 타입', 'M623GTB052', 3550000, '914X186X69.8cm', '용량 : 610L', 'fridge1.png', 'fridge1_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '냉장고', '삼성', 'BESPOKE 냉장고 4도어 프리스탠딩 ', 'RF85B90023Y', 1859000, '910X185.3X93cm', '용량 : 875L', 'fridge2.png', 'fridge2_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '냉장고', 'LG', 'LG 오브제컬렉션 컨버터블 냉동고', 'Y321MW3S', 1187000, '595X186X670cm', '용량 : 321L', 'fridge5.png', 'fridge5_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '냉장고', 'LG', 'LG 오브제컬렉션 와인냉장고', 'W0082GBE', 424500, '282X497X534cm', '용량 : 8병', 'fridge4.png', 'fridge4_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '냉장고', 'LG', 'LG 디오스 오브제컬렉션 얼음정수기냉장고', 'W822MWW452S', 4700000, '914X918X186cm', '용량 : 820L', 'fridge3.png', 'fridge3_spec1.png', sysdate, 0 );

-- washer
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '세탁기', 'LG', 'LG 트롬 오브제컬렉션', 'FX25EA', 1879000, '700X990X830mm', '세탁용량 : 25kg', 'washer1.png', 'washer1_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '세탁기', '삼성', '그랑데 AI[올인원컨트롤]', 'WF21T9500KW7T', 2000000, '686X984X796mm', '세탁용량 : 21kg+17kg', 'washer2.png', 'washer2_spec1.png', sysdate, 0  );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '세탁기', 'LG', 'LG 트롬 트윈워시', 'FX24WSB', 2450000, '700X1360X830mm', '세탁용량 : 24kg+4kg', 'washer3.png', 'washer3_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '세탁기', 'LG', 'LG 통돌이', 'T20HVD', 755000, '690X1023X730mm', '세탁용량 : 20kg', 'washer4.png', 'washer4_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '세탁기', '삼성', 'BESPOKE 그랑데 AI', 'WF25B8400KV', 1626000, '686X984X875mm', '세탁용량 : 25kg', 'washer5.png', 'washer5_spec1.png', sysdate, 0 );

--tv
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, 'TV', '삼성', 'Neo QLED 4K TV (55인치)', 'KQ55QNA88AFXKR', 1990000, '1227.4X706.2X26.9mm', '종류 : LED', 'tv1.png', 'tv1_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, 'TV', 'LG', 'LG OLED evo TV (83인치)', 'OLED83G2KNA', 11505000, '1847X1052X28mm', '종류 : OLED', 'tv2.png', 'tv2_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, 'TV', 'LG', 'LG 울트라 HD TV (75인치)', '75UQ8300ENA', 2685000, '1678X964X59.9mm', '종류 : LED', 'tv3.png', 'tv3_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, 'TV', 'LG', 'LG QNED TV (86인치)', '86QNED80KQA', 3520000, '218.44cm', '종류 : LED', 'tv4.png', 'tv4_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, 'TV', '삼성', '2022 Crystal UHD TV', 'KU85UB8070FXKR', 1682000, '1900.9X1086.2X26.9mm', '종류 : QLED', 'tv5.png', 'tv5_spec1.png', sysdate, 0 );

--ac
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '에어컨', '삼성', '무풍에어컨 클래식 청정', 'AF17A7972RFRT', 2099000, '(363X1883X330mm)+(820X345X215mm)', '냉방면적 : (56.9㎡)+(18.7㎡)', 'ac1.png', 'ac1_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '에어컨', '삼성', 'BESPOKE 무풍에어컨 갤러리', 'AF18AX778EZERT', 2549000, '(415X1830X286mm)+(820X299X215mm)', '냉방면적 : (58.5 ㎡ + 18.7 ㎡)', 'ac2.png', 'ac2_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '에어컨', 'LG', 'LG 휘센 듀얼에어컨 (빅토리)', 'FQ17VCDWC2', 1850000, '(390X1870X332mm)+(870X650X330mm)', '냉방면적 : (56.9㎡)+(18.7㎡)', 'ac3.png', 'ac3_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '에어컨', '위니아', '위니아 2in1 둘레바람 에어컨', 'WPVW17GDSGQM', 2250000, '(390X1892X378mm)+(870X680X300mm)', '냉방면적 : (56.9㎡)+(22.8㎡)', 'ac4.png', 'ac4_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '에어컨', '삼성', 'BESPOKE 무풍에어컨 체온풍', 'AF19BX890NFRS', 4434000, '(415X1910X309mm)+(820X345X215mm)', '냉방면적 : (62.6㎡)+(18.7㎡)', 'ac5.png', 'ac5_spec1.png', sysdate, 0 );

-- pc
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '컴퓨터', 'LG', 'LG gram 16', '16Z90Q-EA5WK', 2340000, '356X244X16.8mm', '무게 : 약 1190g', 'pc1.png', 'pc1_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '컴퓨터', '삼성', 'Galaxy Book2 Pro', 'NT950XEV-G51A', 2148000, '355.4X225.8X13.3mm', '무게 : 1.17kg', 'pc2.png', 'pc2_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '컴퓨터', '애플', 'MacBook Pro 14', 'MKGR3KH/A', 2690000, '35.97cm(14.2인치)', '무게 : 1.6kg', 'pc3.png', 'pc3_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '컴퓨터', 'LG', 'LG UItraGear 노트북', '17U70P-PA7DK', 2240000, '381X274X19.9mm', '무게 : 약 1950g', 'pc4.png', 'pc4_spec1.png', sysdate, 0 );
INSERT INTO GOODS
VALUES (seq_gidx.nextVal, '컴퓨터', 'LG', 'LG 울트라 PC', '15U40Q-GR3DK', 920000, '359X237X19.1mm', '무게 : 약 1750g', 'pc5.png', 'pc5_spec1.png', sysdate, 0 );

SELECT * FROM ADMIN;
SELECT * FROM SERVICE ;
SELECT * FROM MEMBERS;
SELECT * FROM GOODS;
SELECT * FROM CART;
SELECT * FROM ORDERS;