package org.fullstack4.springmvc.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper2 {
//1.규칙 인터페이스
//2. 사용할 메소드와 xml메소드명 일치
    String getNow();
}
