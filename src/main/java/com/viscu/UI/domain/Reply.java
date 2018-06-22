package com.viscu.UI.domain;

import java.sql.Timestamp;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 回复
 */

public class Reply {
    private Integer replyId;

    private Integer replyArticleId;

    private String replyUserName;

    private Integer replyGoodCount;

    private Integer replyBadCount;

    private Timestamp replyCreateTime;

    private String replyText;

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public Integer getReplyArticleId() {
        return replyArticleId;
    }

    public void setReplyArticleId(Integer replyArticleId) {
        this.replyArticleId = replyArticleId;
    }

    public String getReplyUserName() {
        return replyUserName;
    }

    public void setReplyUserName(String replyUserName) {
        this.replyUserName = replyUserName == null ? null : replyUserName.trim();
    }

    public Integer getReplyGoodCount() {
        return replyGoodCount;
    }

    public void setReplyGoodCount(Integer replyGoodCount) {
        this.replyGoodCount = replyGoodCount;
    }

    public Integer getReplyBadCount() {
        return replyBadCount;
    }

    public void setReplyBadCount(Integer replyBadCount) {
        this.replyBadCount = replyBadCount;
    }

    public Timestamp getReplyCreateTime() {
        return replyCreateTime;
    }

    public void setReplyCreateTime(Timestamp replyCreateTime) {
        this.replyCreateTime = replyCreateTime;
    }

    public String getReplyText() {
        return replyText;
    }

    public void setReplyText(String replyText) {
        this.replyText = replyText == null ? null : replyText.trim();
    }
}

/*
public class Reply {

    private Integer replyId; //回复的编号

    private Integer reply_post_id;  //回复帖子的标号

    private String reply_user_name; //回复的用户名字

    private String reply_content; //回复的具体内容

    private Integer reply_good_count; //赞同

    private Integer reply_bad_count; //反对

    private Timestamp repley_create_time; //回复创建的时间

    //getter setter


    @Override
    public String toString() {
        //todo
        return null;
    }
}
*/
