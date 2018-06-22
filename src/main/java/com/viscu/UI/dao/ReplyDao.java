package com.viscu.UI.dao;


import com.viscu.UI.domain.Reply;
import com.viscu.UI.entiry.PageBean;

import java.util.List;
import java.util.Map;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 描述
 */


public interface ReplyDao {

    Integer insertAndGetId(Reply reply);

    void addReply(Reply reply); //增加回复

    List<Reply> findReplyListByArticleId(Integer ArticleId); //查找指定文章的所有回复

    void deleteReplyById(Integer id); //通过id来删除回复

    Reply findReplyById(Integer id); //通过id查找回复

    void updateReply(Reply reply);

    List<Reply> findByPage(Map<String,Object> map);

    List<Reply> findAllReply();
}
