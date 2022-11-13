create table member(
	id int not null auto_increment,
	name varchar(100) not null,
	passwd varchar(50) not null,
	primary key(id)
);

create table board(
	num int not null auto_increment primary key,
	title varchar(100) not null,
	content varchar(2000) not null,
	id varchar(100),
	postdate varchar(100) default (current_date),
	visitcount  int,
    FOREIGN KEY (id) REFERENCES member (id)
);

DROP TABLE BOARD;

update member set pass='987',name='123',gen='456',birth='978',email='11',phone='2',addr='4' where id='1'

update member set (pass,name,gen,birth,email,phone,addr) = ('78','78','78','78','78','78','78') where id='12';

UPDATE member SET name=12341 WHERE id='xzs';

INSERT INTO member (name) VALUES ("이야아") where id=xzs;

SELECT name FROM member where id="abc";

select * from member where id="ham";

SELECT regidate FROM member where id="abc";

SELECT * FROM board where id="abc";p

create table product(
	pid varchar(200) not null,
	pname varchar(100) not null,
	price int(50) not null,
	category varchar(100),
	conditions varchar(100),
	info  varchar(500),
	manufacturer varchar(100),	
	stock int(50) not null,	
--	filename varchar(200),
	primary key(pid, pname, price)
);

delete from bill;

create table cart(
	pid varchar(200) not null,
	pname varchar(100) not null,
	price int(50) not null,	
	conditions varchar(100),	
	quantity int(50) not null,
	total int(255) not null,
	primary key(pid, pname, price)
);

SET sql_safe_updates=0;

drop table cart;

update cart set quantity=2,total=5  where pid='p2';

select * from product where pid="p2";

INSERT INTO product VALUES
("p1", "iphone6s",800000, 'smartphone',"new",
"4.7-inch, 1334X750 Retinal HD display, 8-megapixel iSight Camera",
"apple",1000,"./upload/와.jpg"),

("p2", "LG PC 그램",1500000, 'NoteBook',"new",
"13.3-inch,IPS LED display, 5rd Generation Intel Core Processors",
"LG", 1000, "./upload/와.jpg"),

("p3", "Galaxy Tab s", 900000, 'Tablet',"new",
"212.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor",
"SamSung", 1000,"./upload/와.jpg");

select * from product;
