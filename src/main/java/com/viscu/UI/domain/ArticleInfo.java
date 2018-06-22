package com.viscu.UI.domain;

public class ArticleInfo {
    private Integer articleinfoId;

    private Integer articleinfoReplyisread;

    private Integer articleinfoArticleid;

    private Integer articleinfoArticletype;

    private String articleinfoArticleusername;

    private Integer articleinfoIsread;

    private String articleinfoAuthor;

    public Integer getArticleinfoId() {
        return articleinfoId;
    }

    public void setArticleinfoId(Integer articleinfoId) {
        this.articleinfoId = articleinfoId;
    }

    public Integer getArticleinfoReplyisread() {
        return articleinfoReplyisread;
    }

    public void setArticleinfoReplyisread(Integer articleinfoReplyisread) {
        this.articleinfoReplyisread = articleinfoReplyisread;
    }

    public Integer getArticleinfoArticleid() {
        return articleinfoArticleid;
    }

    public void setArticleinfoArticleid(Integer articleinfoArticleid) {
        this.articleinfoArticleid = articleinfoArticleid;
    }

    public Integer getArticleinfoArticletype() {
        return articleinfoArticletype;
    }

    public void setArticleinfoArticletype(Integer articleinfoArticletype) {
        this.articleinfoArticletype = articleinfoArticletype;
    }

    public String getArticleinfoArticleusername() {
        return articleinfoArticleusername;
    }

    public void setArticleinfoArticleusername(String articleinfoArticleusername) {
        this.articleinfoArticleusername = articleinfoArticleusername == null ? null : articleinfoArticleusername.trim();
    }

    public Integer getArticleinfoIsread() {
        return articleinfoIsread;
    }

    public void setArticleinfoIsread(Integer articleinfoIsread) {
        this.articleinfoIsread = articleinfoIsread;
    }

    public String getArticleinfoAuthor() {
        return articleinfoAuthor;
    }

    public void setArticleinfoAuthor(String articleinfoAuthor) {
        this.articleinfoAuthor = articleinfoAuthor == null ? null : articleinfoAuthor.trim();
    }
}