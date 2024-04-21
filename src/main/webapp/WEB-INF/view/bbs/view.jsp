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

    <style>
        .input-group-text{
            width:120px;
        }

    </style>
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

                </ul>
                <form class="d-flex">

                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" value="${sessionScope.memberDTO.user_id}님 환영합니다." disabled>

            </div>
        </div>
    </nav>

</header>
<br>
<form name="frmdelete" id="frmdelete" method="post" action="/bbs/delete">
 <%--   <input type="hidden" name="no" id="no" value="${dto.no}">
    <div>
        <span>인덱스 : ${bbs.no}</span>
    </div>
    <div>
        <span>아이디 : ${dto.user_id} </span>
    </div>
    <div>
        <span>제목 : ${dto.title}</span>
    </div>
    <div>
        <span>내용 :${dto.content} </span>
    </div>
    <div>
        <span> 출력날짜 : ${dto.display_date}</span>
    </div>
    <div>
        <button type="button" onclick ="location.href='/bbs/list'">목록</button>
        <button type="button" onclick ="location.href='/bbs/modify?no=${dto.no}'">수정</button>
        <button type="button" onclick ="goDelete()">삭제</button>
    </div>--%>
     <div class="container">

         <table class="table table-striped">
             <colgroup>
                 <col style="width:10%;" /><col style="width:23%;" /><col style="width:10%;" /><col style="width:23%;" />
             </colgroup>
             <tbody>
             <tr>
                 <th scope="row">글 번호</th>
                 <td > ${dto.no}</td>

                 <th scope="row">등록일</th>
                 <td > ${dto.display_date}</td>
             </tr>
             <tr>
                 <th scope="row">제목</th>
                 <td>${dto.title}</td>

                 <th scope="row">조회수</th>
                 <td colspan="3">${dto.read_cnt}</td>
             </tr>
             <tr>
                 <th scope="row">아이디</th>
                 <td colspan="3">${dto.user_id}</td>
             </tr>
             <tr>
                 <th scope="row">내용</th>
                 <td colspan="3">${dto.content}</td>
             </tr>
             </tbody>
         </table>
         <div class="d-grid gap-2 col-6 mx-auto">
             <button class="btn btn-primary" type="button" onclick ="location.href='/bbs/list'">목록</button>
             <button class="btn btn-primary"  type="button" onclick ="location.href='/bbs/modify?no=${dto.no}'">수정</button>
             <button class="btn btn-primary" type="button" onclick ="goDelete()">삭제</button>


         </div>

        <%-- <div class="row">
             <div class="col">
                 <span class="input-group-text" id="basic-addon1">게시판번호</span>
             </div>
             <div class="col">
                 <span>${dto.no}</span>

             </div>
         </div>
         <br>
         <div class="row">
             <div class="col">
                 <span class="input-group-text" id="basic-addon2">제목</span>
             </div>
             <div class="col">
                 <span>${dto.title}</span>
             </div>

         </div>
         <br>
         <div class="row">
             <div class="col">
                 <span class="input-group-text" id="basic-addon3">내용</span>
             </div>
             <div class="col">
                 <span>${dto.content}</span>
             </div>

         </div>
         <br>

--%>
     </div>

</form>
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
<script>
    function goDelete(){
        const frm = document.getElementById("frmdelete");
        let confirm_flag = confirm("해당 게시글을 삭제하시겠습니까?");
        if(confirm_flag){
            frm.submit();
        }

    }
</script>
</body>
</html>
