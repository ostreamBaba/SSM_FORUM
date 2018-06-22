package com.viscu.UI.service;

import com.viscu.UI.domain.ReplyInfo;

import java.util.List;

/**
 * @ Create by ostreamBaba on 18-6-16
 * @ √Ë ˆ
 */
public interface ReplyInfoService {

    void addReplyInfo(ReplyInfo replyInfo);

    List<ReplyInfo> findAllReplyInfoByUserName(String username);

    List<ReplyInfo> findAllReplyIsNotReadInfoByUserName(String username,Integer isRead);

    void updateReplyInfoByReplyInfo(ReplyInfo replyInfo);

    void deleteReplyInfoByReplyInfo(Integer replyId);

    ReplyInfo findByReplyIdAndReplyUser(Integer replyId, String username);

    ReplyInfo findByReplyInfoId(Integer replyInfoId);
}
