package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.service.BbsServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Log4j2
@Controller
@RequestMapping(value="/bbs")
@RequiredArgsConstructor
public class BbsController {


    private final BbsServiceIf bbsServiceIf;
    @GetMapping("/list")
    public void list(Model model){


        List<BbsDTO> bbsDTOList = new ArrayList<>();
        bbsDTOList = bbsServiceIf.ListAll();
        model.addAttribute("bbsList",bbsDTOList);

    }
    @GetMapping("/view")
    public void view(@RequestParam(name= "no",defaultValue = "0") int no,

                     Model model){


        BbsDTO dto = bbsServiceIf.view(no);


        model.addAttribute("dto",dto);

    }
    @GetMapping("/regist")
    public void registGET(){

    }
    @PostMapping("/regist")
    public String registPOST(@Valid BbsDTO bbsDTO, //체크된 값을 가져와서 binding을 시켜줌
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes){


        if(bindingResult.hasErrors()){
            System.out.println("regist post에 error발생");
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());// 휘발성으로 쓰기 위해 addFlashAttribute사용
            redirectAttributes.addFlashAttribute("dto",bbsDTO);
            return "redirect:/bbs/regist";
        }

        int result = bbsServiceIf.regist(bbsDTO);
        if(result>0){
            return "redirect:/bbs/list";
        }else{
            return "/bbs/regist";
        }

/*        redirectAttributes.addAttribute("key1","key1");

        redirectAttributes.addFlashAttribute("key2","key2"); //유효성검사,에러처리할때사용*/

    }
    @GetMapping("/modify")
    public void modifyGET(@RequestParam(name= "no",defaultValue = "0") int no,

                          Model model){

        BbsDTO dto = bbsServiceIf.view(no);

        model.addAttribute("bbs",dto);

    }
    @PostMapping("/modify")
    public String modifyPOST(BbsDTO bbsDTO,
                           Model model,
                           RedirectAttributes redirectAttributes){

        int result = bbsServiceIf.modify(bbsDTO);

        if(result>0){
            return "redirect:/bbs/view?no="+bbsDTO.getNo();
        }else{
            return "redirect:/bbs/list";
        }
    }
    @PostMapping("/delete")
    public String deletePOST(@RequestParam(name= "no",defaultValue = "0") int no
    ){


        int result = bbsServiceIf.delete(no);
        if(result>0){
            return "redirect:/bbs/list";
        }else{
            return "redirect:/bbs/view?no="+no;
        }
    }
    @GetMapping("/list2")
    public void list2(String s1, int i2){

    }

}
