package org.fullstack4.springmvc;


import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


@ToString
@Service
@RequiredArgsConstructor //생성자를 만들때 파라미터가 들어가는 생성자를 spring에게 요청
//@NoArgsConstructor // 파라미터가 없는 기본 생성자 spring에게 요청
// @AllArgsConstructor //둘 다 알아서 spring이 요청
public class SampleService {



   @Qualifier("normal")
    private final SampleDAO sampleDAO;
    // SampleService() {this.sampleDAO = new SampleDAO();} 를 Autowired작성으로 생략가능 ,spring에게 의존성을 주입요청
}
