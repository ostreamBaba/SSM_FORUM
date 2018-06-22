package com.viscu.UI.dao;

import com.viscu.UI.domain.ReplyInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyInfoDao {

    //添加一条新的回复消息
    void addReplyInfo(ReplyInfo replyInfo);

    //通过用户名查找所有的消息
    List<ReplyInfo> findAllReplyInfoByUserName(String username);

    //更新消息 已经读 或者 没有读取
    void updateReplyInfoByReplyInfo(ReplyInfo replyInfo);

    //根据某个回复的id删除回复
    void deleteByReplyId(Integer replyId);

    List<ReplyInfo> findAllReplyIsNotReadInfoByUserName(@Param("username") String username,@Param("isRead") Integer isRead);

    ReplyInfo findByReplyIdAndReplyUser(@Param("replyId")Integer replyId,@Param("username")String username);

    ReplyInfo findByReplyInfoId(Integer replyInfoId);

}