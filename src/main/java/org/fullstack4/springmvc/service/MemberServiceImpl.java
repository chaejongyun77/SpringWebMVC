package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import org.fullstack4.springmvc.domain.BbsVO;
import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor //생성자 주입방식으로 의존성 주입
public class MemberServiceImpl implements MemberServiceIf{

    private final ModelMapper modelMapper;
    private  final MemberMapper memberMapper;
 @Override
    public int member_join(MemberDTO memberDTO){

        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class); //bbsVO.setUserId(bbsDTO.getUser_id())를 대신함

        int result = memberMapper.member_join(memberVO);


        return result;

    }

    @Override
    public int member_leave(String id, String pwd) {


        int result = memberMapper.member_leave(id, pwd);


        return result;
    }

    @Override
    public int member_update(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class); //bbsVO.setUserId(bbsDTO.getUser_id())를 대신함

        int result = memberMapper.member_update(memberVO);

        return result;
    }

    @Override
    public MemberDTO member_info(String user_id) {
        MemberVO memberVO = memberMapper.member_info(user_id);


        MemberDTO memberDTO = null;


            memberDTO = modelMapper.map(memberVO,MemberDTO.class);



        return memberDTO;
    }

    @Override
    public String idCheck(String id) {
        String cnt = memberMapper.idCheck(id);
        System.out.println("cnt: " + cnt);
        return cnt;
    }


}
