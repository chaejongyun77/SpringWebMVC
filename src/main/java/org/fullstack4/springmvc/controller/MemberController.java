package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.service.LoginServiceIf;
import org.fullstack4.springmvc.service.MemberServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping(value="/member")
@RequiredArgsConstructor

public class MemberController
{

    private final MemberServiceIf memberService;
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


    }
    @PostMapping("/join")
    public String joinPOST(@Valid MemberDTO memberDTO,
                           BindingResult bindingResult,
                             Model model,
                             RedirectAttributes redirectAttributes){

        if(bindingResult.hasErrors()){
            System.out.println("회원가입 post에 error발생");
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());// 휘발성으로 쓰기 위해 addFlashAttribute사용
            redirectAttributes.addFlashAttribute("dto",memberDTO);
            return "redirect:/member/join";
        }


        int result = memberService.member_join(memberDTO);
        if( result>0){
            return "redirect:/login/login";
        }
        else{
            redirectAttributes.addFlashAttribute("dto",memberDTO);
            return "/member/join";
        }




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
    @GetMapping("/leave")
    public void deletePOST(){



    }

    @PostMapping("/leave")
    public String deletePOST(@RequestParam(name="user_id")String user_id,
                           @RequestParam(name="pwd")String pwd){

        int result = memberService.member_leave(user_id, pwd);
        if(result>0){

            return "redirect:/login/login";
        }
        else{
            return "/member/leave";
        }

    }


}
