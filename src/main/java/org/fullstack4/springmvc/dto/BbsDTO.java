package org.fullstack4.springmvc.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;
import java.time.LocalDate;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsDTO {

    private int no;
    @NotBlank // not null, 빈값, 공백문자 x , @NotEmpty - > not null, 빈값x

    private String user_id;
    @NotBlank
    private String title;
    @NotBlank
    private String content;
    private String display_date;
    @Builder.Default //초기값을 설정해줘야됨
    @PositiveOrZero
    @Min(value=0)
    private int read_cnt =0;

    private LocalDate reg_date;
    private LocalDate modify_date;
    private String interest;
    @Min(value=0)
    private int reply_cnt=0;
}

