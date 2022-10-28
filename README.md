# shopping

팀프로젝트


SQL 쿼리


CREATE table product(
product_code int AUTO_INCREMENT PRIMARY key,
product_name VARCHAR(100) not null,
quantity int not null,
price int not null,
filename VARCHAR(500),
fee int not null,
out_put int not null,
file1 VARCHAR(500),
brand VARCHAR(20) not null,
gender VARCHAR(20) not null,
size int not null,
color VARCHAR(30) not null,
purpose VARCHAR(30) not null,
file2 VARCHAR(500) not null,
filename1 VARCHAR(400) null,
filename2 VARCHAR(500) null,
file3 VARCHAR(500) null
);



CREATE TABLE member(
midx int not null AUTO_INCREMENT UNIQUE ,
member_id VARCHAR(50) not null PRIMARY key UNIQUE,
member_pw VARCHAR(50) null,
member_phone VARCHAR(50)  null,
member_addr1 VARCHAR(200)  null,
member_addr2 VARCHAR(200)  null,
member_addr3 VARCHAR(200)  null,
member_email VARCHAR(100) null,
member_name VARCHAR(50)  null,
delyn CHAR(1) DEFAULT 'N'
);



create table reply(
replyId int AUTO_INCREMENT PRIMARY key,
product_code int not null REFERENCES product(product_code),
member_id VARCHAR(50) not null REFERENCES member(member_id),
date DATETIME DEFAULT now(),
content VARCHAR(3500),
rating DECIMAL(2,1) not null
);


CREATE table admin(
member_id VARCHAR(50) PRIMARY key,
member_pw VARCHAR(50) not null,
member_name VARCHAR(50)
);


CREATE table cart(
cart_id int AUTO_INCREMENT PRIMARY key,
member_id VARCHAR(50) not null REFERENCES member(member_id),
product_code int not null REFERENCES product(product_code),
amount int ,
size int not null
);



create table order1(
order_idx int AUTO_INCREMENT PRIMARY KEY,
order_id VARCHAR(50) not null REFERENCES member(member_id),
order_name VARCHAR(50),
order_phone VARCHAR(50) not null,
order_product VARCHAR(50) not null,
order_sum int not null,
order_addr1 VARCHAR(50),
order_addr2 VARCHAR(50),
order_addr3 VARCHAR(50),
order_code int not null REFERENCES product(product_code),
order_cart int not null REFERENCES cart(cart_id),
DELIVERY_STATE VARCHAR(20) DEFAULT 'prepared',
date DATETIME DEFAULT now()
);



create table zzim(
zzim_idx int not null AUTO_INCREMENT PRIMARY key,
member_id varchar(50) not null REFERENCES member(member_id),
like_brand varchar(100) not null REFERENCES product(brand),
like_id int REFERENCES product(product_code),
amount int default '1',
delyn char(1) default 'n'
);

drop table zzim;


CREATE table board(
bidx int AUTO_INCREMENT PRIMARY key not null,
title varchar(500) not null,
content varchar(1000) not null,
regdate datetime default now(),
delyn char(1) default 'N',
filename varchar(100) null,
file1 VARCHAR(500) null,
member_id VARCHAR(50)not null REFERENCES member(member_id),
ct_idx int not null REFERENCES category(ct_idx),
hidden int DEFAULT null,
dq_ct_idx int DEFAULT NULL
);

create table category(
ct_idx int primary key not null,
ct_title varchar(30) not null,
member_name VARCHAR(50) null REFERENCES member(member_id)
);

insert into category (ct_idx, ct_title) values('0', 'notice');
insert into category (ct_idx, ct_title) values('1', 'qna');
insert into category (ct_idx, ct_title) values('2', 'dq');


CREATE TABLE dq_ct (
dq_ct_idx int NOT NULL PRIMARY KEY,
dq_ct_title varchar(30) NOT NULL,
member_name varchar(50) DEFAULT NULL
);

insert into dq_ct(dq_ct_idx,dq_ct_title)values('10','환불문의');
insert into dq_ct(dq_ct_idx,dq_ct_title)values('11','교환문의');
insert into dq_ct(dq_ct_idx,dq_ct_title)values('12','AS문의');
insert into dq_ct(dq_ct_idx,dq_ct_title)values('13','배송문의');


