package org.fullstack4.springmvc.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.swing.*;

@Log4j2
@Controller
public class SampleController {
    @GetMapping("/hello")
    public void hello(){
        System.out.println("=============");
        System.out.println("hello");
        System.out.println("=============");
        log.info("hello");
    }


}
