package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.BbsVO;
import org.fullstack4.springmvc.dto.BbsDTO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.dto.PageResponseDTO;
import org.fullstack4.springmvc.mapper.BbsMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor //생성자 주입방식으로 의존성 주입
public class BbsServiceImpl implements BbsServiceIf{

    //1. 사용할 객체들의 필드를 작성
    private final ModelMapper modelMapper;
    private final BbsMapper bbsMapper;

    //2. service에서는 dto, vo 객체 필요
    @Override
    public int regist(BbsDTO bbsDTO) {

        BbsVO bbsVO = modelMapper.map(bbsDTO, BbsVO.class); //bbsVO.setUserId(bbsDTO.getUser_id())를 대신함

        int result = bbsMapper.regist(bbsVO);


        return result; //controller에게 전달
    }

    @Override
    public List<BbsDTO> ListAll() {

        List<BbsDTO> bbsDTOList = bbsMapper.listAll().stream()
                .map(vo->modelMapper.map(vo,BbsDTO.class))
                .collect(Collectors.toList());


        return bbsDTOList;
    }

    @Override
    public BbsDTO view(int no) {

        BbsVO vo = bbsMapper.view(no);
        BbsDTO bbsDto = modelMapper.map(vo,BbsDTO.class);

        return bbsDto;


    }

    @Override
    public int modify(BbsDTO bbsDTO) {

        BbsVO bbsVO = modelMapper.map(bbsDTO, BbsVO.class); //bbsVO.setUserId(bbsDTO.getUser_id())를 대신함

        int result = bbsMapper.modify(bbsVO);


        return result; //controller에게 전달
    }

    @Override
    public int delete(int no) {
        int result = bbsMapper.delete(no);
        return result;
    }

    @Override
    public int bbsTotalCount(PageRequestDTO requestDTO) {
        return bbsMapper.bbsTotalCount(requestDTO);

    }

    @Override
    public PageResponseDTO<BbsDTO> bbsListByPage(PageRequestDTO pageRequestDTO) {
        List<BbsVO> voList = bbsMapper.bbsListByPage(pageRequestDTO);
        List<BbsDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,BbsDTO.class))
                .collect(Collectors.toList());

        int total_count  = bbsMapper.bbsTotalCount(pageRequestDTO);

        PageResponseDTO<BbsDTO> responseDTO = PageResponseDTO.<BbsDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();

        return responseDTO;
    }
}
