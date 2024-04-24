package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.service.LoginServiceIf;
import org.fullstack4.springmvc.util.CookieUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping(value ="/login")
@RequiredArgsConstructor
public class LoginController {

    private final LoginServiceIf loginService;

    @RequestMapping(value="/login",method={RequestMethod.GET})
    public void loginGET(HttpServletRequest req,
                         Model model){
        System.out.println("loginController loginGET입니다.");

        String acc_url = req.getHeader("referer");
        model.addAttribute("acc_url",acc_url);

    }

   @PostMapping("/login")
    public String loginPOST(Model model,
                            @Valid MemberDTO memberDTO,
                            @RequestParam(name="acc_url", defaultValue = "/bbs/list",required = false) String acc_url,
                            @RequestParam(name="auto_login" ,required = false) String auto_login,
                            BindingResult bindingResult,
                            HttpServletRequest req,
                          HttpServletResponse resp,

                          RedirectAttributes redirectAttributes){
       CookieUtil cookieutil = new CookieUtil();
       System.out.println(auto_login);
        if(bindingResult.hasErrors()){
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            return "login/login";
        }

        MemberDTO loginMemberDTO =  loginService.login_info(memberDTO.getUser_id(),memberDTO.getPwd());

        if(loginMemberDTO !=null){
            // true가 기본 : 세션이 없으면 생성하여 리턴, false : 세션이 있으면 리턴, 없으면 생성안함

            if(auto_login !=null) {
                if (auto_login.equals("on")) {
                    Cookie cookie = cookieutil.getCookie("user_id", loginMemberDTO.getUser_id(), "/", 60*60*60);

                    resp.addCookie(cookie);

                }
            }

                HttpSession session = req.getSession();
                session.setAttribute("memberDTO", loginMemberDTO);
                session.setAttribute("user_id", memberDTO.getUser_id());

                model.addAttribute("user_id", loginMemberDTO.getUser_id());
                return "redirect:" + acc_url;

            }
        else{
            System.out.println("아이디 및 비밀번호가 일치하지 않습니다.");
            redirectAttributes.addFlashAttribute("error_msg","아이디 및 비밀번호가 일치하지 않습니다.");
            return"redirect:/login/login";
        }

    }

    @RequestMapping(value="/logout")
    public String logout(HttpServletRequest req,HttpServletResponse resp){
        System.out.println("loginController logout입니다.");
        CookieUtil cookieUtil = new CookieUtil();
        HttpSession session = req.getSession(false);

        if(session!=null){
            cookieUtil.deleteCookie( resp);
            session.invalidate();; // 세션 삭제

        }
        return "redirect:/login/login";
    }

/*    @RequestMapping(value="/join")
    public void joinGET(){


    }

    @PostMapping(value="/join")
    public String joinPOST(){

        return "";
    }*/
}
