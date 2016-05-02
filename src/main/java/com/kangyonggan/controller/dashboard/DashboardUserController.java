package com.kangyonggan.controller.dashboard;

import com.kangyonggan.model.User;
import com.kangyonggan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 工作台用户管理
 *
 * @author kangyonggan
 * @since 16/4/30
 */
@Controller
@RequestMapping("dashboard/user")
public class DashboardUserController {

    private static final String PATH_ROOT = "dashboard/user";
    private static final String PATH_PROFILE = PATH_ROOT + "/profile";
    private static final String PATH_PASSWORD = PATH_ROOT + "/password";

    @Autowired
    private UserService userService;

    @RequestMapping(value = "{id:[\\d]+}/profile", method = RequestMethod.GET)
    public String profile(@PathVariable("id") Long id, Model model) {
        User user = userService.getUser(id);

        model.addAttribute("user", user);
        return PATH_PROFILE;
    }

    @RequestMapping(value = "{id:[\\d]+}/profile", method = RequestMethod.POST)
    public String profile(@ModelAttribute("user") User user) {
        userService.update(user);
        return "redirect:profile";
    }

    @RequestMapping(value = "{id:[\\d]+}/password", method = RequestMethod.GET)
    public String password(@PathVariable("id") Long id, Model model) {
        User user = userService.getUser(id);

        model.addAttribute("user", user);
        return PATH_PASSWORD;
    }

    @RequestMapping(value = "{id:[\\d]+}/password", method = RequestMethod.POST)
    public String password(@ModelAttribute("user") User user) {
        User u = userService.getUser(user.getId());
        user.setRealname(u.getRealname());
        userService.update(user);
        return "redirect:password";
    }

}
