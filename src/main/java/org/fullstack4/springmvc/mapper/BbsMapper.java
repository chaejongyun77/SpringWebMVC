package org.fullstack4.springmvc.mapper;

import org.fullstack4.springmvc.domain.BbsVO;
import org.fullstack4.springmvc.dto.BbsDTO;

import java.util.List;

public interface BbsMapper
{
    //mapper는 vo로 받음
    int regist(BbsVO bbsVO);
    List<BbsVO> listAll();

    BbsVO view(int idx);

    int modify(BbsVO bbsVO);

    int delete(int no);


}
