package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import org.fullstack4.springmvc.dto.BbsReplyDTO;
import org.fullstack4.springmvc.service.BbsReplyServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping(value="/bbsReply")
@RequiredArgsConstructor
public class BbsReplyController {
    private final BbsReplyServiceIf bbsReplyServiceIf;

    @GetMapping("/regist")
    public void replyRegistGET(){
        System.out.println("등록 get");
    }
    @PostMapping("/regist")
    public String replyRegistPOST(@Valid BbsReplyDTO bbsReplyDTO, //체크된 값을 가져와서 binding을 시켜줌
                                  BindingResult bindingResult,
                                  RedirectAttributes redirectAttributes){
        System.out.println("댓글 post");

        System.out.println("bbsreply dto : " + bbsReplyDTO.toString());
        if(bindingResult.hasErrors()){
            System.out.println("regist post에 error발생");
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());// 휘발성으로 쓰기 위해 addFlashAttribute사용
            redirectAttributes.addFlashAttribute("dto",bbsReplyDTO);
            return "redirect:/bbs/view?no="+bbsReplyDTO.getBbs_idx();
        }

        int result = bbsReplyServiceIf.replyRegist(bbsReplyDTO);
        System.out.println("글쓰기 result : " + result);
        if(result>0){
            return "redirect:/bbs/view?no="+bbsReplyDTO.getBbs_idx();
        }else{
            return "/bbs/view?no="+bbsReplyDTO.getBbs_idx();
        }

/*        redirectAttributes.addAttribute("key1","key1");

        redirectAttributes.addFlashAttribute("key2","key2"); //유효성검사,에러처리할때사용*/

    }

}
