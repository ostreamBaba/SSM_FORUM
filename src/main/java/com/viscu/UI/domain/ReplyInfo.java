package com.viscu.UI.domain;

public class ReplyInfo {
    private Integer replyinfoId;

    private Integer replyinfoReplyid;

    private Integer replyinfoType;

    private String replyinfoUsername;

    private Integer replyinfoIsread;

    private String replyinfoAuthor;

    public Integer getReplyinfoId() {
        return replyinfoId;
    }

    public void setReplyinfoId(Integer replyinfoId) {
        this.replyinfoId = replyinfoId;
    }

    public Integer getReplyinfoReplyid() {
        return replyinfoReplyid;
    }

    public void setReplyinfoReplyid(Integer replyinfoReplyid) {
        this.replyinfoReplyid = replyinfoReplyid;
    }

    public Integer getReplyinfoType() {
        return replyinfoType;
    }

    public void setReplyinfoType(Integer replyinfoType) {
        this.replyinfoType = replyinfoType;
    }

    public String getReplyinfoUsername() {
        return replyinfoUsername;
    }

    public void setReplyinfoUsername(String replyinfoUsername) {
        this.replyinfoUsername = replyinfoUsername == null ? null : replyinfoUsername.trim();
    }

    public Integer getReplyinfoIsread() {
        return replyinfoIsread;
    }

    public void setReplyinfoIsread(Integer replyinfoIsread) {
        this.replyinfoIsread = replyinfoIsread;
    }

    public String getReplyinfoAuthor() {
        return replyinfoAuthor;
    }

    public void setReplyinfoAuthor(String replyinfoAuthor) {
        this.replyinfoAuthor = replyinfoAuthor == null ? null : replyinfoAuthor.trim();
    }
}