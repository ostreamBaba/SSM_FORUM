package com.viscu.UI.service.impl;


import com.viscu.UI.dao.BlockDao;
import com.viscu.UI.domain.Article;
import com.viscu.UI.domain.Block;
import com.viscu.UI.entiry.PageBean;
import com.viscu.UI.service.BlockService;
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
public class BlockServiceImpl implements BlockService {

    @Autowired(required = false)
    private BlockDao blockDao;

    //添加版块
    @Override
    public void addBlock(Block block) {
        if(block==null){
            throw new IllegalArgumentException("版块不存在");
        }
        this.blockDao.addBlock(block);
    }

    //通过版块名称查找版块
    @Override
    public Block findBlockByBlockId(Integer blockId) {
        if(blockId==null){
            throw new IllegalArgumentException("版块ID不存在");
        }
        return this.blockDao.findBlockByBlockId(blockId);
    }

    //通过版块名字删除版块
    @Override
    public void deleleBlockByBlockName(String blockName) {
        if(blockName==null){
            throw new IllegalArgumentException("版块名不存在");
        }
        this.blockDao.deleteByBlockName(blockName);
    }

    //通过板块id删除版块
    @Override
    public void deleleBlockByBlockId(Integer blockId) {
        if(blockId==null){
            throw new IllegalArgumentException("版块ID不存在");
        }
        this.blockDao.deleteByBlockId(blockId);
    }

    //获得版块所有文章
    @Override
    public List<Article> getAllArticle(Integer blockId) {
        if(blockId==null){
            throw new IllegalArgumentException("版块id不存在");
        }
        return this.blockDao.findAllArticleByBlockId(blockId);
    }

    /*获得所有模块*/
    @Override
    public List<Block> getAllBlock() {
        return this.blockDao.getAllBlock();
    }

    @Override
    public void updateBlock(Block block) {
        if(block==null){
            throw new IllegalArgumentException("该模块并不存在");
        }
        this.blockDao.updateBlockByBlock(block);
    }

    /*@Override
    public PageBean<Block> findByPage(int currentPage, int size) {
        if(currentPage==0||size==0){
            throw new IllegalArgumentException("该参数不合法");
        }

        Map<String,Object> map=new HashMap<String, Object>();
    }*/
}
