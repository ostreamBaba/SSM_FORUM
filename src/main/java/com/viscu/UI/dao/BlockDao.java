package com.viscu.UI.dao;


import com.viscu.UI.domain.Article;
import com.viscu.UI.domain.Block;

import java.util.List;
import java.util.Map;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 描述
 */

public interface BlockDao{

    void addBlock(Block block); //添加主题版块

    List<Article> findAllArticleByBlockId(Integer blockId); //通过id查找版块所有文章

    Block findBlockByBlockId(Integer blockId); //通过id查找某个版块

    List<Block> getAllBlock();

    void updateBlockByBlock(Block block); //更新某个版块实例

    void deleteByBlockId(Integer blockId); //通过id删除某个版块

    void deleteByBlockName(String blockName); //通过名字删除某个版块

    List<Block> findByPage(Map<String,Object> map);
}
