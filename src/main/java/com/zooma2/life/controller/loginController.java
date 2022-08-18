package com.zooma2.life.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class loginController {

    @RequestMapping("/main")
    public String dashboard() {
    log.debug("main to index");
        return "/index";
    }

}
