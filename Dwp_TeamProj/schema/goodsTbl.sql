create database test1;

use test1;

create table memberList(
num           int                  							unique auto_increment,
uId            char(20)          							primary key,
uPw           char(20)           						not null,
uName       char(20)            						not null,
uEmail       char(20)          		 				   not null,
uPhone      char(20)          							not null,
uAge          int                    					    not null,
uAddr		 char(100)         						,
uGender      int                    						not null, #남자 1, 여자 2, 선택안함 3
uBirth         char(20)           					    not null,
recoPerson   char(20)           						not null,
joinTM       timestamp        						not null
);

desc memberList;
insert into memberList (uId,uPw,uName,uEmail,uPhone,uAge,uAddr,uGender,uBirth,recoPerson,joinTM) values 
('test','1234','테스트','test@naver.com','01000000000',28,'서울대현동',1,'20000101','admin',now()),
('new','1234','뉴','new@naver.com','01000000001',28,'서울대현동',2,'20000101','admin',now()),
('sample','1234','샘플','sample@naver.com','01000000002',28,'서울대현동',1,'20000101','admin',now());

select *from memberList order by num desc;

create table adminList(
num              int                  							unique auto_increment,
aId               char(20)                                   primary key,
aPw              char(20)              ,
aName          char(20)              ,
aEmail          char(20)              ,
aPhone         char(20)              ,
joinTM          timestamp          
);

insert into adminList (aId,aPw,aName,aEmail,aPhone,joinTM) values ('admin','1234','관리자','admin@naver.com','01000000000',now());

select *from adminList order by num desc;





create table goodsTbl(
num					int				unique auto_increment	,
regId			char(20)   		not null,								#작성자 ID
pName				nchar(50)			not null						,
pType				nchar(30) 	not null							,				/*pType : 상품분류*/
stockVolumn		int					not null						,				/*stockVolumn: 재고*/
salesVolumn		int					not null						,				/*salesVolumn : 판매량*/
oriPrice				int					not null						,				/*oriPrice 원래 가격*/
sellPrice				int					not null						,				/*sellPrice 실제 판매 가격*/
sellLabel			char(5)				not null						,				/*sellLabel : BEST, NEW, SALE, NONE. 라벨에 대해서 2진법으로 표현(0100)*/
content				text					not null						,
regDate				datetime		not null							,
readCnt				smallint(7) unsigned	not null				,				/*count : 조회수*/
oriFileName		char(30)		null								,
sysFileName		char(30)		null								,
fileSize				int(11)			null							
);

desc goodsTbl;

select * from goodsTbl order by num desc;
select * from goodsTbl order by num desc;





create table adminWriteTbl (
num			int					unique auto_increment,    	#글번호
aName		char(30)			not null,								#이름
asubject 	char(50)  			not null,								#제목
acontent 	text					not null,								#내용
pos          int                    not null,										#답변글용(position, 답변글 순서)
ref            int                    not null,										#답변글용(reference, 원본글/답변글 기준)
depth        int                    not null,										#답변글용(답변글 들여쓰기)
regTM    	timestamp 		not null,								#게시글 등록시간
ip				char(30)			not null,								#게시글 작성자 IP주소
readCnt     int        		    not null,								#조회수
oriFileName char(30)          null,								#첨부파일 원본이름
systemFileName char(200)	 null,								#첨부파일 시스템저장이름
fileSize      int                    null										#첨부파일 크기
);

desc adminWriteTbl;
select * from adminWriteTbl order by num desc;



create table inquireTbl (
num			int					unique auto_increment,    	#글번호
uid			char(20)   		not null,								#작성자 ID
uName		char(30)			not null,								#이름
bbsPw		char(20)			not null,								#게시글비밀번호
subject 	char(50)  			not null,								#제목
qnaType		char(10)			not null,								#QNA유형
content 		text					not null,								#내용
pos          int                    null,										#답변글용(position, 답변글 순서)
ref            int                    null,										#답변글용(reference, 원본글/답변글 기준)
depth        int                    null,										#답변글용(답변글 들여쓰기)
regTM    	timestamp 		not null,								#게시글 등록시간
ip				char(30)			not null,								#게시글 작성자 IP주소
readCnt     int        		    not null,								#조회수
oriFileName char(30)          null,								#첨부파일 원본이름
systemFileName char(200)	 null,								#첨부파일 시스템저장이름
fileSize      int                    null										#첨부파일 크기
);

desc inquireTbl;
select * from inquireTbl order by num desc;



