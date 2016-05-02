package com.kangyonggan.controller.web;

import com.kangyonggan.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 发表帖子
 *
 * @author kangyonggan
 * @since 16/5/2
 */
@Controller
@RequestMapping("reply")
public class ReplyController {

    @Autowired
    private ReplyService replyService;

    /**
     * 删除评论
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/delete", method = RequestMethod.GET)
    @ResponseBody
    public String delete(@PathVariable("id") Long id) {
        replyService.delete(id);
        return "true";
    }

}
