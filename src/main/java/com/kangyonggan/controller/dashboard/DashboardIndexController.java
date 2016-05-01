package com.kangyonggan.controller.dashboard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author kangyonggan
 * @since 16/4/29
 */
@Controller
@RequestMapping("dashboard")
public class DashboardIndexController {

    private static final String PATH_ROOT = "dashboard/index";
    private static final String PATH_INDEX = PATH_ROOT + "/index";

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return PATH_INDEX;
    }

}
