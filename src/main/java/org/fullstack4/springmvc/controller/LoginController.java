package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.service.LoginServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@Controller
@RequestMapping(value ="/login")
@RequiredArgsConstructor
public class LoginController {

    private final LoginServiceIf loginService;
    @RequestMapping(value="/login",method={RequestMethod.GET})
    public void loginGET(){
        System.out.println("loginController loginGET입니다.");

    }

   @PostMapping("/login")
    public String loginPOST(Model model,
                          @SessionAttribute(name="user_id",required = false) String user_id,
                          String pwd,
                          RedirectAttributes redirectAttributes){



       MemberDTO list =  loginService.login_info(user_id,pwd);

        if(list !=null){
            model.addAttribute("user_id",list.getUser_id());
            return "redirect:/bbs/list";
        }
        else{
            return"/login/login";
        }

    }

    @RequestMapping(value="/logout")
    public String logout(){
        System.out.println("loginController logout입니다.");

        return "redirect:/bbs/list";
    }
}
