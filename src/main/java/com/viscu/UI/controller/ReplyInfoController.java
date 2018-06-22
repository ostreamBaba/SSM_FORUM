package com.viscu.UI.controller;

import com.viscu.UI.service.ReplyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @ Create by ostreamBaba on 18-6-16
 * @ √Ë ˆ
 */

@Controller
@RequestMapping("/replyInfo")
public class ReplyInfoController {

    @Autowired
    private ReplyInfoService replyInfoService;

    @ModelAttribute
    public void ReplyInfoModel(Model model){

    }

    @RequestMapping("/add")
    public ModelAndView replyInfo_add(Model model){
        ModelAndView mv=new ModelAndView();
        return mv;
    }

}
