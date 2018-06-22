package com.viscu.UI.service;

import com.viscu.UI.domain.Reply;
import com.viscu.UI.entiry.PageBean;

import java.util.List;
import java.util.Map;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 描述
 */
public interface ReplyService {

    void addReply(Reply reply); //添加回复

    List<Reply> getAllReply(Integer articleId); //查找文章的所有回复

    void deleteReplyById(Integer id);

    Reply findReplyByReplyId(Integer replyId);

    Integer insertAndGetId(Reply reply);

    void updateReply(Reply reply);

    PageBean<Reply> findByPage(int CurrentPage, int size);

    /*List<Reply> findAllReply();*/
}
