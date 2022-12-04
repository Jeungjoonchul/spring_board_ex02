use gb;
create table spring_user(
	userid varchar(300) primary key,
    userpw varchar(300) not null,
	username varchar(300) not null
);
create table spring_board(
	boardnum bigint primary key auto_increment,
    boardtitle varchar(300) not null,
    boardcontents varchar(6000) not null,
    userid varchar(300),
    regdate datetime default now(),
    updatedate datetime default now()
);

create table spring_reply(
	replynum bigint primary key auto_increment,
    userid varchar(300),
    replycontents varchar(2000) not null,
    regdate datetime default now(),
    updatedate datetime default now(),
    boardnum bigint
);

select * from spring_user;

insert into spring_board (boardtitle,boardcontents,userid) values('테스트 제목1','테스트 내용1','apple');
insert into spring_board (boardtitle,boardcontents,userid) values('테스트 제목2','테스트 내용2','banana');
insert into spring_board (boardtitle,boardcontents,userid) values('테스트 제목3','테스트 내용3','cherry');

select * from spring_board;

insert into spring_board (boardtitle, boardcontents, userid) (select boardtitle,boardcontents,userid from spring_board);

insert into spring_reply (userid,replycontents,boardnum) values('apple','사과가 작성한 댓글',262116);
insert into spring_reply (userid,replycontents,boardnum) values('banana','하나가 작성한 댓글',262116);
insert into spring_reply (userid,replycontents,boardnum) values('cherry','체리가 작성한 댓글',262116);


