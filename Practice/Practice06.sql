/* DDL */
-- webdb 계정에 book 테이블 만들기
create table book(
    book_id number(5), 
    title varchar(50),
    author varchar2(10),
    pub_date date
    );
    
--컬럼 추가
alter table book add(pubs varchar2(50)); --최대 50byte

--컬럼 수정
alter table book modify(title varchar2(100)); -- 속성 변경
alter table book rename column title to subject; -- 컬럼명 변경

--컬럼 삭제
alter table book drop (author);

--테이블명 변경
rename book to article;

--테이블 삭제
drop table article;
select * from article;

--작가 테이블 만들기(제약조건 추가)
create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key (author_id)
);

--book table 만들기 + author랑 연결
create table book(
        book_id number(10),
        title varchar2(100) not null,
        pubs varchar2(100),
        pub_date date,
        author_id number(10),
        
        primary key(book_id),
        constraint book_fk foreign key(author_id)
        references author(author_id)
);

/*DML*/
--insert(데이터 삽입)
insert into author
values( 1, '박경리', '토지 작가');

insert into author (author_id, author_name, author_desc)
values (2, '이문열', '삼국지등등 작가');

insert into author
values(3, '기안84', '웹툰 작가');



--update(데이터 수정)
update author
set author_name = '김경리'
where author_id = 1; -- where절 없으면 모든 작가이름 김경리 됨

--delete(데이터 한줄 삭제)(한칸 삭제는 불가. update로 빈칸 넣어야)
delete from author
where author_id = 1;

delete from author;

select * from author; --주의!! where 절 없으면 모두 삭제


/*sequence*/ --은행 번호표 같은
create sequence  seq_author_id
increment by 1 --1씩 증가 
start with 1;

--시퀀스 사용
insert into author
values (seq_author_id.nextval, '박경리', '토지 작가'); --.nextval 해당 번호표에서 다음 번호 부여


insert into author
values (seq_author_id.nextval, '이문열', '삼국지 작가');

insert into author
values (seq_author_id.nextval, '강풀');

insert into author
values (seq_author_id.nextval, '강풀', '웹툰 작가'); -- 실패해도 번호는 올라감.

--시퀀스 조회
select * from user_sequences;

--현재 시퀀스 조회
select seq_author_id.currval
from dual;

--다음 시퀀스 조회
select seq_author_id.nextval
from dual; -- 조회만 해도 번호 하나 올라감

--시퀀스 삭제
drop sequence seq_author_id;
select * from author;

-------------------------------------------------------
select * from user_sequences;
drop sequence seq_author_id;

drop table author; --다른 테이블 fk와 연결되어 있으면 삭제 안됨. book 먼저 삭제 후 삭제 가능
drop table book;

-------------------------------------------------------
/* practice */
--author table 생성
create table author (
    author_id number(5),
    author_name varchar2(50) not null,
    author_desc varchar2(50),
    primary key (author_id)
    );

--book table 생성
create table book (
    book_id number(5),
    title varchar2(50),
    pubs varchar2(50),
    pub_date date,
    author_id number(5),
    primary key (book_id),
    constraint book_fk foreign key(author_id)
    references author(author_id)
    );
    
--seq 생성
create sequence seq_book_id
increment by 1
start with 1;

create sequence seq_author_id
increment by 1
start with 1;

--author table 데이터 삽입
insert into author
values ( seq_author_id.nextval, '이문열', '경북 영양' );

insert into author
values ( seq_author_id.nextval, '박경리', '경상남도 통영');

insert into author
values ( seq_author_id.nextval, '유시민', '17대 국회의원');

insert into author
values ( seq_author_id.nextval, '기안84', '기안동에서 산 84년생');

insert into author
values ( seq_author_id.nextval, '강풀', '온라인 만화가 1세대');

insert into author
values ( seq_author_id.nextval, '김영하' , '알쓸신잡');

-- book table 데이터 삽입
INSERT INTO book 
VALUES (seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);

INSERT INTO book 
VALUES (seq_book_id.nextval, '삼국지', '민음사', '2002-03-01', 1);

INSERT INTO book 
VALUES (seq_book_id.nextval, '토지', '마로니에북스', '20120815', 2);

INSERT INTO book 
VALUES (seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길', '20150401', 3);

INSERT INTO book 
VALUES (seq_book_id.nextval, '패션왕', '중앙북스(books)', '20120222', 4);

INSERT INTO book 
VALUES (seq_book_id.nextval, '순정만화', '재미주의', '20110803', 5);

INSERT INTO book 
VALUES (seq_book_id.nextval, '오직두사람', '문학동네', '20170504', 6);

INSERT INTO book 
VALUES (seq_book_id.nextval, '26년', '재미주의', '20120204', 5);

--강풀의 desc 정보 '서울 특별시'로 변경
update author
set author_desc = '서울특별시'
where author_name = '강풀'; 

--author 테이블에서 기안 84 데이터 삭제
delete from author
where author_name = '기안84';
--book fk로 연결되어 있어서 삭제 안됨. 삭제하려면 book에 있는 패션왕 data부터 삭제해야 함.
delete from book
where author_id = ( select author_id
                    from author
                    where author_name = '기안84');

delete from author
where author_name = '기안84';


--table join하기
select *
from book, author
where book.author_id = author.author_id;
