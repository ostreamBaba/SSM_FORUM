package com.viscu.UI.controller;

import com.viscu.UI.domain.Article;
import com.viscu.UI.domain.Block;
import com.viscu.UI.service.ArticleService;
import com.viscu.UI.service.BlockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.List;

/**
 * @ Create by ostreamBaba on 18-6-4
 * @ 版块
 */

@Controller
@RequestMapping("block")
public class BlockController {

    @Autowired
    private BlockService blockService;

    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "/new")
    @ResponseBody
    public String block_new(String blockName,String blockDescribe){

        Block block=new Block();
        block.setBlockName(blockName);
        block.setBlockDescribe(blockDescribe);
        blockService.addBlock(block);
        return "success";
    }

    //查找某版块下所有文章
    @RequestMapping(value = "/block-{blockId}" /*,method = RequestMethod.POST*/)
    public String block_browse(@PathVariable(value="blockId")Integer blockId,HttpServletRequest request){
        Block block=blockService.findBlockByBlockId(blockId);
        List<Article> articles=articleService.findArticleAllByArticleId(blockId);
        Collections.reverse(articles);
        request.setAttribute("articles",articles);
        request.setAttribute("block",block);
        return "block/blockInfo";
    }

    @RequestMapping(value = "/getBlock")
    public ModelAndView block_getAll(ModelAndView mv){
        List<Block> blocks=blockService.getAllBlock();
        mv.setViewName("/admin/blockManager");
        mv.addObject("blocks",blocks);
        return mv;
    }

    @RequestMapping(value = "/findById")
    @ResponseBody
    public Block findById(Integer id){
        Block block=blockService.findBlockByBlockId(id);
        if(block==null){
            return new Block();
        }
        return block;
    }

    @RequestMapping(value = "/deleteById")
    @ResponseBody
    public String deleteById(Integer id){
        blockService.deleleBlockByBlockId(id); //删除版块 删除版块下所有文章 所有回复(该功能暂时不写)
        return "success";
    }

}
