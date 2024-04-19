package org.fullstack4.springmvc.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.springmvc.domain.MemberVO;

public interface LoginMapper {
    MemberVO login_info(@Param("user_id") String user_id, @Param("pwd") String pwd); //파라미터를 2개이상 넘겨줄때는 param어노테이션을 사용해서 명시적으로 지정


}
