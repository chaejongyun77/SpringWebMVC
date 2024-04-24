package org.fullstack4.springmvc.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.BbsReplyDTO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.PageResponseDTO;
import org.fullstack4.springmvc.service.BbsReplyServiceIf;
import org.fullstack4.springmvc.service.BbsServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping(value="/bbs")
@RequiredArgsConstructor
public class BbsController {


    private final BbsServiceIf bbsServiceIf;
    private final BbsReplyServiceIf bbsReplyServiceIf;
    @GetMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO,
                     BindingResult bindingResult,
                     Model model,
                     RedirectAttributes redirectAttributes){


        if(bindingResult.hasErrors()){
            System.out.println("bbs controller list error");
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
        }
        System.out.println( pageRequestDTO.getSearch_word() );
        PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.bbsListByPage(pageRequestDTO);

        model.addAttribute("responseDTO",responseDTO);

      /*  List<BbsDTO> bbsDTOList = new ArrayList<>();
        bbsDTOList = bbsServiceIf.ListAll();
        model.addAttribute("bbsList",bbsDTOList);*/

    }


    /*public void list(Model model){


        List<BbsDTO> bbsDTOList = new ArrayList<>();
        bbsDTOList = bbsServiceIf.ListAll();
        model.addAttribute("bbsList",bbsDTOList);

    }*/
    @GetMapping("/view")
    public void view(@RequestParam(name= "no",defaultValue = "0") int no,

                     Model model){


        BbsDTO dto = bbsServiceIf.view(no);
        List<BbsReplyDTO> bbsReplyDTO = bbsReplyServiceIf.replyList(no);

        model.addAttribute("bbsReplyDTO",bbsReplyDTO);
        model.addAttribute("dto",dto);

    }
    @GetMapping("/regist")
    public void registGET(){
        System.out.println("등록 get");
    }
    @PostMapping("/regist")
    public String registPOST(@Valid BbsDTO bbsDTO, //체크된 값을 가져와서 binding을 시켜줌
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes){
        System.out.println("등록 post");

        if(bindingResult.hasErrors()){
            System.out.println("regist post에 error발생");
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());// 휘발성으로 쓰기 위해 addFlashAttribute사용
            redirectAttributes.addFlashAttribute("dto",bbsDTO);
            return "redirect:/bbs/regist";
        }

        int result = bbsServiceIf.regist(bbsDTO);
        System.out.println("글쓰기 result : " + result);
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

        System.out.println("modify display_date : " +bbsDTO.getDisplay_date());
        if(result>0){
            return "redirect:/bbs/view?no="+bbsDTO.getNo();
        }else{
            return "redirect:/bbs/list";
        }
    }
    @PostMapping("/delete")
    public String deletePOST(@RequestParam(name= "no",defaultValue = "0") int no
    ){

        System.out.println("게시판 ㅂ삭제 번호 :"+no);

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
    @RequestMapping(value="/fileUpload",method= RequestMethod.GET)
        public String fileUploadGET(){
            return "/bbs/fileUpload";
        }

    @RequestMapping(value="/fileUpload",method=RequestMethod.POST)

    public String fileUploadPost(
            @RequestParam("file")MultipartFile file
    ){
        String uploadFolder ="D:\\java4\\spring\\springweb\\springmvc\\src\\main\\webapp\\Upload";
        String fileRealName = file.getOriginalFilename();

        long size= file.getSize();
        String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length()); // 엑셀파일/xxx.xls => 파일 확장자
    /*    System.out.println("=========예옛날파일");
        System.out.println("uploadFolder" +uploadFolder);
        System.out.println("fileRealName" + fileRealName);
        System.out.println("size " +size);
        System.out.println("fileExt" +fileExt);
*/
        //새로운 파일명 생성
        UUID uuid = UUID.randomUUID();
        String[] uuids = uuid.toString().split("-");
        String newName = uuids[0];

    /*    System.out.println("=========uuid파일");
        System.out.println("uuid" +uuid);
        System.out.println("uuids" + uuids);
        System.out.println("newName " +newName);*/

        File saveFile = new File(uploadFolder + "\\"+newName + fileExt);
        System.out.println("파일명 : "+ uploadFolder + "\\"+newName + fileExt);

        try{
            file.transferTo(saveFile);
        }catch(IllegalStateException e){
            e.printStackTrace();
        }
        catch(Exception e){
            e.printStackTrace();
        }

        return "/bbs/fileUpload";


    }

    @RequestMapping(value="/fileUpload2",method=RequestMethod.POST)

    public String fileUploadPost2(
            MultipartHttpServletRequest files)
    {
        String uploadFolder ="D:\\java4\\spring\\springweb\\springmvc\\src\\main\\webapp\\Upload";
        List<MultipartFile> list = files.getFiles("files");

        for(int i=0; i<list.size();i++){
            String fileRealName= list.get(i).getOriginalFilename();
            long size= list.get(i).getSize();
            String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());

            //새로운 파일명 생성
            UUID uuid = UUID.randomUUID();
            String[] uuids = uuid.toString().split("-");
            String newName = uuids[0];
            File saveFile = new File(uploadFolder + "\\"+newName + fileExt);
            System.out.println("파일명 : "+ uploadFolder + "\\"+newName + fileExt);

            try{
                list.get(i).transferTo(saveFile);
            }catch(IllegalStateException e){
                e.printStackTrace();
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }

/*

        String fileRealName = file.getOriginalFilename();


        String fileExt = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length()); // 엑셀파일/xxx.xls => 파일 확장자
        System.out.println("=========예옛날파일");
        System.out.println("uploadFolder" +uploadFolder);
        System.out.println("fileRealName" + fileRealName);
        System.out.println("size " +size);
        System.out.println("fileExt" +fileExt);

        //새로운 파일명 생성
        UUID uuid = UUID.randomUUID();
        String[] uuids = uuid.toString().split("-");
        String newName = uuids[0];

        System.out.println("=========uuid파일");
        System.out.println("uuid" +uuid);
        System.out.println("uuids" + uuids);
        System.out.println("newName " +newName);

        File saveFile = new File(uploadFolder + "\\"+newName + fileExt);
        System.out.println("파일명 : "+ uploadFolder + "\\"+newName + fileExt);

        try{
            file.transferTo(saveFile);
        }catch(IllegalStateException e){
            e.printStackTrace();
        }
        catch(Exception e){
            e.printStackTrace();
        }

        return "/bbs/fileUpload";*/
        return "/bbs/fileUpload";
    }

}



