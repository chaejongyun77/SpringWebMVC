package org.fullstack4.springmvc.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Min;
import javax.validation.constraints.PositiveOrZero;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PageRequestDTO {

    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int total_count=0; // 전체 데이터의 수입니다.

    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int first_page=1;  // 첫 번째 페이지 번호입니다. 일반적으로 1로 설정됩니다.
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page=1;// 현재 페이지 번호입니다.
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_size=10;  // 한 페이지에 보여줄 데이터의 수입니다.
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int total_page=1;// 전체 페이지의 수입니다. 이는 전체 데이터 수와 페이지 사이즈를 통해 계산됩니다.
    @Builder.Default
    @PositiveOrZero
    @Min(value=0)
    private int page_skip_count=0; // 한 번에 넘길 페이지의 수입니다. 예를 들어, '다음' 버튼을 클릭했을 때 몇 페이지를 건너뛸지를 정합니다.
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_size=10; // 페이지 네비게이션에 보여줄 페이지의 수입니다. 예를 들어, 1, 2, 3, 4, 5까지 보여주고 다음으로 넘어갈 수 있게 합니다.
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_start=1;// 페이지 네비게이션의 시작 페이지 번호입니다. 예를 들어, 1부터 시작한다면 1이 됩니다.
    @Builder.Default
    @PositiveOrZero
    @Min(value=1)
    private int page_block_end=1; // 페이지 네비게이션의 끝 페이지 번호입니다. 이는 페이지 블록 사이즈와 현재 페이지 번호를 통해 계산됩니다

    private String[] search_type;
   private String search_word;
    private String search_date1;
    private String search_date2;

    private void setTotal_count(int total_count){
        this.total_count =total_count;

    }
    public int getPage_skip_count(){
        return(this.page-1) * this.page_size;
    }
}
