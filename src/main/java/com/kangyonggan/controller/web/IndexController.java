package com.kangyonggan.controller.web;

import com.kangyonggan.model.User;
import com.kangyonggan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @Autowired
    private UserService userService;

    @RequestMapping
    public String index(Model model) {
        try {
            User user = userService.getUser(1L);
            model.addAttribute("user", user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return PATH_INDEX;
    }

}
