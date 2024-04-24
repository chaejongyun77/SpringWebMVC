package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.MemberVO;
import org.fullstack4.springmvc.dto.MemberDTO;
import org.fullstack4.springmvc.mapper.LoginMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor //생성자 주입방식으로 의존성 주입
public class LoginServiceImpl implements LoginServiceIf{

    //1. 사용할 객체들의 필드를 작성
    private final LoginMapper loginMapper;
    private final ModelMapper modelMapper;


    @Override
    public MemberDTO login_info(String user_id, String pwd) {

        MemberVO memberVO = loginMapper.login_info(user_id,pwd);


        MemberDTO memberDTO = null;

        if(memberVO != null && memberVO.getPwd().equals(pwd)){
            memberDTO = modelMapper.map(memberVO,MemberDTO.class);
        }


        return memberDTO;
    }

}
