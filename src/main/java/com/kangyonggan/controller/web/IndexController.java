package com.kangyonggan.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author kangyonggan
 * @since 16/4/29
 */
@Controller
@RequestMapping
public class IndexController {

    private static final String PATH_ROOT = "web/index";
    private static final String PATH_INDEX = PATH_ROOT + "/index";

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        return PATH_INDEX;
    }

}
