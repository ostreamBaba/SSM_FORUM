package com.viscu.UI.service;



import com.viscu.UI.domain.Article;
import com.viscu.UI.domain.Block;
import com.viscu.UI.entiry.PageBean;

import java.util.List;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 描述 版块太少不设置分页了
 */

public interface BlockService {
    //添加版块
    void addBlock(Block block);

    Block findBlockByBlockId(Integer blockId);

    void deleleBlockByBlockName(String blockName); //通过某个版块的名字删除版块

    void deleleBlockByBlockId(Integer blockId); //通过某个版块的id删除版块

    void updateBlock(Block block);

    List<Article> getAllArticle(Integer blockId); //获得某个版块所有文章

    List<Block> getAllBlock();

    //PageBean<Block> findByPage(int currentPage,int size);
}
