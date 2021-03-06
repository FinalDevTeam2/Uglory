SELECT * FROM FARM;

CREATE TABLE "FARM" (
   "FARM_NO"   NUMBER      NOT NULL,
   "FARM_NM"   VARCHAR2(100)      NOT NULL,
   "PRODUCER"   VARCHAR2(30)      NOT NULL,
   "ORIGIN"   VARCHAR2(100)      NOT NULL
);

INSERT INTO FARM VALUES(
    SEQ_FARM_NO.NEXTVAL, '옥수수농장', '옥수수쿵야', '초당마을' 
);

CREATE TABLE "MEMBER" (
   "MEMBER_NO"   NUMBER      NOT NULL,
   "MEMBER_NAME"   VARCHAR2(20)      NOT NULL,
   "MEMBER_EMAIL"   VARCHAR2(50)      NOT NULL,
   "MEMBER_ST"   CHAR(1)   DEFAULT 'N'   NOT NULL,
   "SECESSION_CNT"   VARCHAR2(100)      NULL
);

INSERT INTO MEMBER VALUES(
    SEQ_MEMBER_NO.NEXTVAL, '김민규', 'kmg@uglory.com', DEFAULT, NULL
);

SELECT * FROM MEMBER ORDER BY 1;


-- 구독 상품(SUBS)
INSERT INTO SUBS VALUES('1', '스탠다드', '15500'); 
INSERT INTO SUBS VALUES('2', '점보', '25000'); 

-- 구독 상품 주문(SUBS_ORDER)
INSERT INTO SUBS_ORDER VALUES(
   SEQ_S_ORDER_CD.NEXTVAL, DEFAULT, DEFAULT, '김민규', 
   '01017171717', '우리집', '빨리조심',
   SYSDATE, DEFAULT, '2', 1, '1'
);

SELECT * FROM SUBS_ORDER;

-- 회원 목록 조회
SELECT M.MEMBER_NO, M.MEMBER_EMAIL, M.MEMBER_NAME, S.S_CANCEL, M.MEMBER_ST
FROM MEMBER M
LEFT JOIN SUBS_ORDER S
ON M.MEMBER_NO = S.MEMBER_NO
WHERE MEMBER_ST IN ('N', 'P')
ORDER BY 1;

SELECT * FROM MEMBER;

ALTER TABLE ADMIN
MODIFY ADMIN_PW VARCHAR(100);

-- 농장 테이블 컬럼 추가
ALTER TABLE FARM
ADD FARM_ST CHAR(1) DEFAULT 'Y';

UPDATE FARM SET
FARM_ST = 'Y';

ALTER TABLE FARM
MODIFY FARM_ST NOT NULL;

COMMENT ON COLUMN FARM.FARM_ST IS '농장 등록 상태';

-- MEMBER 상태 변경
UPDATE MEMBER 
SET MEMBER_ST ='N' 
WHERE MEMBER_NO = 3;

SELECT * FROM MEMBER ORDER BY 1;



-- 주문별 옵션 테이블 컬럼 삭제
ALTER TABLE OPTION_TB DROP COLUMN P_ORDER_CD;

-- 회원 목록 검색
SELECT M.MEMBER_NO, M.MEMBER_EMAIL, M.MEMBER_NAME, S.S_CANCEL, M.MEMBER_ST
FROM MEMBER M
LEFT JOIN SUBS_ORDER S
ON M.MEMBER_NO = S.MEMBER_NO
WHERE MEMBER_ST IN ('N', 'P')
AND MEMBER_NAME LIKE '%이%'
ORDER BY MEMBER_NO;


SELECT DISTINCT M.MEMBER_NO, M.MEMBER_EMAIL, M.MEMBER_NAME, S.S_CANCEL, M.MEMBER_ST
FROM MEMBER M
JOIN SUBS_ORDER S
ON M.MEMBER_NO = S.MEMBER_NO
WHERE MEMBER_ST IN ('N', 'P')
ORDER BY 1;

SELECT DISTINCT M.MEMBER_NO, M.MEMBER_EMAIL, M.MEMBER_NAME, M.MEMBER_ST, (SELECT COUNT(*) FROM SUBS_ORDER WHERE S.MEMBER_NO = M.MEMBER_NO) S_CANCEL
FROM MEMBER M
LEFT JOIN SUBS_ORDER S
ON M.MEMBER_NO = S.MEMBER_NO
WHERE MEMBER_ST IN ('N', 'P')
ORDER BY 1;

SELECT COUNT(*) FROM SUBS_ORDER WHERE MEMBER_NO = 7;






-- 농장
ALTER SEQUENCE SEQ_FARM_NO NOCACHE;

SELECT * FROM FARM;
UPDATE FARM 
SET FARM_NM = '감자 농장', PRODUCER = '감사합니다', ORIGIN = '뿌리채소 마을' WHERE FARM_NO = 2;


-- 농장(FARM) SAMPLE DATA
INSERT INTO FARM VALUES(
    SEQ_FARM_NO.NEXTVAL, '당근 농장', '바니바니', '뿌리채소 마을'
);

INSERT INTO FARM VALUES(
    SEQ_FARM_NO.NEXTVAL, '감자 농장', '감사합니다', '뿌리채소 마을'
);

INSERT INTO FARM VALUES(
    SEQ_FARM_NO.NEXTVAL, '토마토 농장', '멋쟁이', '열매채소 마을', DEFAULT
);

-- 상품 카테고리 
ALTER SEQUENCE SEQ_P_CATEGORY_NO NOCACHE;

SELECT * FROM P_CATEGORY;

UPDATE P_CATEGORY SET P_CATEGORY_NM = '근채류' WHERE P_CATEGORY_NO = 1;
UPDATE P_CATEGORY SET P_CATEGORY_NM = '곡식류/견과류' WHERE P_CATEGORY_NO = 2;
UPDATE P_CATEGORY SET P_CATEGORY_NM = '채소류' WHERE P_CATEGORY_NO = 3;
UPDATE P_CATEGORY SET P_CATEGORY_NM = '과채류' WHERE P_CATEGORY_NO = 4;
UPDATE P_CATEGORY SET P_CATEGORY_NM = '나물류' WHERE P_CATEGORY_NO = 5;
UPDATE P_CATEGORY SET P_CATEGORY_NM = '버섯류' WHERE P_CATEGORY_NO = 6;
UPDATE P_CATEGORY SET P_CATEGORY_NM = '과일류' WHERE P_CATEGORY_NO = 7;

-- 상품 카테고리 샘플 데이터
INSERT INTO P_CATEGORY VALUES(
    SEQ_P_CATEGORY_NO.NEXTVAL, '근채류'
);
INSERT INTO P_CATEGORY VALUES(
    SEQ_P_CATEGORY_NO.NEXTVAL, '곡식류/견과류'
);
INSERT INTO P_CATEGORY VALUES(
    SEQ_P_CATEGORY_NO.NEXTVAL, '채소류'
);
INSERT INTO P_CATEGORY VALUES(
    SEQ_P_CATEGORY_NO.NEXTVAL, '과채류'
);
INSERT INTO P_CATEGORY VALUES(
    SEQ_P_CATEGORY_NO.NEXTVAL, '나물류'
);
INSERT INTO P_CATEGORY VALUES(
    SEQ_P_CATEGORY_NO.NEXTVAL, '버섯류'
);
INSERT INTO P_CATEGORY VALUES(
    SEQ_P_CATEGORY_NO.NEXTVAL, '과일류'
);





-- 상품 샘플데이터
INSERT INTO PRODUCT VALUES(1, 1, 1, '감자', '10000', 'I', NULL, SYSDATE, NULL);
INSERT INTO PRODUCT VALUES(2, 1, 1, '당근', '10000', 'I', NULL, SYSDATE, NULL);
INSERT INTO PRODUCT VALUES(3, 1, 1, '고구마', '10000', 'I', NULL, SYSDATE, NULL);
INSERT INTO PRODUCT VALUES(4, 1, 1, '우엉', '10000', 'I', NULL, SYSDATE, NULL);
INSERT INTO PRODUCT VALUES(5, 1, 1, '무', '10000', 'I', NULL, SYSDATE, NULL);
INSERT INTO PRODUCT VALUES(6, 1, 1, '연근', '10000', 'I', NULL, SYSDATE, NULL);

-- P_CATEGORY = 2
INSERT INTO PRODUCT VALUES(7, 1, 1, '서리태', '10000', 'I', NULL, SYSDATE, NULL);
INSERT INTO PRODUCT VALUES(8, 1, 1, '밤', '10000', 'I', NULL, SYSDATE, NULL);

UPDATE PRODUCT SET P_CATEGORY_NO = 2 WHERE P_CD IN (7,8);

INSERT INTO PRODUCT VALUES(9, 7, 2, '자두', '10000', DEFAULT, NULL, SYSDATE, NULL);

SELECT * FROM PRODUCT;

-- 옵션 종류 샘플데이터
INSERT INTO OPTION_TYPE VALUES(SEQ_OPTION_CD.NEXTVAL, 1, '1.5kg', 3000);
INSERT INTO OPTION_TYPE VALUES(SEQ_OPTION_CD.NEXTVAL, 1, '3kg', 6000);

INSERT INTO OPTION_TYPE VALUES(SEQ_OPTION_CD.NEXTVAL, 9, '2kg', 4000);

INSERT INTO OPTION_TYPE VALUES(SEQ_OPTION_CD.NEXTVAL, 3, '5kg', 7000);
INSERT INTO OPTION_TYPE VALUES(SEQ_OPTION_CD.NEXTVAL, 3, '7.5kg', 10500);

SELECT * FROM OPTION_TYPE;
SELECT * FROM OPTION_TB;

SELECT * FROM PRODUCT_ORDER;

SELECT * FROM PRODUCT;
SELECT * FROM MEMBER;
SELECT * FROM PRODUCT_DELIVERY;

INSERT INTO OPTION_TB VALUES(SEQ_OPTION_NO.NEXTVAL, 41, 3, 21);
INSERT INTO OPTION_TB VALUES(SEQ_OPTION_NO.NEXTVAL, 42, DEFAULT, 22);

INSERT INTO PRODUCT_ORDER VALUES(SEQ_P_ORDER_CD.NEXTVAL, SYSDATE, '이지훈', '01017171717', '우리집', 31000, '호박고구마가 좋아요', '3000', DEFAULT, 9, 1);
INSERT INTO PRODUCT_ORDER VALUES(SEQ_P_ORDER_CD.NEXTVAL, SYSDATE, '권순영', '01017171717', '걔네집', 20500, '전 밤고구마가 좋아요', '3000', DEFAULT, 3, 1);


-- 주문별 선택 옵션 샘플데이터
INSERT INTO OPTION_TB VALUES(SEQ_OPTION_NO.NEXTVAL, 1, DEFAULT);
INSERT INTO OPTION_TB VALUES(SEQ_OPTION_NO.NEXTVAL, 3, DEFAULT);
SELECT * FROM OPTION_TB;



-- 장바구니 샘플데이터
INSERT INTO CART VALUES(SEQ_CART_NO.NEXTVAL, 1, 1);
INSERT INTO CART VALUES(SEQ_CART_NO.NEXTVAL, 1, 2);
SELECT * FROM CART;

-- 개별 상품 주문 샘플데이터
INSERT INTO PRODUCT_ORDER VALUES(
   SEQ_P_ORDER_CD.NEXTVAL, SYSDATE, '김민규', '01017171717', '우리집', '3000', 
   '빨리!', '3000', DEFAULT, 1, 2, 1);

INSERT INTO PRODUCT_ORDER VALUES(
   SEQ_P_ORDER_CD.NEXTVAL, SYSDATE, '김민규', '01017171717', '우리집', '24000', 
   '빨리!', '3000', 'Y', 1, 2, 2);

SELECT * FROM PRODUCT_ORDER;

-- 배송 상태 샘플데이터
INSERT INTO PRODUCT_DELIVERY VALUES(1, '배송 전');
INSERT INTO PRODUCT_DELIVERY VALUES(2, '배송 중');
INSERT INTO PRODUCT_DELIVERY VALUES(3, '배송 완');

SELECT * FROM PRODUCT_DELIVERY;

-- 리뷰 게시판 종류 샘플데이터
SELECT * FROM REVIEW_TYPE;
INSERT INTO REVIEW_TYPE VALUES(1);
INSERT INTO REVIEW_TYPE VALUES(2);

-- 리뷰 샘플데이터
INSERT INTO REVIEW VALUES(
   SEQ_REVIEW_NO.NEXTVAL, '세상이 끝나더라도 이 자두를 심겠습니당!', SYSDATE, '5', 1, 
   9, 2, NULL, 2);

INSERT INTO REVIEW VALUES(
   SEQ_REVIEW_NO.NEXTVAL, '스탠다드 박스는 종류나 양이 많지 않네요 아쉽습니다', SYSDATE, '3', 1,
   NULL, NULL, 3, 1);

SELECT * FROM REVIEW;


-- 구독 상품 샘플데이터
SELECT * FROM SUBS;
UPDATE SUBS SET S_PRICE = '15500' WHERE S_CD = 1;
UPDATE SUBS SET S_PRICE = '25000' WHERE S_CD = 2;

-- 구독 상품 주문 샘플데이터
SELECT * FROM SUBS_ORDER;
UPDATE SUBS_ORDER SET S_REVIEW_ST = 'Y' WHERE MEMBER_NO = 1;

-- 회원 상태 조회
SELECT MEMBER_ST
FROM MEMBER
WHERE MEMBER_ST IN ('N', 'P')
AND MEMBER_NO = 1;




-- 회원 테이블 탈퇴사유 DROP 구문
ALTER TABLE MEMBER
DROP COLUMN SECESSION_CNT;


-- 구독 결제 샘플데이터
INSERT INTO SUBS_PAY VALUES(
    SEQ_S_PAY_NO.NEXTVAL, DEFAULT, 15500, 1, 3);

-- 상품 결제 샘플데이터
INSERT INTO PRODUCT_PAY VALUES(
    SEQ_P_PAY_NO.NEXTVAL, DEFAULT, 6000, 1, 1
);

INSERT INTO PRODUCT_PAY VALUES(
    SEQ_P_PAY_NO.NEXTVAL, DEFAULT, 27000, 1, 2
);


-- 결제 관리 조회
SELECT S.S_PAY_NO AS PAY_NO, SO.S_ORDER_CD AS ORDER_CD, M.MEMBER_EMAIL, S.S_PAY_AMOUNT AS PAY_AMOUNT, TO_CHAR(S.S_PAY_DT, 'YYYY-MM-DD HH24:MI:SS') AS PAY_DT, '1' SORT
FROM SUBS_PAY S
JOIN SUBS_ORDER SO ON S.S_ORDER_CD = SO.S_ORDER_CD
JOIN MEMBER M ON S.MEMBER_NO = M.MEMBER_NO

UNION ALL

SELECT P.P_PAY_NO AS PAY_NO, PO.P_ORDER_CD AS ORDER_CD, M.MEMBER_EMAIL, P.P_PAY_AMOUNT AS PAY_AMOUNT, TO_CHAR(P.P_PAY_DT, 'YYYY-MM-DD HH24:MI:SS') AS PAY_DT, '2' SORT
FROM PRODUCT_PAY P
JOIN PRODUCT_ORDER PO ON P.P_ORDER_CD = PO.P_ORDER_CD
LEFT JOIN PRODUCT_REFUND PR ON PO.P_ORDER_CD = PR.P_ORDER_CD 
JOIN MEMBER M ON P.MEMBER_NO = M.MEMBER_NO
WHERE PR.P_ORDER_CD IS NULL
ORDER BY PAY_DT DESC;

		SELECT S.S_PAY_NO AS PAY_NO, M.MEMBER_NAME, TO_CHAR(S.S_PAY_DT, 'YYYY-MM-DD HH24:MI:SS') AS PAY_DT, '1' SORT
		FROM SUBS_PAY S
		JOIN MEMBER M ON S.MEMBER_NO = M.MEMBER_NO
		
		UNION ALL
		
		SELECT P.P_PAY_NO AS PAY_NO, M.MEMBER_NAME, TO_CHAR(P.P_PAY_DT, 'YYYY-MM-DD HH24:MI:SS') AS PAY_DT, '2' SORT
		FROM PRODUCT_PAY P
		JOIN PRODUCT_ORDER PO ON P.P_ORDER_CD = PO.P_ORDER_CD
		LEFT JOIN PRODUCT_REFUND PR ON PO.P_ORDER_CD = PR.P_ORDER_CD 
		JOIN MEMBER M ON P.MEMBER_NO = M.MEMBER_NO
		WHERE PR.P_ORDER_CD IS NULL
		ORDER BY PAY_DT DESC;



-- 결제 관리 검색 내역 조회
SELECT S.S_ORDER_CD AS ORDER_CD, M.MEMBER_EMAIL, S.S_PAY_AMOUNT AS PAY_AMOUNT, S.S_PAY_DT AS PAY_DT
FROM SUBS_PAY S
JOIN MEMBER M ON S.MEMBER_NO = M.MEMBER_NO

UNION ALL

SELECT P.P_ORDER_CD AS ORDER_CD, M.MEMBER_EMAIL, P.P_PAY_AMOUNT AS PAY_AMOUNT, P.P_PAY_DT AS PAY_DT
FROM PRODUCT_PAY P
JOIN MEMBER M ON P.MEMBER_NO = M.MEMBER_NO
ORDER BY PAY_DT DESC;

-- 주문번호 기준 결제 내역 검색 결과 조회
SELECT S.S_ORDER_CD AS ORDER_CD, M.MEMBER_EMAIL, S.S_PAY_AMOUNT AS PAY_AMOUNT, S.S_PAY_DT AS PAY_DT
FROM SUBS_PAY S
JOIN MEMBER M ON S.MEMBER_NO = M.MEMBER_NO
WHERE S.S_ORDER_CD LIKE '%1%'

UNION ALL

SELECT P.P_ORDER_CD AS ORDER_CD, M.MEMBER_EMAIL, P.P_PAY_AMOUNT AS PAY_AMOUNT, P.P_PAY_DT AS PAY_DT
FROM PRODUCT_PAY P
JOIN PRODUCT_ORDER PO ON P.P_ORDER_CD = PO.P_ORDER_CD
LEFT JOIN PRODUCT_REFUND PR ON PO.P_ORDER_CD = PR.P_ORDER_CD 
JOIN MEMBER M ON P.MEMBER_NO = M.MEMBER_NO
WHERE P.P_ORDER_CD LIKE '%1%'
AND PR.P_ORDER_CD IS NULL
ORDER BY PAY_DT DESC;


-- 회원 이메일 기준 결제 내역 검색 결과 조회
SELECT COUNT(*) FROM (SELECT S.S_ORDER_CD AS ORDER_CD, M.MEMBER_EMAIL, S.S_PAY_AMOUNT AS PAY_AMOUNT, S.S_PAY_DT AS PAY_DT
FROM SUBS_PAY S
JOIN MEMBER M ON S.MEMBER_NO = M.MEMBER_NO
WHERE MEMBER_EMAIL LIKE '%gosodkdl@naver.com%'

UNION ALL

SELECT P.P_ORDER_CD AS ORDER_CD, M.MEMBER_EMAIL, P.P_PAY_AMOUNT AS PAY_AMOUNT, P.P_PAY_DT AS PAY_DT
FROM PRODUCT_PAY P
JOIN PRODUCT_ORDER PO ON P.P_ORDER_CD = PO.P_ORDER_CD
LEFT JOIN PRODUCT_REFUND PR ON PO.P_ORDER_CD = PR.P_ORDER_CD 
JOIN MEMBER M ON P.MEMBER_NO = M.MEMBER_NO
WHERE MEMBER_EMAIL LIKE '%gosodkdl@naver.com%'
AND PR.P_ORDER_CD IS NULL
ORDER BY PAY_DT DESC);


-- 날짜 기준 결제 내역 검색 결과 조회
SELECT S.S_ORDER_CD AS ORDER_CD, M.MEMBER_EMAIL, S.S_PAY_AMOUNT AS PAY_AMOUNT, TO_CHAR(S.S_PAY_DT, 'YYYY-MM-DD') AS PAY_DT
FROM SUBS_PAY S
JOIN MEMBER M ON S.MEMBER_NO = M.MEMBER_NO
WHERE S.S_PAY_DT BETWEEN TO_DATE('20220714', 'YYYY/MM/DD') AND TO_DATE('20220714', 'YYYY/MM/DD') + 0.99999

UNION ALL

SELECT P.P_ORDER_CD AS ORDER_CD, M.MEMBER_EMAIL, P.P_PAY_AMOUNT AS PAY_AMOUNT, TO_CHAR(P.P_PAY_DT, 'YYYY-MM-DD') AS PAY_DT
FROM PRODUCT_PAY P
JOIN PRODUCT_ORDER PO ON P.P_ORDER_CD = PO.P_ORDER_CD
LEFT JOIN PRODUCT_REFUND PR ON PO.P_ORDER_CD = PR.P_ORDER_CD 
JOIN MEMBER M ON P.MEMBER_NO = M.MEMBER_NO
WHERE P.P_PAY_DT BETWEEN TO_DATE('20220714', 'YYYY/MM/DD') AND TO_DATE('20220714', 'YYYY/MM/DD') + 0.99999
AND PR.P_ORDER_CD IS NULL
ORDER BY PAY_DT DESC;





-- 주문번호를 기준으로 주문자 이름, 이메일, 결제금액, 결제일, 배송지, 배송일(주문일), 배송상태, 배송 요청사항 조회 ... 뻘짓?...ㅠ
SELECT * 
FROM 
    (SELECT SP.S_ORDER_CD AS ORDER_CD, 
            M.MEMBER_EMAIL, 
            M.MEMBER_NAME,
            SP.S_PAY_AMOUNT AS PAY_AMOUNT, 
            SP.S_PAY_DT AS PAY_DT,
            SO.S_ORDER_ADDR AS ORDER_ADDR,
            S_DELIVERY_DT AS ORDER_DT,
            SO.S_DL_REQ AS DL_REQ,
            PD.DELIVERY_ST AS DELIVERY_ST
    FROM SUBS_PAY SP
    JOIN MEMBER M ON SP.MEMBER_NO = M.MEMBER_NO
    JOIN SUBS_ORDER SO ON SP.S_ORDER_CD = SO.S_ORDER_CD
    JOIN SUBS_DELIVERY SD ON SO.S_ORDER_CD = SD.S_ORDER_CD
    JOIN PRODUCT_DELIVERY PD ON SD.DELIVERY_CD = PD.DELIVERY_CD

    UNION ALL

    SELECT  PP.P_ORDER_CD AS ORDER_CD, 
            M.MEMBER_EMAIL,
            M.MEMBER_NAME, 
            PP.P_PAY_AMOUNT AS PAY_AMOUNT, 
            PP.P_PAY_DT AS PAY_DT, 
            PO.P_ORDER_ADDR AS ORDER_ADDR, 
            PO.P_ORDER_DT AS ORDER_DT,
            PO.P_DL_REQ AS DL_REQ,
            PD.DELIVERY_ST AS DELIVERY_ST
    FROM PRODUCT_PAY PP
    JOIN MEMBER M ON PP.MEMBER_NO = M.MEMBER_NO
    JOIN PRODUCT_ORDER PO ON PP.P_ORDER_CD = PO.P_ORDER_CD
    JOIN PRODUCT_DELIVERY PD ON PD.DELIVERY_CD = PO.DELIVERY_CD
    JOIN OPTION_TB OP ON PO.P_ORDER_CD = OP.P_ORDER_CD


    ORDER BY PAY_DT DESC)

WHERE ORDER_CD = ?;




-- 개별 여부 확인 
SELECT COUNT(*) 
FROM PRODUCT_ORDER
WHERE P_ORDER_CD = 1;

-- 만약 개별 여부 확인 결과가 1이면 개별 상품 조회, 
SELECT  P_ORDER_CD, MEMBER_NAME, MEMBER_EMAIL, P_PAY_AMOUNT,
        P_PAY_DT, P_ORDER_ADDR, P_ORDER_DT, 
        P_DL_REQ, DELIVERY_ST, OPTION_NM, PRODUCT_NM
FROM PRODUCT_PAY
JOIN MEMBER USING(MEMBER_NO)
JOIN PRODUCT_ORDER USING (P_ORDER_CD)
JOIN PRODUCT_DELIVERY USING (DELIVERY_CD)
JOIN OPTION_TB USING(P_ORDER_CD)
JOIN OPTION_TYPE USING(OPTION_CD)
JOIN PRODUCT USING(P_CD)
WHERE P_ORDER_CD = 1;

--결과가 0이면 
-- 구독 여부 확인
SELECT COUNT(*)
FROM SUBS_ORDER
WHERE S_ORDER_CD = ?;

SELECT  S_ORDER_CD, MEMBER_NAME, MEMBER_EMAIL, S_PAY_AMOUNT, S_PAY_DT, S_ORDER_ADDR, 
        S_DELIVERY_DT, DELIVERY_ST, S_DL_REQ, S_NM, S_CYCLE,
        (SELECT LISTAGG(PRODUCT_NM, ',') WITHIN GROUP (ORDER BY S_ORDER_CD)
        FROM SUBS_ORDER 
        JOIN SUBS_EXCEPTION USING(S_ORDER_CD)
        JOIN PRODUCT USING(P_CD)
        WHERE S_ORDER_CD = 'J20220725-00138') PRODUCT_NM
FROM SUBS_PAY
JOIN MEMBER USING(MEMBER_NO)
JOIN SUBS_DELIVERY USING(S_ORDER_CD)
JOIN SUBS_ORDER USING(S_ORDER_CD)
JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
JOIN SUBS USING(S_CD)
WHERE S_ORDER_CD = 'J20220725-00138';

SELECT * FROM SUBS_PAY WHERE S_ORDER_CD = 'J20220725-00138';

-- 결과가 1이면 구독 상품 조회, 결과가 0일리는 없음 (아마두)
-- 구독 관련 조회
SELECT  S_ORDER_CD, MEMBER_NAME, MEMBER_EMAIL, S_PAY_AMOUNT, S_PAY_DT, S_ORDER_ADDR, 
        S_DELIVERY_DT, DELIVERY_ST, S_DL_REQ, S_NM, S_CYCLE,
        (SELECT LISTAGG(PRODUCT_NM, ', ') WITHIN GROUP (ORDER BY S_ORDER_CD)
        FROM SUBS_ORDER 
        JOIN SUBS_EXCEPTION USING(S_ORDER_CD)
        JOIN PRODUCT USING(P_CD)
        WHERE S_ORDER_CD = 3) PRODUCT_NM
FROM SUBS_PAY
JOIN MEMBER USING(MEMBER_NO)
JOIN SUBS_DELIVERY USING(S_ORDER_CD)
JOIN SUBS_ORDER USING(S_ORDER_CD)
JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
JOIN SUBS USING(S_CD)
WHERE S_ORDER_CD = 3;

-- LISTAGG(team, '/') WITHIN GROUP (ORDER BY team desc)
-- 제외 품목명만 나오는 sql
SELECT LISTAGG(PRODUCT_NM, ',') WITHIN GROUP (ORDER BY S_ORDER_CD)
FROM SUBS_ORDER 
JOIN SUBS_EXCEPTION USING(S_ORDER_CD)
JOIN PRODUCT USING(P_CD)
WHERE S_ORDER_CD = 3;

SELECT S_ORDER_CD, PRODUCT_NM
FROM SUBS_ORDER 
JOIN SUBS_EXCEPTION USING(S_ORDER_CD)
JOIN PRODUCT USING(P_CD)
WHERE S_ORDER_CD = 3;


-- 이미지 리스트 조회했던 것처럼 resultMap에 collection태그 써서!!! (주문 번호 기준으로)
SELECT P_PAY_NO AS PAY_NO, OPTION_NM, PRODUCT_NM, OPTION_COUNT
FROM PRODUCT_PAY
JOIN PRODUCT_ORDER USING(P_ORDER_CD)
JOIN OPTION_TB USING(P_ORDER_CD)
JOIN OPTION_TYPE USING(OPTION_CD)
JOIN PRODUCT USING(P_CD)
WHERE P_PAY_NO = '220725154645-1';


SELECT  P_PAY_NO, P_ORDER_CD, MEMBER_NAME, MEMBER_EMAIL, P_PAY_AMOUNT,
        P_PAY_DT, P_ORDER_ADDR, P_ORDER_DT, 
        P_DL_REQ, DELIVERY_ST
FROM PRODUCT_PAY
JOIN MEMBER USING(MEMBER_NO)
JOIN PRODUCT_ORDER USING (P_ORDER_CD)
JOIN PRODUCT_DELIVERY USING (DELIVERY_CD)
WHERE P_PAY_NO = '220725154645-1';

SELECT  P_ORDER_CD, MEMBER_NAME, MEMBER_EMAIL, P_PAY_AMOUNT,
        P_PAY_DT, P_ORDER_ADDR, P_ORDER_DT, 
        P_DL_REQ, DELIVERY_ST, OPTION_NM, PRODUCT_NM
FROM PRODUCT_PAY
JOIN MEMBER USING(MEMBER_NO)
JOIN PRODUCT_ORDER USING (P_ORDER_CD)
JOIN PRODUCT_DELIVERY USING (DELIVERY_CD)
JOIN OPTION_TB USING(P_ORDER_CD)
JOIN OPTION_TYPE USING(OPTION_CD)
JOIN PRODUCT USING(P_CD)
WHERE P_ORDER_CD = 1;


SELECT  P_ORDER_CD, P_PAY_NO, MEMBER_NAME, MEMBER_EMAIL, P_PAY_AMOUNT,
        P_PAY_DT, P_ORDER_ADDR, P_ORDER_DT, 
        P_DL_REQ, DELIVERY_ST
FROM PRODUCT_PAY
JOIN MEMBER USING(MEMBER_NO)
JOIN PRODUCT_ORDER USING (P_ORDER_CD)
JOIN PRODUCT_DELIVERY USING (DELIVERY_CD)
WHERE P_PAY_NO = '220725154645-1';



-- 개별상품 결제 상세 조회(1)
SELECT P_ORDER_CD, MEMBER_NAME, MEMBER_EMAIL, P_PAY_AMOUNT, P_PAY_DT
FROM PRODUCT_PAY
JOIN MEMBER USING(MEMBER_NO)
WHERE P_ORDER_CD = 1;

-- 개별상품 결제 상세 조회(2)
SELECT P_ORDER_ADDR, P_ORDER_DT, DELIVERY_ST, P_DL_REQ
FROM PRODUCT_ORDER
JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
WHERE P_ORDER_CD = 1;

SELECT S_ORDER_ADDR, S_DELIVERY_DT, DELIVERY_ST, S_DL_REQ
FROM SUBS_DELIVERY
JOIN SUBS_ORDER USING(S_ORDER_CD)
JOIN PRODUCT_DELIVERY USING(DELIVERY_CD);

-- 개별상품 결제 상세 조회(3)
SELECT PRODUCT_NM, OPTION_NM
FROM PRODUCT_ORDER
JOIN CART USING(CART_NO)
JOIN OPTION_TB USING(OPTION_NO)
JOIN OPTION_TYPE USING(OPTION_CD)
JOIN PRODUCT USING(P_CD)
WHERE P_ORDER_CD = 1;


-- 구독 결제 상세 조회(1)
SELECT S_ORDER_CD, MEMBER_NAME, MEMBER_EMAIL, S_PAY_AMOUNT, S_PAY_DT
FROM SUBS_PAY
JOIN MEMBER USING(MEMBER_NO);

-- 구독 결제 상세 조회(2)
SELECT S_ORDER_ADDR, S_DELIVERY_DT, DELIVERY_ST, S_DL_REQ
FROM SUBS_DELIVERY
JOIN SUBS_ORDER USING(S_ORDER_CD)
JOIN PRODUCT_DELIVERY USING(DELIVERY_CD);

-- 구독 결제 상세 조회(3)
SELECT S_NM, S_CYCLE
FROM SUBS_ORDER
JOIN SUBS USING(S_CD)
JOIN SUBS_EXCEPTION USING(S_ORDER_CD)
WHERE S_ORDER_CD = 3;


SELECT P_CD
FROM SUBS_ORDER
JOIN SUBS USING(S_CD)
JOIN SUBS_EXCEPTION USING(S_ORDER_CD)
WHERE S_ORDER_CD = 3;

SELECT P_CD FROM SUBS_EXCEPTION WHERE S_ORDER_CD = 3;


-- 구독 배송 조회 및 샘플데이터 삽입
SELECT * FROM SUBS_DELIVERY;
INSERT INTO SUBS_DELIVERY VALUES(
    SEQ_S_DELIVERY_CD.NEXTVAL, TO_DATE('20220718', 'YYYY-MM-DD'), 2, 3
);


-- 구독 제외 상품 샘플데이터 삽입
INSERT INTO SUBS_EXCEPTION VALUES(5,3);
INSERT INTO SUBS_EXCEPTION VALUES(7,3);

SELECT * FROM PRODUCT;
SELECT * FROM SUBS_ORDER;





-- 구독 결제, 개별상품 결제 조회
SELECT * FROM SUBS_PAY;
SELECT * FROM SUBS_ORDER;

SELECT * FROM PRODUCT_PAY;
SELECT * FROM PRODUCT_ORDER;

-- 상품 이미지 테이블 컬럼 이름 변경
ALTER TABLE PRODUCT_IMG
RENAME COLUMN PRODUCT_IMG TO P_IMG_NO;

-- 날짜 출력 방식 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
SELECT SYSDATE FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';



SELECT * FROM PRODUCT_ORDER;

SELECT * FROM OPTION_TYPE;
SELECT * FROM OPTION_TB;

-- 개별 상품 주문 테이블에서 장바구니 코드 삭제
ALTER TABLE PRODUCT_ORDER
DROP COLUMN CART_NO;

-- OPTION_TB 에 주문코드(P_ORDER_CD) 추가
ALTER TABLE OPTION_TB
ADD P_ORDER_CD VARCHAR2(20);

-- OPTION_TB 테이블의 P_ORDER_CD 컬럼에 제약조건(NOT NULL) 추가를 위한 데이터 삽입
UPDATE OPTION_TB SET
P_ORDER_CD = 1
WHERE OPTION_NO = 1;

UPDATE OPTION_TB SET
P_ORDER_CD = 2
WHERE OPTION_NO = 2;

-- P_ORDER_CD 컬럼에 NOT NULL, FOREIGN KEY 추가
ALTER TABLE OPTION_TB MODIFY P_ORDER_CD NOT NULL;
ALTER TABLE OPTION_TB ADD FOREIGN KEY(P_ORDER_CD) REFERENCES PRODUCT_ORDER(P_ORDER_CD);

-- 장바구니 테이블 삭제
SELECT * FROM CART;
DELETE FROM CART;
DROP TABLE CART;

-- 장바구니 테이블 생성
CREATE TABLE CART(
    MEMBER_NO NUMBER NOT NULL,
    OPTION_NO NUMBER NOT NULL
);

ALTER TABLE CART ADD CONSTRAINT "PK_CART" PRIMARY KEY (
	MEMBER_NO,
	OPTION_NO
);

INSERT INTO CART VALUES(1, 2);
SELECT * FROM CART;



-- 멤버 테이블 탈퇴 시간 컬럼 추가
ALTER TABLE MEMBER ADD SECESSION_DT DATE;


--회원 탈퇴 사유 테이블 생성
CREATE TABLE "SECESSION_CNT" (
   "SECESSION_CD"   NUMBER   NOT NULL,
   "SECESSION_CNT"   VARCHAR2(200)   NOT NULL
);

--MEMBER 테이블에 SECESSION_CD 추가
ALTER TABLE MEMBER ADD (SECESSION_CD NUMBER); 

--제약조건 추가
ALTER TABLE "SECESSION_CNT" ADD CONSTRAINT "PK_SECESSION_CNT" PRIMARY KEY (
   "SECESSION_CD"
);

--컬럼 추가
COMMENT ON COLUMN "SECESSION_CNT"."SECESSION_CD" IS '회원 탈퇴 코드';
COMMENT ON COLUMN "SECESSION_CNT"."SECESSION_CNT" IS '회원 탈퇴 사유 내용';

--사유  샘플테이블 
INSERT INTO SECESSION_CNT VALUES(1, '더 이상 서비스가 필요하지 않아요.');
INSERT INTO SECESSION_CNT VALUES(2, '서비스가 마음에 들지 않아요.');
INSERT INTO SECESSION_CNT VALUES(3, '구독료가 부담스러워요.');
INSERT INTO SECESSION_CNT VALUES(4, '비밀!!');
SELECT * FROM SECESSION_CNT;




-- 리뷰 전체 조회 
SELECT REVIEW_NO, REVIEW_ENROLL_DT, MEMBER_NAME, REVIEW_CONTENT
FROM REVIEW
JOIN MEMBER USING(MEMBER_NO)
WHERE REVIEW_CD IN (1,2)
ORDER BY REVIEW_ENROLL_DT DESC;

-- 리뷰 테이블 등록일 컬럼 설정 변경
ALTER TABLE REVIEW MODIFY REVIEW_ENROLL_DT DEFAULT SYSDATE;


-- 리뷰 검색 조회(회원 이름 기준)
SELECT REVIEW_NO, REVIEW_ENROLL_DT, MEMBER_NAME, REVIEW_CONTENT
FROM REVIEW
JOIN MEMBER USING(MEMBER_NO)
WHERE MEMBER_NAME LIKE '%김%'
AND REVIEW_CD IN (1,2)
ORDER BY REVIEW_ENROLL_DT DESC;

-- 리뷰 검색 조회(작성일 기준)
SELECT REVIEW_NO, REVIEW_ENROLL_DT, MEMBER_NAME, REVIEW_CONTENT
FROM REVIEW
JOIN MEMBER USING(MEMBER_NO)
WHERE REVIEW_ENROLL_DT BETWEEN TO_DATE('20220714', 'YYYY/MM/DD') AND TO_DATE('20220714', 'YYYY/MM/DD') + 0.99999
AND REVIEW_CD IN (1,2)
ORDER BY REVIEW_ENROLL_DT DESC;



-- 리뷰 번호로 상품명(개별/구독) 조회하기
SELECT CASE WHEN (SELECT REVIEW_CD FROM REVIEW WHERE REVIEW_NO = 2) = 1
            THEN (SELECT S_NM 
                 FROM REVIEW
                 JOIN SUBS_ORDER USING(S_ORDER_CD)
                 JOIN SUBS  USING(S_CD)
                 WHERE REVIEW_NO = 2
                 AND REVIEW_CD)    
        
        ELSE (SELECT PRODUCT_NM 
             FROM REVIEW
             JOIN PRODUCT USING(P_CD)
             WHERE REVIEW_NO = 2)
        END AS PRODUCT_NM
FROM DUAL;


-- REVIEW_NO 기준으로 리뷰 등록일, 글쓴이, 리뷰 내용, 별점, 상품명 얻어오는 SQL 
SELECT REVIEW_ENROLL_DT, MEMBER_NAME, REVIEW_CONTENT, STAR_RATING, 
    (SELECT CASE WHEN (SELECT REVIEW_CD FROM REVIEW WHERE REVIEW_NO = 2) = 1
            THEN (SELECT S_NM 
                 FROM REVIEW
                 JOIN SUBS_ORDER USING(S_ORDER_CD)
                 JOIN SUBS  USING(S_CD)
                 WHERE REVIEW_NO = 2)    
        
        ELSE (SELECT PRODUCT_NM 
             FROM REVIEW
             JOIN PRODUCT USING(P_CD)
             WHERE REVIEW_NO = 2)
        END 
    FROM DUAL) AS PRODUCT_NM
FROM REVIEW
JOIN MEMBER USING(MEMBER_NO)
WHERE REVIEW_NO = 2
AND REVIEW_CD IN (1,2);


-- 리뷰 삭제
UPDATE REVIEW SET REVIEW_CD = (SELECT REVIEW_CD FROM REVIEW WHERE REVIEW_NO = 1) + 2
WHERE REVIEW_NO = 1;






SELECT * FROM PRODUCT_ORDER;
SELECT * FROM REVIEW;

INSERT INTO REVIEW VALUES(
    SEQ_REVIEW_NO.NEXTVAL, '흔들리는 나침반이 답답해도 우리 함께라면 다 알지 못해도 다 알 수 있어요 내 뜻대로 안 되는 하루하루가 안개처럼 흐릿하지만 수많은 길이 내 앞에 있어', 
    SYSDATE, '4', 1, 1, 1, NULL, 2);

SELECT * FROM REVIEW_IMG WHERE REVIEW_NO = 1;

INSERT INTO REVIEW_IMG VALUES(
    SEQ_REVIEW_IMG_NO.NEXTVAL, '/resources/img/review/review_img1.png', 1, 1
);

DELETE FROM REVIEW_IMG;

SELECT * FROM REVIEW;

DROP TABLE REVIEW_TYPE;

UPDATE REVIEW SET REVIEW_CD = 2 WHERE REVIEW_NO = 1;



UPDATE REVIEW SET REVIEW_CD = 1 WHERE REVIEW_NO = 2;
UPDATE REVIEW SET REVIEW_CD = 2 WHERE REVIEW_NO = 21;




-- 당일 매출
SELECT SUM(P_PAY_AMOUNT)
FROM PRODUCT_PAY
WHERE P_PAY_DT BETWEEN TO_DATE('220714', 'YY-MM-DD') AND TO_DATE('220714', 'YY-MM-DD') +0.99999 ;

SELECT SUM(S_PAY_AMOUNT)
FROM SUBS_PAY
WHERE S_PAY_DT BETWEEN TO_DATE('220714', 'YY-MM-DD') AND TO_DATE('220714', 'YY-MM-DD') +0.99999 ;


SELECT SUM(TODAY_PAY_AMOUNT)
FROM(
SELECT SUM(P_PAY_AMOUNT) TODAY_PAY_AMOUNT
FROM PRODUCT_PAY
WHERE P_PAY_DT BETWEEN TO_DATE('220714', 'YY-MM-DD') AND TO_DATE('220714', 'YY-MM-DD') +0.99999

UNION ALL

SELECT SUM(S_PAY_AMOUNT) TODAY_PAY_AMOUNT
FROM SUBS_PAY
WHERE S_PAY_DT BETWEEN TO_DATE('220714', 'YY-MM-DD') AND TO_DATE('220714', 'YY-MM-DD') +0.99999);





-- 최근 1주일 날짜
-- LISTAGG(team, '/') WITHIN GROUP (ORDER BY team desc)
SELECT LISTAGG(DT, ',') WITHIN GROUP (ORDER BY DT)  DT
FROM(  SELECT TO_CHAR(SYSDATE + LEVEL - 7, 'YYYY-MM-DD') DT
        FROM DUAL
        CONNECT BY LEVEL <= 7);
    


-- 구독 합
SELECT SUM(S_PAY_AMOUNT) SUBS
FROM SUBS_PAY
WHERE TO_CHAR(S_PAY_DT, 'YYYY-MM-DD') = '2022-07-14';




-- 상품 합
SELECT SUM(P_PAY_AMOUNT) PROC
FROM PRODUCT_PAY
WHERE TO_CHAR(P_PAY_DT, 'YYYY-MM-DD') = '2022-07-14';


-- 최근 1주일 구독/개별 상품 날짜별 합계
SELECT 
    LISTAGG(DT, ',') WITHIN GROUP (ORDER BY DT)  DT,
    LISTAGG(SUBS, ',') WITHIN GROUP (ORDER BY ROWNUM)  SUBS,
    LISTAGG(PROD, ',') WITHIN GROUP (ORDER BY ROWNUM)  PROD
FROM( 
    SELECT DT,
    NVL( (SELECT SUM(S_PAY_AMOUNT) FROM SUBS_PAY WHERE TO_CHAR(S_PAY_DT, 'YYYY-MM-DD') = A.DT) ,0 ) SUBS,
    NVL(  (SELECT SUM(P_PAY_AMOUNT) FROM PRODUCT_PAY WHERE TO_CHAR(P_PAY_DT, 'YYYY-MM-DD') = A.DT), 0) PROD
    FROM (SELECT TO_CHAR(SYSDATE + LEVEL - 7, 'YYYY-MM-DD') DT
        FROM DUAL
        CONNECT BY LEVEL <= 7)  A
);


-- 최근 6개월 매출 
SELECT PERIOD, (PROD_TOTAL - REFUND_TOTAL) AS PROD_TOTAL, SUBS_TOTAL, "PROD_TOTAL" + "SUBS_TOTAL" - "REFUND_TOTAL" AS TOTAL
FROM (
SELECT TO_CHAR(P_ORDER_DT, 'YYYY-MM') PERIOD, 
    SUM(TOTAL_PRICE) "PROD_TOTAL",
    ( SELECT SUM(S_PAY_AMOUNT) FROM SUBS_PAY
       WHERE TO_CHAR(S_PAY_DT, 'YYYY-MM') = TO_CHAR(P_ORDER_DT, 'YYYY-MM')
     ) "SUBS_TOTAL"
    ,(SELECT SUM( P_REFUND_AMOUNT ) FROM PRODUCT_REFUND
       WHERE TO_CHAR(P_REFUND_DT, 'YYYY-MM')  = TO_CHAR(P_ORDER_DT, 'YYYY-MM')
    ) "REFUND_TOTAL"
    
FROM PRODUCT_ORDER
GROUP BY TO_CHAR(P_ORDER_DT, 'YYYY-MM') ) A;




-- 전체 회원수 조회
SELECT COUNT(*) FROM MEMBER
WHERE MEMBER_ST = 'N';

SELECT M.MEMBER_NO, M.MEMBER_EMAIL, M.MEMBER_NAME, S.S_CANCEL, M.MEMBER_ST
FROM MEMBER M
LEFT JOIN SUBS_ORDER S
ON M.MEMBER_NO = S.MEMBER_NO
WHERE MEMBER_ST IN ('N', 'P')
ORDER BY 1;

SELECT * FROM SUBS_ORDER;



-- 전체 리뷰 개수 조회
SELECT COUNT(*) FROM REVIEW WHERE REVIEW_CD IN (1,2);



-- 특정일 환불 금액 조회
SELECT NVL((SELECT P_REFUND_AMOUNT
FROM PRODUCT_REFUND
WHERE P_REFUND_DT BETWEEN TO_DATE(SYSDATE, 'YY-MM-DD') AND TO_DATE(SYSDATE, 'YY-MM-DD') + 0.99999
AND P_REFUND_ST = 'Y'

UNION ALL

SELECT NULL FROM DUAL WHERE NOT EXISTS (
    SELECT P_REFUND_AMOUNT 
    FROM PRODUCT_REFUND
    WHERE P_REFUND_DT BETWEEN TO_DATE(SYSDATE, 'YY-MM-DD') AND TO_DATE(SYSDATE, 'YY-MM-DD') + 0.99999
    AND P_REFUND_ST = 'Y'
)), 0) AS TODAY_REFUND_AMOUNT FROM DUAL;

-- 특정 날짜 환불 금액 조회 함수 생성
CREATE OR REPLACE FUNCTION SELECT_REFUND_AMOUNT( DT DATE )
RETURN NUMBER
IS RES_AMOUNT NUMBER;
BEGIN
    SELECT P_REFUND_AMOUNT
    INTO RES_AMOUNT
    FROM PRODUCT_REFUND
    WHERE P_REFUND_DT BETWEEN TO_DATE(DT, 'YY-MM-DD') AND TO_DATE(DT, 'YY-MM-DD') + 0.99999
    AND P_REFUND_ST = 'Y';
    RETURN RES_AMOUNT;
END;
/

-- 특정 날짜 환불 금액 조회 (함수 활용)
SELECT NVL(SELECT_REFUND_AMOUNT( TO_DATE('2022-07-19','YYYY-MM-DD') ),0) FROM DUAL;

-- 전체 환불 금액 조회
SELECT NVL(SUM(P_REFUND_AMOUNT), 0) FROM PRODUCT_REFUND
WHERE P_REFUND_ST = 'Y';

SELECT SUM(P_REFUND_AMOUNT) FROM PRODUCT_REFUND
WHERE P_REFUND_DT BETWEEN TO_DATE(SYSDATE, 'YY-MM-DD') AND TO_DATE(SYSDATE, 'YY-MM-DD') + 0.99999;
;

SELECT TO_CHAR(SYSDATE, 'YY-MM-DD') FROM DUAL;
SELECT * FROM PRODUCT_REFUND;

SELECT * FROM REVIEW_IMG WHERE REVIEW_NO = 7;



-- 당일 매출(환불금 제외)
SELECT NVL(SUM(TODAY_PAY_AMOUNT), 0) - NVL(SELECT_REFUND_AMOUNT( SYSDATE ),0) PAY_AMOUNT_PER_DAY
FROM(
    SELECT SUM(P_PAY_AMOUNT) TODAY_PAY_AMOUNT
    FROM PRODUCT_PAY
    WHERE P_PAY_DT BETWEEN TO_DATE(SYSDATE, 'YY-MM-DD') AND TO_DATE(SYSDATE, 'YY-MM-DD') +0.99999

    UNION ALL

    SELECT SUM(S_PAY_AMOUNT) TODAY_PAY_AMOUNT
    FROM SUBS_PAY
    WHERE S_PAY_DT BETWEEN TO_DATE(SYSDATE, 'YY-MM-DD') AND TO_DATE(SYSDATE, 'YY-MM-DD') +0.99999);

-- 전체 매출(환불금 제외)
SELECT NVL(SUM(TODAY_PAY_AMOUNT), 0) PAY_AMOUNT_TOTAL
FROM(
    SELECT SUM(P_PAY_AMOUNT) TODAY_PAY_AMOUNT
    FROM PRODUCT_PAY

    UNION ALL

    SELECT SUM(S_PAY_AMOUNT) TODAY_PAY_AMOUNT
    FROM SUBS_PAY

    UNION ALL

    SELECT NVL(SUM(P_REFUND_AMOUNT), 0)  * -1 FROM PRODUCT_REFUND WHERE P_REFUND_ST = 'Y'
)
WHERE 
;






-- PRODUCT_REFUND(환불) 테이블 샘플데이터 삽입
INSERT INTO PRODUCT_REFUND VALUES(SEQ_P_REFUND_CD.NEXTVAL, SYSDATE, 20500, DEFAULT, 
    (SELECT P_ORDER_CD FROM PRODUCT_ORDER 
    WHERE MEMBER_NO = 3
    AND DELIVERY_CD = 1)
);












-- OPTION_TB 조회
SELECT * FROM OPTION_TB;
SELECT * FROM OPTION_TYPE;
SELECT * FROM PRODUCT;

INSERT INTO OPTION_TYPE VALUES(
    SEQ_OPTION_CD.NEXTVAL, 3, '5kg', '20000'
);

INSERT INTO OPTION_TB VALUES(
    SEQ_OPTION_NO.NEXTVAL, 21, 3, 1 
);

-- 주별 상품에서 업로드 상태 컬럼 삭제
SELECT * FROM WEEKLY_LIST;
ALTER TABLE WEEKLY_LIST DROP COLUMN UPLOAD_ST;

-- 주별 상품 테이블에서 상품코드 컬럼 삭제 / 옵션코드 컬럼 삽입
SELECT * FROM WEEKLY_P;
ALTER TABLE WEEKLY_P DROP COLUMN P_CD;
ALTER TABLE WEEKLY_P 
ADD (OPTION_CD NUMBER NOT NULL);
ALTER TABLE WEEKLY_P
ADD FOREIGN KEY(OPTION_CD) REFERENCES OPTION_TYPE(OPTION_CD);
COMMENT ON COLUMN WEEKLY_P.OPTION_CD IS '옵션 코드';


-- 결제 테이블 결제번호 컬럼 자료형 변경
ALTER TABLE PRODUCT_PAY MODIFY P_PAY_NO VARCHAR2(20);

-- 결제 테이블 샘플데이터 삽입
INSERT INTO PRODUCT_PAY VALUES(
    '220719151742-3', TO_DATE('20220714', 'YYYY-MM-DD'), 27000, 1, 2
);


SELECT * FROM PRODUCT_ORDER;

SELECT * FROM PRODUCT_REFUND;
DELETE FROM PRODUCT_REFUND;

INSERT INTO PRODUCT_REFUND VALUES(SEQ_P_REFUND_CD.NEXTVAL, SYSDATE, 20500, DEFAULT, 22);
UPDATE PRODUCT_REFUND SET P_REFUND_ST = DEFAULT;

-- 배송 전 상태 주문번호 조회
SELECT P_ORDER_CD FROM PRODUCT_ORDER 
WHERE MEMBER_NO = 3
AND DELIVERY_CD = 1;


-- 환불 내역 조회 (P_REFUND_ST가 Y이면 버튼X / N이면 버튼 O)
SELECT  P_ORDER_CD, P_REFUND_AMOUNT, P_REFUND_DT, P_ORDER_DT,
        MEMBER_EMAIL, MEMBER_NAME, P_REFUND_ST
FROM PRODUCT_REFUND
JOIN PRODUCT_ORDER USING(P_ORDER_CD)
JOIN MEMBER USING(MEMBER_NO);

-- 환불되는 주문의 옵션
SELECT OPTION_COUNT, OPTION_NM, PRODUCT_NM
FROM OPTION_TB 
JOIN OPTION_TYPE USING(OPTION_CD)
JOIN PRODUCT USING(P_CD)
WHERE P_ORDER_CD = '20220723-0040';



-- 환불 상태 변경
UPDATE PRODUCT_REFUND SET P_REFUND_ST = 'N' WHERE P_ORDER_CD = '20220722-002';



        

-- 매출 건수 조회 
-- 구독 회원수
SELECT COUNT(*) FROM SUBS_PAY
JOIN SUBS_ORDER USING(S_ORDER_CD)
WHERE S_CANCEL = 'N';

-- 개별상품 (환불 건 미포함)
SELECT COUNT(*) FROM 
(SELECT PP.P_ORDER_CD FROM PRODUCT_PAY PP
LEFT JOIN PRODUCT_REFUND PR ON PP.P_ORDER_CD = PR.P_ORDER_CD
WHERE PR.P_ORDER_CD IS NULL);

-- 개별 상품 결제 횟수(환불건 포함)
SELECT COUNT(*) FROM PRODUCT_PAY;

-- 환불 요청 건수 조회
SELECT COUNT(*) FROM PRODUCT_REFUND;

-- 환불 완료 건수 조회
SELECT COUNT(*) FROM PRODUCT_REFUND WHERE P_REFUND_ST = 'Y';

SELECT * FROM MEMBER;

SELECT * FROM PRODUCT_REFUND;




INSERT INTO PRODUCT_PAY VALUES(
    '220722101411-5', TO_DATE('20220720', 'YYYY-MM-DD'), 23500, 3, 22
);


SELECT COUNT(REVIEW_NO)
		FROM(
			SELECT REVIEW_NO, S_REVIEW_ST FROM REVIEW
			JOIN SUBS_ORDER USING(S_ORDER_CD)
			WHERE S_REVIEW_ST = 'Y'
            AND REVIEW_CD IN (1,2)
		
			UNION ALL
		
			SELECT REVIEW_NO, P_REVIEW_ST FROM REVIEW
			JOIN PRODUCT_ORDER USING(P_ORDER_CD)
			WHERE P_REVIEW_ST = 'Y'
            AND REVIEW_CD IN (1,2)
        );


SELECT (NVL(SUM(TODAY_PAY_AMOUNT), 0) - NVL(SELECT_REFUND_AMOUNT(SYSDATE), 0)) PAY_AMOUNT_PER_DAY
		FROM(
		    SELECT SUM(P_PAY_AMOUNT) TODAY_PAY_AMOUNT
		    FROM PRODUCT_PAY
		    WHERE P_PAY_DT BETWEEN TO_DATE(SYSDATE, 'YY-MM-DD') AND TO_DATE(SYSDATE, 'YY-MM-DD') +0.99999
		
		    UNION ALL
		
		    SELECT SUM(S_PAY_AMOUNT) TODAY_PAY_AMOUNT
		    FROM SUBS_PAY
		    WHERE S_PAY_DT BETWEEN TO_DATE(SYSDATE, 'YY-MM-DD') AND TO_DATE(SYSDATE, 'YY-MM-DD') +0.99999);

-- 농가 개수
SELECT COUNT(*) FROM FARM WHERE FARM_ST = 'Y';

SELECT COUNT(*) FROM PRODUCT;

SELECT * --, OPTION_NM, PRODUCT_NM, OPTION_COUNT
FROM PRODUCT_PAY
JOIN PRODUCT_ORDER USING(P_ORDER_CD)
JOIN OPTION_TB USING(P_ORDER_CD)
-- JOIN OPTION_TYPE USING(OPTION_CD)
-- JOIN PRODUCT USING(P_CD)
WHERE P_ORDER_CD = '20220722-002';

SELECT * FROM PRODUCT_ORDER WHERE P_ORDER_CD = '20220726-00148';

SELECT * FROM PRODUCT_ORDER JOIN OPTION_TB USING(P_ORDER_CD) WHERE P_ORDER_CD = '20220726-00148';

SELECT * FROM OPTION_TB;


SELECT * FROM PRODUCT_ORDER 
JOIN OPTION_TB USING(P_ORDER_CD)
JOIN OPTION_TYPE USING(OPTION_CD)
JOIN PRODUCT USING(P_CD)
WHERE P_ORDER_CD = '20220726-00150';

SELECT * FROM PRODUCT_ORDER WHERE P_ORDER_CD = '20220726-00150';


SELECT  P_ORDER_CD, P_REFUND_AMOUNT, P_REFUND_DT, P_ORDER_DT,
        MEMBER_EMAIL, MEMBER_NAME, P_REFUND_ST
FROM PRODUCT_REFUND
JOIN PRODUCT_ORDER USING(P_ORDER_CD)
JOIN MEMBER USING(MEMBER_NO)
ORDER BY P_ORDER_DT DESC;


SELECT  S_ORDER_CD, S_PAY_NO, MEMBER_NAME, MEMBER_EMAIL, S_PAY_AMOUNT, S_PAY_DT, S_ORDER_ADDR, 
        S_DELIVERY_DT, DELIVERY_ST, S_DL_REQ, S_NM, S_CYCLE,
        (SELECT LISTAGG(PRODUCT_NM, ', ') WITHIN GROUP (ORDER BY S_ORDER_CD)
        FROM SUBS_ORDER 
        JOIN SUBS_EXCEPTION USING(S_ORDER_CD)
        JOIN PRODUCT USING(P_CD)
        WHERE S_ORDER_CD = 'J20220724-00120') PRODUCT_NM
FROM SUBS_PAY
JOIN MEMBER USING(MEMBER_NO)
JOIN SUBS_DELIVERY USING(S_ORDER_CD)
JOIN SUBS_ORDER USING(S_ORDER_CD)
JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
JOIN SUBS USING(S_CD)
WHERE S_ORDER_CD = 'J20220724-00120';



SELECT  S_PAY_NO, S_ORDER_CD, MEMBER_NAME, MEMBER_EMAIL, S_PAY_AMOUNT, S_PAY_DT, S_ORDER_ADDR, 
        S_DELIVERY_DT, DELIVERY_ST, S_DL_REQ, S_NM, S_CYCLE,
        (SELECT LISTAGG(PRODUCT_NM, ', ') WITHIN GROUP (ORDER BY S_PAY_NO)
        FROM SUBS_PAY
        JOIN SUBS_ORDER USING(S_ORDER_CD)
        JOIN SUBS_EXCEPTION USING(S_ORDER_CD)
        JOIN PRODUCT USING(P_CD)
        WHERE S_PAY_NO = 'SP20220726111247-8073') PRODUCT_NM
FROM SUBS_PAY
JOIN MEMBER USING(MEMBER_NO)
JOIN SUBS_DELIVERY USING(S_ORDER_CD)
JOIN SUBS_ORDER USING(S_ORDER_CD)
JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
JOIN SUBS USING(S_CD)
WHERE S_PAY_NO = 'SP20220726111247-8073';



SELECT LISTAGG(PRODUCT_NM, ', ') WITHIN GROUP (ORDER BY S_PAY_NO)
FROM SUBS_PAY
JOIN SUBS_ORDER USING(S_ORDER_CD)
JOIN SUBS_EXCEPTION USING(S_ORDER_CD)
JOIN PRODUCT USING(P_CD)
WHERE S_PAY_NO = 'SP20220726111247-8073'