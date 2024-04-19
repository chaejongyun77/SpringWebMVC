package org.fullstack4.springmvc.service;


import org.fullstack4.springmvc.dto.MemberDTO;

public interface MemberServiceIf {



    int member_join(MemberDTO memberDTO);

    int member_leave(String id, String pwd);
}
