package org.fullstack4.springmvc.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.Min;
import java.time.LocalDate;

@Log4j2
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class BbsVO {
    private int no;
    private String user_id;
    private String title;
    private String content;
    private String display_date;
    private int read_cnt;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private String interest;
    private int reply_cnt;
}
