
create table member(
	id varchar(20) not null primary key,
    pass varchar(10) not null,
    name varchar(30) not null,
    regidate date default (current_date)
); 

CREATE TABLE `member` (
   `id` varchar(20) NOT NULL,
   `pass` varchar(10) NOT NULL,
   `name` varchar(30) NOT NULL,
   `gen` varchar(100) ,
   `birth` varchar(100) ,
   `email` varchar(100) ,
   `phone` varchar(100) ,
   `addr` varchar(100),
   `regidate` date DEFAULT (curdate()),
   PRIMARY KEY (`id`)
 );
 
drop table member;
drop table board;

create table board(
num int not null auto_increment primary key,
title varchar(200) not null,
content varchar(2000) not null,
id varchar(20) not null,
postdate date default(current_date),
visitcount int,
foreign key (id) references member(id)
); 

create table product(
	pid varchar(200) not null,
	pname varchar(100) not null,
	price int(50) not null,
	category varchar(100),
	conditions varchar(100),
	info  varchar(500),
	manufacturer varchar(100),	
	stock int(50) not null,	
	filename varchar(200),
	primary key(pid, pname, price)
);

create table cart(
	pid varchar(200) not null,
	pname varchar(100) not null,
	price int(50) not null,	
	conditions varchar(100),	
	quantity int(50) not null,
	total int(255) not null,
	mid varchar(200) not null
	
);

-- 빌내용 수정해 --
create table bill( 
	pid varchar(200) not null,
	pname varchar(100) not null,
	price int(50) not null,			
	quantity int(50) not null,
	total int(255) not null,
	addr varchar(200) not null,
	uname varchar(100) not null,
	addrnum varchar(100) not null,
	bid varchar(200) not null,
	mid varchar(200) not null,
	`regidate` date DEFAULT (curdate())
	
);

drop table bill;

-- 테이블 레퍼런스 --

-- 리눅스에서 커널 개발할거면 대소문자 구분해야됨, 그래서 보통 컬럼명은 소문자-- 
insert into member(id, pass, name) values('admin','1234','김현준');
insert into member(id, pass, name) values('abc','1234','에이비씨');
insert into member(id, pass, name) values('xzs','1234','엑스제트에스');
insert into member(id, pass, name) values('asdf','1234','에이에스디에프');
insert into member(id, pass, name) values('ham04','1234','박혜민');

insert into board(num, title, content, id, visitcount) 
	values(9, '지금은 여름임', '여름향기', 'abc', 0);
insert into board(title, content, id, visitcount) 
	values('지금은 가을임', '가을동화', 'xzs', 0);
insert into board(title, content, id, visitcount) 
	values('지금은 봄임', '봄냄시', 'asdf', 0);
insert into board(title, content, id, visitcount) 
	values('지금은 뀨임', '뀨동화', 'abc', 0);
insert into board(title, content, id, visitcount) 
	values('지금은', '에', 'xzs', 0);


select row_number() over(order by num desc) as Anum, num, title, content from board;

