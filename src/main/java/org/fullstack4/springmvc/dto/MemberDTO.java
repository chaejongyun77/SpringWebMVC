package org.fullstack4.springmvc.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Log4j2
@Data //getter setter tostring()포함
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {

    private String user_id;
    private String name;
    private String pwd;
    private String jumin;
    private String addr1;
    private String addr2;
    private String birthday;
    private String job_code;
    private String mileage;
    private String user_Sate;
    private String reg_date;
    private String leave_date;
    private String pwd_change_date;
}

