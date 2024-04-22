package org.fullstack4.springmvc.service;


import org.fullstack4.springmvc.dto.MemberDTO;

public interface MemberServiceIf {



    int member_join(MemberDTO memberDTO);

    int member_leave(String id, String pwd);

    int member_update (MemberDTO memberDTO);
    MemberDTO member_info(String user_id);

    // 아이디 중복체크
    String idCheck(String id);
}
