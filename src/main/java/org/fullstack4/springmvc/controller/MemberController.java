package org.fullstack4.springmvc.controller;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@Controller
@RequestMapping(value="/member")
public class MemberController
{

    @GetMapping("/view")
    public void view(@RequestParam(name= "user_id",defaultValue = "0") String user_id,

                     Model model){
        System.out.println("==================");
        System.out.println("user_id : " + user_id);
        System.out.println("member Controller의 view입니다.");
        System.out.println("==================");
        model.addAttribute("idx",user_id);

    }
    @GetMapping("/join")
    public void joinGET(){
        System.out.println("==================");
        System.out.println("member Controller의 regist입니다.");
        System.out.println("==================");

    }
    @PostMapping("/join")
    public String joinPOST(MemberDTO memberDTO,
                             Model model,
                             RedirectAttributes redirectAttributes){
        System.out.println("==================");
        System.out.println("user_id : " + memberDTO.getUser_id());
        System.out.println("bbsDTO : "+ memberDTO.toString());
        System.out.println("member Controller의 regist post 입니다.");
        System.out.println("==================");

        redirectAttributes.addAttribute("key1","key1");

        redirectAttributes.addFlashAttribute("key2","key2"); //유효성검사,에러처리할때사용
        return "redirect:/login/login";
    }
    @GetMapping("/modify")
    public void modifyGET(){
        System.out.println("==================");
        System.out.println("member Controller의 modify get입니다.");
        System.out.println("==================");
    }
    @PostMapping("/modify")
    public void modifyPOST(){
        System.out.println("==================");
        System.out.println("member Controller의 modify post입니다.");
        System.out.println("==================");
    }
    @PostMapping("/leave")
    public void deletePOST(){
        System.out.println("==================");
        System.out.println("member Controller의 delete post입니다.");
        System.out.println("==================");
    }


}
