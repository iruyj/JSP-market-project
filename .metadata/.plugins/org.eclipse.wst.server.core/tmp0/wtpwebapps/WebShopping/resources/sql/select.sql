select * from product;

desc product;

select p_id from product;

insert into product values("P1231","메모롤 테이프","6500","원하는 길이만큼 컷팅해 사용하는 점착형 메모지","sience","2020","1","good","P1231.png");
insert into product values("P1232","고3 과학 요점필기","6500","과학 수능 비법서 - 철저한 필기노트", "sience","2020","1","fair","P1232.png");

update product set p_fileName = "P1232.jpg" where p_fileName = "P1232.png";

