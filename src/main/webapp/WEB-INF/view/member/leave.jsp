<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-04-19
  Time: 오후 5:07
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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

<div class="container">

    <form id="loginfrm" name="loginFrm" method="post" action="/member/leave">
        <br>    <br>
        <h1 class="h3 mb-3 fw-normal" style="text-align: center">회원탈퇴</h1>

        <div class="form-floating">
            <input type="text" class="form-control" id="user_id" name="user_id" value="${sessionScope.memberDTO.user_id}" readonly >
            <label for="user_id">ID</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="pwd" placeholder="Password" name="pwd">
            <label for="pwd">Password</label>
        </div>
        <br>
    <input type="submit" id="member_leave" value="회원탈퇴">


    </form>

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

    const member_leave = document.querySelector("#member_leave");


    if(member_leave !=null) {
        member_leave.addEventListener("click", function (e) {
            e.preventDefault();
            const confirm_message = confirm("삭제하시겠습니까?");
            if(confirm_message ){
                document.loginFrm.submit();
            }


            
        });
    }
</Script>
</body>
</html>
