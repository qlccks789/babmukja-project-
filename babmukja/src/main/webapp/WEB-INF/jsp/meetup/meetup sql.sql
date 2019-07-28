CREATE TABLE tb_meetup
(
    `meet_no`        INT              NOT NULL    AUTO_INCREMENT COMMENT '고유번호', 
    `host`           VARCHAR(100)     NOT NULL    COMMENT '운영자', 
    `left_address`   VARCHAR(100)     NOT NULL    COMMENT '지역', 
    `mem_limit`      VARCHAR(100)     NOT NULL    COMMENT '회원 제한', 
    `total_mem`      VARCHAR(100)     NOT NULL    COMMENT '회원수', 
    `fee`            INT              NOT NULL    COMMENT '회비', 
    `intro`          VARCHAR(4000)    NULL        COMMENT '태그', 
    `title`          VARCHAR(100)     NOT NULL    COMMENT '소개', 
    `location_code`  VARCHAR(100)     NOT NULL    COMMENT '지역코드', 
    PRIMARY KEY (meet_no)
);

ALTER TABLE tb_meetup COMMENT '모임 테이블';

CREATE TABLE tb_meetup_tag
(
    `tag_no`    INT             NOT NULL    AUTO_INCREMENT COMMENT '고유번호', 
    `tag_name`  VARCHAR(100)    NOT NULL    COMMENT '태그', 
    `meet_no`   INT             NOT NULL    COMMENT '모임 번호', 
    PRIMARY KEY (tag_no)
);


------------------------------------------------------------------------------------

ALTER TABLE tb_meetup_tag COMMENT '모임 태그 테이블';

ALTER TABLE tb_meetup_tag
    ADD CONSTRAINT FK_tb_meetup_tag_meet_no_tb_meetup_meet_no FOREIGN KEY (meet_no)
        REFERENCES tb_meetup (meet_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

        
--------------------------------------------------------------------------------------
CREATE TABLE tb_meetup_member
(
    `meet_no`      INT    NOT NULL    COMMENT '모임 번호', 
    `mem_no`       INT    NOT NULL    COMMENT '회원 번호', 
    `meet_mem_no`  INT    NOT NULL    AUTO_INCREMENT COMMENT '모임 참가 번호', 
    PRIMARY KEY (meet_mem_no)
);

ALTER TABLE tb_meetup_member
    ADD CONSTRAINT FK_tb_meetup_member_meet_no_tb_meetup_meet_no FOREIGN KEY (meet_no)
        REFERENCES tb_meetup (meet_no) ON DELETE RESTRICT ON UPDATE RESTRICT;        
        

--------------------------------------------------------------------------------------------
//모임 테이블 따로 뺐음.
      CREATE TABLE tb_meetup_keyword
(
    `keyword_no`       INT    NOT NULL    COMMENT '키워드 번호', 
    `meet_no`          INT    NOT NULL    COMMENT '회원번호', 
    `meet_keyword_no`  INT    NOT NULL    AUTO_INCREMENT COMMENT '키워드', 
    PRIMARY KEY (meet_keyword_no)
);

ALTER TABLE tb_meetup_keyword
    ADD CONSTRAINT FK_tb_meetup_keyword_meet_no_tb_meetup_meet_no FOREIGN KEY (meet_no)
        REFERENCES tb_meetup (meet_no) ON DELETE RESTRICT ON UPDATE RESTRICT;
        
       
--------------------------------------------------------------------------------------
CREATE TABLE tb_meetup_location
(
    `location_no`        INT              NOT NULL    AUTO_INCREMENT COMMENT '고유번호',
    `meet_no`			INT				  NOT NULL	  COMMENT '모임번호',
    `city`           VARCHAR(100)     NOT NULL    COMMENT '운영자', 
    `town`   VARCHAR(100)     NOT NULL    COMMENT '지역', 
    
 
    PRIMARY KEY (location_no)
);

ALTER TABLE tb_meetup_location COMMENT '모임 지역 테이블';

ALTER TABLE tb_meetup_location
    ADD CONSTRAINT FK_tb_meetup_location_meet_no_tb_meetup_meet_no FOREIGN KEY (meet_no)
        REFERENCES tb_meetup (meet_no) ON DELETE RESTRICT ON UPDATE RESTRICT;

desc tb_meetup_location;
-------------------------------------------------------------------------------
 
        

