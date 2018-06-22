package com.viscu.UI.domain;

/**
 * @ Create by ostreamBaba on 18-5-29
 * @ 版块
 */

public class Block {
    private Integer blockId;

    private String blockDescribe;

    private String blockName;

    private Integer blockArticleNum;

    public Integer getBlockId() {
        return blockId;
    }

    public void setBlockId(Integer blockId) {
        this.blockId = blockId;
    }

    public String getBlockDescribe() {
        return blockDescribe;
    }

    public void setBlockDescribe(String blockDescribe) {
        this.blockDescribe = blockDescribe == null ? null : blockDescribe.trim();
    }

    public String getBlockName() {
        return blockName;
    }

    public void setBlockName(String blockName) {
        this.blockName = blockName == null ? null : blockName.trim();
    }

    public Integer getBlockArticleNum() {
        return blockArticleNum;
    }

    public void setBlockArticleNum(Integer blockArticleNum) {
        this.blockArticleNum = blockArticleNum;
    }

    @Override
    public String toString() {
        return "Block {" +
                "blockId = " + blockId +
                ", blockName = '" + blockName + '\'' +
                ", blockDescribe = '" + blockDescribe + '\'' +
                ", blockArticleNum = " + blockArticleNum + "}";
    }

}


/*public class Block {

    private Integer block_id;

    private String block_name; //版块的名称

    private String block_describe; //版块的描述

    private Integer block_article_num; //版块文章的数量

    private List<Article> articles; //版块文章的列表

    @Override
    public String toString() {
        return "Block {" +
                "blockId = " + block_id +
                ", blockName = '" + block_name + '\'' +
                ", blockDescribe = '" + block_describe + '\'' +
                ", blockArticleNum = " + block_article_num + "}";
    }
}*/
