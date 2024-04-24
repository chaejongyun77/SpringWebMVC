package org.fullstack4.springmvc.mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack4.springmvc.domain.BbsReplyVO;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class BbsReplyMapperTests

{
    //context.xml확인
    @Autowired(required = false)
    private BbsReplyMapper bbsReplyMapepr; //호출할때 객체 생성,test할때 직접 주입


    @Test
    public void testBbsReplyRegsit(){

        BbsReplyVO bbsReplyDVO = BbsReplyVO.builder()
                .bbs_idx(45)
                .user_id("test")
                .title("댓글 테스트")
                .build();
        int result = bbsReplyMapepr.replyRegist(bbsReplyDVO);

        System.out.println("테스트 등록 : " + result);

    }

}
