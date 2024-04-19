package org.fullstack4.springmvc.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.springmvc.domain.MemberVO;

public interface MemberMapper {

    int member_join (MemberVO memberVO);

    int member_leave(@Param("user_id") String user_id, @Param("pwd")String pwd);
}
