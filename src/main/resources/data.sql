# �û���Ϣ��
CREATE TABLE IF NOT EXISTS user(
  user_id INT(10) NOT NULL AUTO_INCREMENT COMMENT '�û�id',
  user_name VARCHAR(30) NOT NULL UNIQUE COMMENT '�û���',
  password VARCHAR(40) NOT NULL DEFAULT '' COMMENT '����',
  user_email VARCHAR(30) NOT NULL UNIQUE COMMENT '�û�����',
  create_time DATETIME NOT NULL COMMENT '�û�����ʱ��',
  last_login_time DATETIME DEFAULT NULL COMMENT '�û�������ʱ��',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
#utf8_general_ci �����ִ�Сд


CREATE TABLE IF NOT EXISTS article(
  article_id INT(10) NOT NULL AUTO_INCREMENT COMMENT '����id',
  block_id INT(10) NOT NULL DEFAULT '0' COMMENT '���id',
  article_user_name VARCHAR(50) NOT NULL DEFAULT '0' COMMENT 'д���ӵ��û�����',
  article_title VARCHAR(255) NOT NULL COMMENT '���ӱ���',
  article_content TEXT NOT NULL COMMENT '��������',
  article_browse_count INT(10) NOT NULL DEFAULT '0' COMMENT '�����������',
  article_good_count INT(10) NOT NULL DEFAULT '0' COMMENT '���ӵ��޴���',
  article_bad_count INT(10) NOT NULL DEFAULT '0' COMMENT '���ӷ��Դ���',
  article_reply_count INT(10) NOT NULL DEFAULT '0' COMMENT '���ӻظ�����',
  atricle_create_time DATETIME NOT NULL COMMENT '�������ӵ�ʱ��',
  article_last_reply_time DATETIME COMMENT '�������һ���ظ���ʱ��',
  PRIMARY KEY (`article_id`)
)ENGINE=InnoDB,DEFAULT CHARSET utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS articleInfo(
  articleInfo_id INT(10) NOT NULL AUTO_INCREMENT COMMENT '���ӻظ���id',
  articleInfo_articleId INT(10) NOT NULL DEFAULT 0 COMMENT '���ӵ�id',
  articleInfo_articleType INT(10) NOT NULL DEFAULT 0 COMMENT '�����ӵ�̬��', #1�޳� #2���� #0û����������
  articleInfo_articleUserName VARCHAR(30) NOT NULL COMMENT '����̬�ȵ��û�����',
  articleInfo_isRead INT(10) COMMENT '��Ϣ�Ƿ��Ѷ�',
  articleInfo_author VARCHAR(30) COMMENT '���ӵ�����', #����Ϣ֪ͨ
  PRIMARY KEY (`articleInfo_articleId`)
)ENGINE=InnoDB,DEFAULT CHARSET utf8 COLLATE utf8_general_ci;


CREATE TABLE IF NOT EXISTS replyInfo(
  replyInfo_id INT(10) NOT NULL AUTO_INCREMENT COMMENT '��Ϣid',
  replyInfo_replyId INT(10) NOT NULL DEFAULT 0 COMMENT '�ظ���id',
  replyInfo_type INT(10) NOT NULL DEFAULT 0 COMMENT '�Իظ���̬��', #1�޳� #2���� #0û����������
  replyInfo_username VARCHAR(30) NOT NULL COMMENT '����̬�ȵ��û�����',
  replyInfo_isRead INT(10) COMMENT '��Ϣ�Ƿ��Ѷ�', #1Ϊ�� #2�Ѷ�ȡ
  replyInfo_author VARCHAR(30) COMMENT '�����ӵ�����', #����Ϣ֪ͨ
  PRIMARY KEY (`replyInfo_id`)
)ENGINE=InnoDB,DEFAULT CHARSET utf8 COLLATE utf8_general_ci;


