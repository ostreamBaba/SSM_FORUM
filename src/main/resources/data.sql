# 用户信息表
CREATE TABLE IF NOT EXISTS user(
  user_id INT(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  user_name VARCHAR(30) NOT NULL UNIQUE COMMENT '用户名',
  password VARCHAR(40) NOT NULL DEFAULT '' COMMENT '密码',
  user_email VARCHAR(30) NOT NULL UNIQUE COMMENT '用户邮箱',
  create_time DATETIME NOT NULL COMMENT '用户创建时间',
  last_login_time DATETIME DEFAULT NULL COMMENT '用户最后登入时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
#utf8_general_ci 不区分大小写


CREATE TABLE IF NOT EXISTS article(
  article_id INT(10) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  block_id INT(10) NOT NULL DEFAULT '0' COMMENT '版块id',
  article_user_name VARCHAR(50) NOT NULL DEFAULT '0' COMMENT '写帖子的用户名字',
  article_title VARCHAR(255) NOT NULL COMMENT '帖子标题',
  article_content TEXT NOT NULL COMMENT '帖子正文',
  article_browse_count INT(10) NOT NULL DEFAULT '0' COMMENT '帖子浏览次数',
  article_good_count INT(10) NOT NULL DEFAULT '0' COMMENT '帖子点赞次数',
  article_bad_count INT(10) NOT NULL DEFAULT '0' COMMENT '帖子反对次数',
  article_reply_count INT(10) NOT NULL DEFAULT '0' COMMENT '帖子回复次数',
  atricle_create_time DATETIME NOT NULL COMMENT '创建帖子的时间',
  article_last_reply_time DATETIME COMMENT '帖子最后一个回复的时间',
  PRIMARY KEY (`article_id`)
)ENGINE=InnoDB,DEFAULT CHARSET utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS articleInfo(
  articleInfo_id INT(10) NOT NULL AUTO_INCREMENT COMMENT '帖子回复的id',
  articleInfo_articleId INT(10) NOT NULL DEFAULT 0 COMMENT '帖子的id',
  articleInfo_articleType INT(10) NOT NULL DEFAULT 0 COMMENT '对帖子的态度', #1赞成 #2反对 #0没有做出评价
  articleInfo_articleUserName VARCHAR(30) NOT NULL COMMENT '做出态度的用户名字',
  articleInfo_isRead INT(10) COMMENT '消息是否已读',
  articleInfo_author VARCHAR(30) COMMENT '帖子的作者', #做消息通知
  PRIMARY KEY (`articleInfo_articleId`)
)ENGINE=InnoDB,DEFAULT CHARSET utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS replyInfo(
  replyInfo_id INT(10) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  replyInfo_replyId INT(10) NOT NULL DEFAULT 0 COMMENT '回复的id',
  replyInfo_type INT(10) NOT NULL DEFAULT 0 COMMENT '对回复的态度', #1赞成 #2反对 #0没有做出评价
  replyInfo_username VARCHAR(30) NOT NULL COMMENT '做出态度的用户名字',
  replyInfo_isRead INT(10) COMMENT '消息是否已读', #1为读 #2已读取
  replyInfo_author VARCHAR(30) COMMENT '该帖子的作者', #做消息通知
  PRIMARY KEY (`replyInfo_id`)
)ENGINE=InnoDB,DEFAULT CHARSET utf8 COLLATE utf8_general_ci;


