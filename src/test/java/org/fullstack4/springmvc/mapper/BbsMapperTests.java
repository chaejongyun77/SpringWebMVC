package org.fullstack4.springmvc.mapper;

import org.fullstack4.springmvc.domain.BbsVO;
import org.fullstack4.springmvc.dto.PageRequestDTO;
import org.fullstack4.springmvc.mapper.BbsMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class BbsMapperTests

{
    @Autowired(required = false)
    private BbsMapper bbsMapepr; //호출할때 객체 생성,test할때 직접 주입

    @Test
    public void testBbsTotalCount(){
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .page_size(10)
                .build();
        int totalCount = bbsMapepr.bbsTotalCount(pageRequestDTO);

        System.out.println(totalCount);

    }

    @Test
    public void testBbsListByPage(){
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .page_size(10)
                .build();
        List<BbsVO> bbsList = bbsMapepr.bbsListByPage(pageRequestDTO);

        System.out.println(bbsList);
        bbsList.forEach(List -> System.out.println(List));
    }
    @Test
    public void testBbsListBySearch(){
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page(1)
                .page_size(10)
                .search_type(new String[]{"t","u"})
                .search_word("게시글")
                .build();
        int total_count = bbsMapepr.bbsTotalCount(pageRequestDTO);
        List<BbsVO> bbsList = bbsMapepr.bbsListByPage(pageRequestDTO);

        System.out.println("test totalcount : " + total_count);
        System.out.println("test bbs" + bbsList);
        bbsList.forEach(List -> System.out.println(List));
    }


}
