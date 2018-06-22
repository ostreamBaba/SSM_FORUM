package com.viscu.UI.service.impl;

import com.viscu.UI.dao.ReplyDao;
import com.viscu.UI.domain.Reply;
import com.viscu.UI.entiry.PageBean;
import com.viscu.UI.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 描述
 */

@Service
public class ReplyServiceImpl implements ReplyService {

    @Autowired(required = false)
    private ReplyDao replyDao;

    //添加回复
    @Override
    public void addReply(Reply reply) {
        if(reply==null){
            throw new IllegalArgumentException("回复不存在！");
        }
        this.replyDao.addReply(reply);
    }

    //删除某个回复
    @Override
    public void deleteReplyById(Integer id) {
        if(id==null){
            throw new IllegalArgumentException("回复id不存在");
        }
        this.replyDao.deleteReplyById(id);
    }

    //获得某篇文章的所有回复
    @Override
    public List<Reply> getAllReply(Integer articleId) {
        if(articleId==null){
            throw new IllegalArgumentException("文章id不存在");
        }
        return this.replyDao.findReplyListByArticleId(articleId);
    }

    @Override
    public Reply findReplyByReplyId(Integer replyId) {
        if(replyId==null){
            throw new IllegalArgumentException("回复id不存在");
        }
        return this.replyDao.findReplyById(replyId);
    }

    @Override
    public Integer insertAndGetId(Reply reply) {
        if(reply==null){
            throw new IllegalArgumentException("回复不存在！");
        }
        return this.replyDao.insertAndGetId(reply);
    }

    @Override
    public void updateReply(Reply reply) {
        if(reply==null){
            throw new IllegalArgumentException("回复不存在！");
        }
        this.replyDao.updateReply(reply);
    }

    @Override
    public PageBean<Reply> findByPage(int currentPage,int size) {
        if(currentPage==0 || size==0){
            throw new IllegalArgumentException("参数不合法");
        }

        PageBean<Reply> replyPageBean=new PageBean<Reply>();

        replyPageBean.setCurrentPage(currentPage);
        replyPageBean.setPageSize(size);

        List<Reply> replies=replyDao.findAllReply();
        int totalCount=replies.size();

        replyPageBean.setTotalCount(totalCount);

        double tc=(double)totalCount;
        Double totalPage=Math.ceil(tc/size);

        replyPageBean.setTotalPage(totalPage.intValue());

        Map<String,Object> map=new HashMap<String,Object>();
        map.put("start",(currentPage-1)*size);
        map.put("size",size);

        replies=replyDao.findByPage(map);

        replyPageBean.setLists(replies);

        return replyPageBean;

    }


}
