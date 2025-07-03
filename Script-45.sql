
DROP TABLE book;

CREATE TABLE book(
	book_id  number(5),
	title    varchar2(50),
	author   varchar2(10),
	pub_date date
);

DROP TABLE author;
CREATE TABLE author(
	author_id     number(10),
	author_name   varchar2(100) NOT null,
	author_desc   varchar2(500),
	PRIMARY key(author_id)
);
SELECT * FROM author;

DROP TABLE book;
CREATE TABLE book (
  book_id	 NUMBER(10),
  title	 VARCHAR2(100) NOT NULL,
  pubs	 VARCHAR2(100),
  pub_date	 DATE,
  author_id NUMBER(10),
  PRIMARY 	KEY(book_id),
  CONSTRAINT c_book_fk FOREIGN KEY (author_id)
  REFERENCES author(author_id)
);
SELECT * FROM book;




SELECT *
FROM book;

ALTER TABLE book 
ADD (pubs VARCHAR2(50));

ALTER TABLE book
MODIFY (title varchar2(100) );

ALTER TABLE book DROP (author);

RENAME book TO article;

SELECT *
FROM article;




DROP TABLE author;
CREATE TABLE author (
  author_id	NUMBER(10),
  author_name	VARCHAR2(100)  NOT NULL,
  author_desc	VARCHAR2(500),
  PRIMARY 	KEY(author_id)	
);
SELECT * FROM AUTHOR a ;

DROP TABLE book;
CREATE TABLE book (
  book_id	 NUMBER(10),
  title	 VARCHAR2(100) NOT NULL,
  pubs	 VARCHAR2(100),
  pub_date	 DATE,
  author_id NUMBER(10),
  PRIMARY 	KEY(book_id),
  CONSTRAINT c_book_fk FOREIGN KEY (author_id)
  REFERENCES author(author_id)
);

INSERT INTO AUTHOR 
values(1,'박경리','토지 작가');

SELECT * FROM AUTHOR a ;




INSERT INTO AUTHOR(AUTHOR_ID, AUTHOR_NAME)
values(2,'이문열');



UPDATE AUTHOR
SET author_name = '기안84',
    author_desc = '웹툰작가, 태어난김에 세계일주'
WHERE AUTHOR_ID = 1;




DELETE FROM author;



DROP SEQUENCE seq_author_id;
CREATE SEQUENCE seq_author_id
INCREMENT BY 1 
START WITH 1 ;

SELECT seq_author_id.nextval FROM dual;
SELECT seq_author_id.currval FROM dual;

DELETE FROM author;

INSERT INTO AUTHOR 
values(seq_author_id.nextval, '박경리', '토지작가');

INSERT INTO AUTHOR 
values(seq_author_id.nextval, '이문열', '삼국지작가');

SELECT * FROM author;







SELECT AUTHOR_ID AS "저자번호", AUTHOR_NAME "저자명"
FROM AUTHOR a ;

SELECT *
FROM AUTHOR a 
WHERE AUTHOR_id like '*' ;


SELECT *
FROM book, author;



SELECT *
FROM BOOK ;

SELECT '출판사 : ' ||  b.PUBS || '책제목 : ' || b.TITLE || '출판일 : ' ||b.PUB_DATE "책정보"
FROM book b;

SELECT *
FROM BOOK b
WHERE b.BOOK_ID = ( 
                   SELECT a.BOOK_ID 
                     FROM book a 
                    WHERE a.title = '26년'); 

SELECT a.BOOK_ID FROM book a WHERE a.title = '26년';





SELECT * FROM AUTHOR a ;
SELECT * FROM BOOK b ;

SELECT *
FROM AUTHOR a 
WHERE exists (SELECT b.AUTHOR_ID FROM book b WHERE b.AUTHOR_ID = a.AUTHOR_ID );


SELECT b.AUTHOR_ID FROM book b;



SELECT * FROM AUTHOR a ;
SELECT count(*) FROM BOOK b ;

SELECT b.TITLE, b.PUBS, a.AUTHOR_NAME
FROM BOOK b , AUTHOR a 
WHERE b.AUTHOR_ID = a.AUTHOR_ID;









ALTER TABLE book add(pubs varchar2(50));
ALTER TABLE book MODIFY (title VARCHAR2(100));
ALTER TABLE book DROP (author);
RENAME book TO article;
DROP TABLE article;

ALTER TABLE book RENAME COLUMN pub_date TO pubs;

DROP TABLE book;
CREATE TABLE book (
  book_id	 NUMBER(10),
  title	 VARCHAR2(100) NOT NULL,
  pubs	 VARCHAR2(100),
  pub_date	 DATE,
  author_id NUMBER(10),
  PRIMARY 	KEY(book_id),
  CONSTRAINT c_book_fk FOREIGN KEY (author_id)
  REFERENCES author(author_id)
);

DROP TABLE author;
CREATE TABLE author (
  author_id	NUMBER(10),
  author_name	VARCHAR2(100)  NOT NULL,
  author_desc	VARCHAR2(500),
  PRIMARY 	KEY(author_id)	
);


INSERT INTO AUTHOR 
VALUES (1, '박경리', '토지 작가');

SELECT * FROM AUTHOR a ;

INSERT INTO AUTHOR(author_id, AUTHOR_NAME)
VALUES (2, '이문열');

INSERT INTO AUTHOR(author_id, AUTHOR_NAME)
VALUES (3, '기안84');

UPDATE author
SET author_name = '기안84', 
    author_desc = '웹툰작가' 
WHERE author_id = 1 ;

UPDATE author
SET author_name = '강풀', 
    author_desc = '인기작가' ;


DELETE FROM author
WHERE author_id = 1 ;


DELETE FROM author;



DROP SEQUENCE seq_author_id;
CREATE SEQUENCE seq_author_id
INCREMENT BY 1 
START WITH 1 ;



SELECT seq_author_id.currval FROM dual;

SELECT seq_author_id.nextval FROM dual;


INSERT INTO AUTHOR 
VALUES (seq_author_id.nextval, '이문열', '경북 영양');

INSERT INTO AUTHOR 
VALUES (seq_author_id.nextval, '박경리', '경상남도 통영');

INSERT INTO AUTHOR 
VALUES (seq_author_id.nextval, '유시민', '17대 국회의원');

INSERT INTO AUTHOR 
VALUES (seq_author_id.nextval, '기안84', '기안동에서 산 84년생');

INSERT INTO AUTHOR 
VALUES (seq_author_id.nextval, '강풀', '온라인 만화가 1세대');

INSERT INTO AUTHOR 
VALUES (seq_author_id.nextval, '김영하', '알쓸신잡');

SELECT * FROM AUTHOR a ;


DROP SEQUENCE seq_book_id;
CREATE SEQUENCE seq_book_id
INCREMENT BY 1 
START WITH 1 ;

SELECT seq_book_id.currval FROM dual;

SELECT seq_book_id.nextval FROM dual;


INSERT INTO book 
VALUES (seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);

INSERT INTO book 
VALUES (seq_book_id.nextval, '삼국지', '민음사', '2002-03-01', 1);

INSERT INTO book 
VALUES (seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15', 2);

INSERT INTO book 
VALUES (seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길', '2015-04-15', 3);

INSERT INTO book 
VALUES (seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012-02-22', 4);

INSERT INTO book 
VALUES (seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03', 5);

INSERT INTO book 
VALUES (seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-14', 6);

INSERT INTO book 
VALUES (seq_book_id.nextval, '26년', '재미주의', '2012-02-14', 5);



SELECT * FROM book ;

SELECT b.BOOK_ID , b.TITLE , b.PUBS , b.PUB_DATE , b.AUTHOR_ID ,
      a.AUTHOR_NAME , a.AUTHOR_DESC 
FROM AUTHOR a , BOOK b 
WHERE a.AUTHOR_ID = b.AUTHOR_ID ;



SELECT *
FROM AUTHOR a 
WHERE a.AUTHOR_ID = 5;


UPDATE AUTHOR a 
SET a.author_desc = '서울특별시'
WHERE a.AUTHOR_ID = 5;





SELECT *
FROM author
WHERE AUTHOR_id = 5;

DELETE FROM AUTHOR 
WHERE AUTHOR_id = 4;

DELETE FROM BOOK 
WHERE book_id = 5;



SELECT * FROM USER_SEQUENCES;
SELECT * FROM AUTHOR a ;
SELECT * FROM BOOK b ;
DELETE FROM AUTHOR a ;

INSERT INTO AUTHOR values(1, '이문열' , '경북 영양');
INSERT INTO AUTHOR values(2, '박경리' , '경상남도 통영');
INSERT INTO AUTHOR values(3, '유시민' , '17대 국회의원');
INSERT INTO AUTHOR values(4, '기안84' , '기안동에서 산 84년생');
INSERT INTO AUTHOR values(5, '강풀' , '온라인 만화가 1세대');
INSERT INTO AUTHOR values(6, '김영하' , '알쓸신잡');

INSERT INTO BOOK values(3, '토지' , '마로니에북스', to_date('2012-08-15', ' YYYY-MM-DD'), 2 );

INSERT INTO BOOK values(4, '유시민의 글쓰기 특강' , '생각의 길', to_date('2015-04-01', ' YYYY-MM-DD'), 2 );
INSERT INTO BOOK values(5, '패션왕' , '중앙북스', to_date('2012-02-22', ' YYYY-MM-DD'), 2 );
INSERT INTO BOOK values(6, '순정만화' , '재미주의', to_date('2011-08-03', ' YYYY-MM-DD'), 2 );
INSERT INTO BOOK values(7, '오직 두사람' , '문학동네', to_date('2017-05-04', ' YYYY-MM-DD'), 2 );
INSERT INTO BOOK values(8, '26년' , '재미주의', to_date('2012-02-04', ' YYYY-MM-DD'), 2 );





SELECT b.BOOK_ID , b.TITLE , b.PUBS , b.PUB_DATE , b.AUTHOR_ID ,
      a.AUTHOR_NAME , a.AUTHOR_DESC 
FROM AUTHOR a , BOOK b 
WHERE a.AUTHOR_ID = b.AUTHOR_ID ;





select author_id, author_name name, author_desc from author;


SELECT *
FROM emaillist;

SELECT seq_emaillist_no.currval FROM dual;

CREATE SEQUENCE seq_emaillist_no
INCREMENT BY 1 START WITH 1;


-- 36412
SELECT count(*)
FROM TBLZIPCODE t 
WHERE area1 = '서울특별시';

SELECT *
FROM post ;

INSERT INTO POST (ZIPCODE, SIDO, SIDOE, SIGUNGU, SIGUNGUE, EUPMYUN, EUPMYUNE, DOROCODE, DORO, DOROE, UNDERGROUND, BUILDINGNO1, BUILDINGNO2, BUILDINGMANAGENO, DARYANG, BUILDING, DONGCODE, DONG, RI, DONGADMIN, SAN, ZIBUN1, ZIBUNSERIAL, ZIBUN2, OLDZIPCODE, ZIPCODESERIAL) 
VALUES('06325','서울특별시','Seoul','강남구','Gangnam-gu','','','116803122006','선릉로','Seolleung-ro','0','26','0','1168010300101580012019592','','JS빌딩','1168010300','개포동','','개포2동','0','158','02','12','','');

INSERT INTO POST (ZIPCODE, SIDO, SIDOE, SIGUNGU, SIGUNGUE, EUPMYUN, EUPMYUNE, DOROCODE, DORO, DOROE, UNDERGROUND, BUILDINGNO1, BUILDINGNO2, BUILDINGMANAGENO, DARYANG, BUILDING, DONGCODE, DONG, RI, DONGADMIN, SAN, ZIBUN1, ZIBUNSERIAL, ZIBUN2, OLDZIPCODE, ZIPCODESERIAL) VALUES('06325','서울특별시','Seoul','강남구','Gangnam-gu','','','116803122006','선릉로','Seolleung-ro','0','26','0','1168010300101580012019592','','JS빌딩','1168010300','개포동','','개포2동','0','158','02','12','','');



DELETE FROM post;




SELECT * FROM POST_SEJONG ps
WHERE ps.dong LIKE '%보람%';





DROP TABLE post;
CREATE TABLE POST
   (    ZIPCODE VARCHAR2(5),
    SIDO VARCHAR2(60),
    SIDOE VARCHAR2(60),
    SIGUNGU VARCHAR2(60),
    SIGUNGUE VARCHAR2(60),
    EUPMYUN VARCHAR2(60),
    EUPMYUNE VARCHAR2(60),
    DOROCODE VARCHAR2(12),
    DORO VARCHAR2(160),
    DOROE VARCHAR2(160),
    UNDERGROUND CHAR(1),
    BUILDINGNO1 NUMBER,
    BUILDINGNO2 NUMBER,
    BUILDINGMANAGENO VARCHAR2(25),
    DARYANG VARCHAR2(40),
    BUILDING VARCHAR2(200),
    DONGCODE VARCHAR2(10),
    DONG VARCHAR2(40),
    RI VARCHAR2(40),
    DONGADMIN VARCHAR2(40),
    SAN VARCHAR2(1),
    ZIBUN1 NUMBER,
    ZIBUNSERIAL VARCHAR2(2),
    ZIBUN2 NUMBER,
    OLDZIPCODE VARCHAR2(6),
    ZIPCODESERIAL VARCHAR2(3)
   ) ;

  
SELECT *
FROM POST p ;

select author_id, author_name name, author_desc from author
order by author_id;

  
  
SELECT *
FROM AUTHOR a; 

SELECT *
FROM AUTHOR a 
WHERE AUTHOR_ID =1;

INSERT INTO AUTHOR  
VALUES (100, '테스트', '입력테스트');


UPDATE AUTHOR 
SET AUTHOR_NAME = '이문열',
    AUTHOR_DESC = '경북 영양'
WHERE AUTHOR_ID = 1;


UPDATE AUTHOR 
SET AUTHOR_NAME = '기안84',
    AUTHOR_DESC = '웹툰 작가'
WHERE AUTHOR_ID = 1;



INSERT INTO author 
VALUES (seq_author_id.nextval, '홍길동', '홍길동전' );

SELECT * FROM author;

INSERT INTO author 
VALUES (seq_author_id.nextval, '입력', '테스트' );


SELECT seq_author_id.nextval FROM dual;


create table users2 (
	userid          varchar2(50)	primary key, 
	username		varchar2(50)	not null,
	userpassword	varchar2(50)	not null,
	userage			number(3)		not null,
	useremail		varchar2(50)	not null
);


SELECT * FROM USERS2 u ;

INSERT INTO users2 (userid, username, userpassword, userage, useremail) 
VALUES (?, ?, ?, ?, ?)



 SELECT b.BOOK_ID, b.TITLE, b.PUBS, 
        to_char(b.PUB_DATE,'YYYYMMDD') PUB_DATE, 
        a.AUTHOR_ID, 
        a.AUTHOR_NAME
 FROM BOOK b, AUTHOR a
 WHERE b.author_id = a.author_id
 AND a.author_id=2;


SELECT * FROM book;








UPDATE users2 SET
username = '홍길동',
userpassword = '1234',
userage = 99,
useremail = 'hgd@korea.com'
WHERE userid = 'winter22';

DELETE FROM users2 
WHERE userid = 'winter22';



SELECT userid, username, userpassword, userage, useremail 
FROM users2 
WHERE userid='winter2';


SELECT seq_author_id.currval FROM dual;


INSERT INTO users (no, name, email, password, gender) 
VALUES (seq_users_no.nextval, ?, ?, ?, ?);

SELECT * FROM USERS;

select count(*) cnt  
from users 
where email = 'hgd@korea.com';
                   









CREATE TABLE guestbook(
	NO number(10),
	name varchar2(100),
	content varchar2(500),
	reg_date DATE,
	PRIMARY key(no)
);

SELECT * FROM guestbook;

CREATE SEQUENCE seq_guestbook_no
INCREMENT BY 1 START WITH 1;

INSERT INTO guestbook
values(seq_guestbook_no.nextval, '홍길동', '내용입니다',sysdate );

DELETE FROM guestbook WHERE NO=1;



SELECT *
FROM AUTHOR a ;




SELECT * FROM BOOK b ;
SELECT * FROM AUTHOR a ;

 SELECT b.BOOK_ID, 
        b.TITLE, 
        b.PUBS, 
        to_char(b.PUB_DATE,'YYYYMMDD') PUB_DATE, 
        a.AUTHOR_ID, 
        a.AUTHOR_NAME
 FROM BOOK b, AUTHOR a
 WHERE b.author_id = a.author_id
 AND a.author_id=83;

 SELECT book_id, 
        title, 
        pubs, 
        to_char(pub_date,'yyyymmdd') pub_date 
 FROM book 
 WHERE book_id=3;


SELECT *
FROM EMAILLIST e ;


SELECT seq_emaillist_no.nextval FROM dual;
SELECT seq_emaillist_no.currval FROM dual;

CREATE SEQUENCE seq_emaillist_no
INCREMENT BY 1 
START WITH 1 ;

DROP TABLE "GUESTBOOK" ;

DROP TABLE guestbook;
create table guestbook(
  no          number(10),
  name      varchar2(80),
  password varchar2(20) not null,
  content    varchar2(2000),
  reg_date   date,
  primary key(no)
);

 SELECT g.NO
        NAME, 
        PASSWORD, 
        CONTENT, 
        TO_CHAR(REG_DATE, 'YYYY-MM-DD HH:mm:SS') REG_DATE 
 FROM GUESTBOOK g
 ORDER BY NO DESC;






SELECT * FROM guestbook;

SELECT count(*) FROM board;


 SELECT * 
   FROM(
        SELECT ROWNUM AS RNUM, A.*
          FROM ( select b.no, b.title, b.hit, b.reg_date, b.user_no, u.name 
                   from board b, users u 
                  WHERE b.USER_NO = u.NO 
                  order by b.NO DESC ) A
         WHERE ROWNUM <= 15+5
            )
  WHERE RNUM > 15;


select b.no, b.title, b.hit, b.reg_date, b.user_no, u.name 
   from board b, users u 
  WHERE b.USER_NO = u.NO 
  order by b.NO DESC;

SELECT * FROM BOARD b ;

DROP TABLE BOARD;
CREATE TABLE BOARD (	
    NO NUMBER, 
	TITLE VARCHAR2(500), 
	CONTENT VARCHAR2(4000), 
	HIT NUMBER, 
	REG_DATE DATE, 
	USER_NO NUMBER, 
	FILENAME1 VARCHAR2(200), 
	PRIMARY KEY (NO)
);





DROP TABLE cart_products;
CREATE TABLE cart_products
(
    id      NUMBER(15),  --상품번호
    cart_id NUMBER(15),  --카트번호
    name    VARCHAR2(6), --상품이름
    price   NUMBER(15)  --상품가격
);
COMMIT;
ALTER TABLE cart_products NOLOGGING; 

INSERT /*+ APPEND */ INTO cart_products --고객테이블
SELECT
    LPAD(TO_CHAR(MOD(TRUNC(DBMS_RANDOM.VALUE(1, 1000)), 50)), 14, '1') , --상품번호
    LPAD(TO_CHAR(MOD(TRUNC(DBMS_RANDOM.VALUE(1, 1000)), 50)), 14, '9') , --카트번호
    DBMS_RANDOM.STRING('U', 6),     --상품이름
    TRUNC(DBMS_RANDOM.VALUE(1000, 100000))     --상품가격
FROM DUAL CONNECT BY LEVEL <= 500000;

COMMIT;

/*
ALTER TABLE cart_products
ADD CONSTRAINT cart_products_pk
PRIMARY KEY (id, cart_id);

ANALYZE TABLE cart_products COMPUTE STATISTICS
FOR TABLE FOR ALL INDEXES FOR ALL INDEXED COLUMNS SIZE 254;
*/

SELECT count(*) FROM CART_PRODUCTS ;

SELECT * FROM CART_PRODUCTS;



SELECT NAME, COUNT(NAME) "횟수"
FROM CART_PRODUCTS
GROUP BY NAME
ORDER BY NAME;



SELECT NAME, COUNT(NAME) "횟수"
FROM CART_PRODUCTS
GROUP BY NAME
HAVING COUNT(NAME) > 1
ORDER BY NAME;




DROP TABLE FRIENDS;
CREATE TABLE FRIENDS 
 ( NO NUMBER,
 NAME VARCHAR2(100),
 EMAIL VARCHAR2(100) NOT NULL UNIQUE,
 PHONE VARCHAR2(100) NOT NULL UNIQUE,
 F_DESC VARCHAR2(100),
  PRIMARY KEY (NO)
 );
 
DROP SEQUENCE SEQ_FRIENDS_NO;
CREATE SEQUENCE SEQ_FRIENDS_NO
INCREMENT BY 1
START WITH 1 ;
SELECT SEQ_FRIENDS_NO.currval FROM dual;
SELECT SEQ_FRIENDS_NO.nextval FROM dual;

SELECT * FROM friends;
SELECT * FROM friends WHERE email='minsu.kim@example.com' OR phone ='010-2345-6789';
INSERT INTO FRIENDS (NO, NAME, EMAIL, PHONE, F_DESC) VALUES
(1, '김민수', 'minsu.kim@example.com', '010-1234-5678', '좋은 친구');
INSERT INTO FRIENDS (NO, NAME, EMAIL, PHONE, F_DESC) VALUES
(2, '박지훈', 'jihun.park@example.com', '010-2345-6789', '고등학교 동창');
INSERT INTO FRIENDS (NO, NAME, EMAIL, PHONE, F_DESC) VALUES
(3, '이상훈', 'sanghoon.lee@example.com', '010-3456-7890', '대학교 친구');
INSERT INTO FRIENDS (NO, NAME, EMAIL, PHONE, F_DESC) VALUES
(4, '정수연', 'sooyeon.jeong@example.com', '010-4567-8901', '사무실 동료');
INSERT INTO FRIENDS (NO, NAME, EMAIL, PHONE, F_DESC) VALUES
(5, '홍지민', 'jimin.hong@example.com', '010-5678-9012', '온라인 게임 친구');



SELECT * FROM USERS;
SELECT count(*) FROM BOARD;

SELECT seq_board_no.nextval FROM dual;
SELECT seq_board_no.currval FROM dual;


 SELECT * 
   FROM(
        SELECT ROWNUM AS RNUM, A.*
          FROM ( select b.no, b.title, b.hit, b.reg_date, b.user_no, u.name from board b, users u WHERE b.USER_NO = u.NO order by b.NO DESC ) A
         WHERE ROWNUM <= 10+5
            )
  WHERE RNUM > 10;





