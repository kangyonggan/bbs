package com.kangyonggan.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author kangyonggan
 * @since 16/5/2
 */
@Controller
@RequestMapping("admin")
public class AdminIndexController {

    private static final String PATH_ROOT = "admin/index";
    private static final String PATH_INDEX = PATH_ROOT + "/index";

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("menu", "admin");
        return PATH_INDEX;
    }
}
