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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping(value="/member")
@RequiredArgsConstructor

public class MemberController
{

    private final MemberServiceIf memberService;
    @GetMapping("/view")
    public void view(/*@RequestParam(name= "user_id",defaultValue = "0") String user_id,*/

                     Model model,
                     HttpServletRequest req){
    HttpSession session = req.getSession();

    MemberDTO dto =  new MemberDTO();
    dto = (MemberDTO)session.getAttribute("memberDTO");
    String[] list = dto.getInterest().split(",");

    model.addAttribute("interest", list);


    }
    @GetMapping("/join")
    public void joinGET(){

        System.out.println("회원가입");
            
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
    public String modifyPOST(MemberDTO memberDTO
                           ,Model model){
        int result = memberService.member_update(memberDTO);

        if( result>0){
            System.out.println("마이페이지 수정성공");
            return "redirect:/bbs/list";

        }
        else{ 
            System.out.println("마이페이지 수정실패");
            
            return "redirect:/bbs/list";
        }

    }
    @GetMapping("/leave")
    public void deleteGET(){



    }

    @PostMapping("/leave")
    public String deletePOST(@RequestParam(name="user_id")String user_id,
                           @RequestParam(name="pwd")String pwd,
                             HttpServletRequest req){

        System.out.println("아이디 삭제 : " +user_id);
        int result = memberService.member_leave(user_id, pwd);
        System.out.println("아이디 삭제 result : " + result);
        if(result>0){
            HttpSession session = req.getSession(false);
            if(session!=null){
                session.invalidate();; // 세션 삭제
            }
            return "redirect:/login/login";
        }
        else{
            return "/member/leave";
        }

    }


}
