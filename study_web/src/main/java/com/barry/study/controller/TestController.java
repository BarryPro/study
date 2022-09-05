package com.barry.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/test")
public class TestController {
    @RequestMapping(value = "/view")
    public String view(){
        return "test";
    }
}
