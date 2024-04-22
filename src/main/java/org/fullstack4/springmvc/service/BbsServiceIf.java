package org.fullstack4.springmvc.service;

import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.PageResponseDTO;

import java.util.List;

public interface BbsServiceIf {
    int regist(BbsDTO bbsDTO);

    List<BbsDTO> ListAll();

    BbsDTO view(int no);

  int modify(BbsDTO bbsDTO );

    int delete(int no);
    int bbsTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<BbsDTO> bbsListByPage(PageRequestDTO pageRequestDTO);
}
