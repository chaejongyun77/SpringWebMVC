package org.fullstack4.springmvc.service;

import lombok.RequiredArgsConstructor;
import org.fullstack4.springmvc.domain.BbsReplyVO;
import org.fullstack4.springmvc.domain.BbsVO;
import org.fullstack4.springmvc.dto.BbsReplyDTO;
import org.fullstack4.springmvc.mapper.BbsMapper;
import org.fullstack4.springmvc.mapper.BbsReplyMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BbsReplyserviceImpl implements BbsReplyServiceIf{
    private final ModelMapper modelMapper;
    private final BbsReplyMapper bbsReplyMapperr;

    @Override
    @Transactional // 댓글등록과 게시글의 댓글 수는 동시에 트랜젝션이 되어야하기때문에
    public int replyRegist(BbsReplyDTO bbsReplyDTO) {

        BbsReplyVO bbsReplyVO = modelMapper.map(bbsReplyDTO,BbsReplyVO.class);
        int result = bbsReplyMapperr.replyRegist(bbsReplyVO);
        int replyResult = bbsReplyMapperr.update_reply_cnt(bbsReplyDTO.getBbs_idx());

        return result;
    }

    @Override
    public int update_reply_cnt(int bbs_idx) {
        int result = bbsReplyMapperr.update_reply_cnt(bbs_idx);
        return result;
    }

    @Override
    public List<BbsReplyDTO> replyList() {
        return null;
    }
}
