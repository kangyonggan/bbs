package com.kangyonggan.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author kangyonggan
 * @since 16/4/29
 */
@Controller
@RequestMapping
public class IndexController {

    private static final String PATH_ROOT = "web/index";
    private static final String PATH_INDEX = PATH_ROOT + "/index";

    @RequestMapping
    public String index() {
        return PATH_INDEX;
    }

}
