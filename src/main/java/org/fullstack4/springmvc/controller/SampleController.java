package org.fullstack4.springmvc.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.swing.*;

@Log4j2
@Controller
//requestmaping("/sample")
public class SampleController {
    @GetMapping("/hello") // ->requestmapping이 붙으면 /sample/hello 경로
    public void hello(){
        System.out.println("=============");
        System.out.println("hello");
        System.out.println("=============");
        log.info("hello");
    }

    //@requestmapping(get+post)


}
