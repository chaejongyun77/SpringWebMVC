package org.fullstack4.springmvc.service;

import org.fullstack4.springmvc.dto.BbsDTO;

import java.util.List;

public interface BbsServiceIf {
    int regist(BbsDTO bbsDTO);

    List<BbsDTO> ListAll();

    BbsDTO view(int no);

  int modify(BbsDTO bbsDTO );

    int delete(int no);
}
