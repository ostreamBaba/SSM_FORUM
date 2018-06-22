package com.viscu.UI.domain;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 帖子实体类
 */

import java.sql.Timestamp;

public class Article {
    private Integer articleId;

    private Integer blockId;

    private String articleUserName;

    private String articleTitle;

    private Integer articleBrowseCount;

    private Integer articleGoodCount;

    private Integer articleBadCount;

    private Integer articleReplyCount;

    private Timestamp articleCreateTime;

    private Timestamp articleLastReplyTime;

    private String articleContent;

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getBlockId() {
        return blockId;
    }

    public void setBlockId(Integer blockId) {
        this.blockId = blockId;
    }

    public String getArticleUserName() {
        return articleUserName;
    }

    public void setArticleUserName(String articleUserName) {
        this.articleUserName = articleUserName == null ? null : articleUserName.trim();
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle == null ? null : articleTitle.trim();
    }

    public Integer getArticleBrowseCount() {
        return articleBrowseCount;
    }

    public void setArticleBrowseCount(Integer articleBrowseCount) {
        this.articleBrowseCount = articleBrowseCount;
    }

    public Integer getArticleGoodCount() {
        return articleGoodCount;
    }

    public void setArticleGoodCount(Integer articleGoodCount) {
        this.articleGoodCount = articleGoodCount;
    }

    public Integer getArticleBadCount() {
        return articleBadCount;
    }

    public void setArticleBadCount(Integer articleBadCount) {
        this.articleBadCount = articleBadCount;
    }

    public Integer getArticleReplyCount() {
        return articleReplyCount;
    }

    public void setArticleReplyCount(Integer articleReplyCount) {
        this.articleReplyCount = articleReplyCount;
    }

    public Timestamp getArticleCreateTime() {
        return articleCreateTime;
    }

    public void setArticleCreateTime(Timestamp atricleCreateTime) {
        this.articleCreateTime = atricleCreateTime;
    }

    public Timestamp getArticleLastReplyTime() {
        return articleLastReplyTime;
    }

    public void setArticleLastReplyTime(Timestamp articleLastReplyTime) {
        this.articleLastReplyTime = articleLastReplyTime;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent == null ? null : articleContent.trim();
    }

    @Override
    public String toString() {
        return "articleId: "+articleId
                +" article_content: "+articleContent;
    }
}






/*
public class Article {
    private Integer article_id; //文章id

    private Integer block_id; //属于哪个版块

    private String article_title; //文章标题

    private String article_content;  //文章内容

    private String article_user_name; //文章的作者名字

    private Integer article_browse_count; //浏览次数

    private Integer article_good_count; //点赞次数

    private Integer article_bad_count; //反对次数

    private Integer article_reply_count; //回复的数目

    private List<Reply> replies; //回复的数目 一对多关系

    private Timestamp article_create_time; //帖子创建的时间

    private Timestamp article_last_reply_time; //帖子最后回复的时间(最后一个用户)

    //getter setter


    @Override
    public String toString() {
        //todo
        return null;

    }
}
*/
