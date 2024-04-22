<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-04-17
  Time: 오전 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>

<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="/bbs/list">게시판</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/bbs/list">Home</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/member/view">마이페이지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/login/logout">로그아웃</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/member/leave">회원탈퇴</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/bbs/regist">글 등록</a>
                    </li>

                </ul>
                <form class="d-flex">

                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" value="${sessionScope.memberDTO.user_id}님 환영합니다." disabled>
                </form>
            </div>
        </div>
    </nav>

</header>
<br>
<%--<ul>
    <c:forEach items="${bbsList}" var="list">
        <li>  <a href="/bbs/view?no=${list.no}"> ${list}</a></li>



    </c:forEach>
</ul>--%>
<div class="container">
    <form>
        <input type="checkbox">제목 <input type="checkbox"> 글내용 <br>

        <input class="form-control" type="search" placeholder="Search" aria-label="Search" >
        검색기간 : <input type="button" value="등록일 시작"> <input type="button" value="등록일 끝">
        <button type="button" >검색</button> <button type="button"> 초기화</button>
    </form>
<table class="table table-striped table-hover">
    <thead>
    <tr>
        <th scope="col">게시판번호</th>
        <th scope="col">작성자</th>

        <th scope="col">제목</th>
        <th scope="col">작성일</th>
        <th scope="col">조회수</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${responseDTO.dtoList}" var="list"  varStatus="status">
        <tr>
        <th scope="row"> ${status.count}</th>
        <th scope="row"> ${list.user_id}</th>

            <th scope="row">  <a href="/bbs/view?no=${list.no}"> ${list.title}</a></th>
        <th scope="row"> ${list.reg_date}</th>
        <th scope="row"> ${list.read_cnt}</th>
        </tr>
            </c:forEach>

    </tbody>


</table>
    <nav aria-label="Page navigation example">
        <ul class=" pagination justify-content-center">
            <li class="page-item
            <c:if test="${responseDTO.prev_page_flag ne true}"> disabled</c:if>
        ">
                <!--a class="page-link" data-num="1" href="page=1">Previous</a-->
                <a class="page-link"
                   data-num="
                <c:choose>
                    <c:when test="${responseDTO.prev_page_flag}">
                        ${responseDTO.page_block_start-1}
                    </c:when>
                    <c:otherwise>1</c:otherwise>
                </c:choose>"
                   href="
                <c:choose>
                    <c:when test="${responseDTO.prev_page_flag}">
                        ${responseDTO.linkParams}&page=${responseDTO.page_block_start-1}
                    </c:when>
                    <c:otherwise>#</c:otherwise>
                </c:choose>
                ">Previous</a>
            </li>
            <c:forEach begin="${responseDTO.page_block_start}"
                       end="${responseDTO.page_block_end}"
                       var="page_num">
                <li class="page-item
                        <c:if test="${responseDTO.page == page_num}"> active</c:if> ">
                    <a class="page-link" data-num="${page_num}"
                       href="<c:choose>
                            <c:when test="${responseDTO.page == page_num}">#</c:when>
                            <c:otherwise>
                                ${responseDTO.linkParams}&page=${page_num}
                            </c:otherwise>
                         </c:choose>">${page_num}</a>
                </li>
            </c:forEach>
            <li class="page-item
                    <c:if test="${responseDTO.next_page_flag ne true}"> disabled</c:if>">
                <a class="page-link"
                   data-num="
                    <c:choose>
                        <c:when test="${responseDTO.next_page_flag}">
                            ${responseDTO.page_block_end+1}
                        </c:when>
                        <c:otherwise>
                            ${responseDTO.page_block_end}
                        </c:otherwise>
                    </c:choose>"
                   href="<c:choose>
                        <c:when test="${responseDTO.next_page_flag}">
                            ${responseDTO.linkParams}&page=
                            ${responseDTO.page_block_end+1}
                        </c:when>
                        <c:otherwise>#</c:otherwise>
                    </c:choose>">Next</a>

            </li>
        </ul>
    </nav>

</div>

<footer class="py-3 my-4" >
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
    </ul>
    <p class="text-center text-muted">© 2021 Company, Inc</p>
</footer>
<Script>
    const logout_button = document.querySelector("#logout_button");
    const leave_member = document.querySelector("#leave_member");
    const view_button = document.querySelector("#view_button");


    if(logout_button !=null) {
        logout_button.addEventListener("click", function (e) {
            e.preventDefault();
            location.href = "/login/logout";

        }, false);
    }
    if(leave_member !=null) {
        leave_member.addEventListener("click", function (e) {
            e.preventDefault();
            location.href = "/member/leave";

        }, false);
    }

    if(view_button !=null) {
        view_button.addEventListener("click", function (e) {
            e.preventDefault();
            location.href = "/member/view";

        }, false);
    }

</Script>
</body>

</html>
