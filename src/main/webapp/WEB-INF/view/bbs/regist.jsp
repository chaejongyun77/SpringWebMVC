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
    <title>Title</title> <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


</head>
<Style>

    .py-3 my-4{
        position : fixed;
        bottom : 0;
    }
    .input-group-text{
        width:80px;
    }
</Style>
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
<%--<form name="frmRegist" id="frmRegist" method="post" action="/bbs/regist">


    <div>
        <span>아이디 : </span> <input type="text" name="user_id" id="user_id" value="${dto.user_id}">
        <div id="div_err_user_id" style="display: none"></div>
    </div>
    <div>
        <span>제목 : </span> <input type="text" name="title" id="title" value="${dto.title}">
        <div id="div_err_title" style="display: none"></div>
    </div>
    <div>
        <span>내용 : </span> <textarea name="content" id="content" rols="10" cols="60"> ${dto.content}</textarea>
        <div id="div_err_content" style="display: none"></div>
    </div>
    <div>
        <span> 출력날짜 : </span> <input type="date" name="display_date" id="display_date">
        <div id="div_err_display_date" style="display: none"></div>
    </div>
    <div>
        <span> 관심사항 : </span>
        <span> <input type="checkbox" name="interest" id="interest_0" value="음악">음악  </span>
        <span> <input type="checkbox" name="interest" id="interest_1" value="축구"> 축구 </span>
        <span> <input type="checkbox" name="interest" id="interest_2" value="배구"> 배구 </span>
        <span> <input type="checkbox" name="interest" id="interest_3" value="농구"> 농구 </span>

        <div id="div_err_interest" style="display: none"></div>
    </div>
    <div>
        <button type="submit">글 등록</button>
    </div>
</form>--%>
<script>
    const serverValidResult ={};

    <c:forEach items ="${errors}" var ="err">

    if(document.getElementById("div_err_${err.getField()}") != null){
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red'>${err.getField()}필드는 ${err.defaultMessage}</span>";
        document.getElementById("div_err_${err.getField()}").style.display="block";
    }

    serverValidResult['${err.getField()}'] = '${err.defaultMessage}';

    </c:forEach>

    console.log(serverValidResult);
</script>








    <form name="frmRegist" id="frmRegist" method="post" action="/bbs/regist">
        <div class="container">
<div class="input-group mb-3">
    <span class="input-group-text">아이디</span>
    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="id"  id="user_id" name="user_id">
    <div id="div_err_user_id" style="display: none"></div>
</div>

    <div class="input-group mb-3">
        <span class="input-group-text" >제목</span>
        <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="title" id="title" name="title">
        <div id="div_err_title" style="display: none"></div>
    </div>
    <div class="input-group">
        <span class="input-group-text">내용</span>
        <textarea class="form-control" id="content" aria-label="With textarea" name="content"></textarea>
        <div id="div_err_content" style="display: none"></div>
    </div>
    <br>
    <div class="input-group mb-3">
        <span class="input-group-text">날짜 </span>
        <input type="date" name="display_date" id="display_date" class="form-control">
        <div id="div_err_display_date" style="display: none"></div>
    </div>
    <br>
    <div class="input-group mb-3">
        <span class="input-group-text">관심사항</span>
        <div class="form-control">
            음악 &nbsp;<input class="form-check-input mt-0" type="checkbox" value="음악" name="interest" id="interest_0" aria-label="Checkbox for following text input">&nbsp;
            축구 &nbsp;<input class="form-check-input mt-0" type="checkbox" value="축구" name="interest" id="interest_1"  aria-label="Checkbox for following text input">&nbsp;
            배구 &nbsp;<input class="form-check-input mt-0" type="checkbox" value="배구" name="interest" id="interest_2" aria-label="Checkbox for following text input">&nbsp;
            농구 &nbsp;<input class="form-check-input mt-0" type="checkbox" value="농구" name="interest" id="interest_3" aria-label="Checkbox for following text input">&nbsp;
        </div>
        <div id="div_err_interest" style="display: none"></div>
    </div>
    <br>
        <div class="d-grid gap-2 col-6 mx-auto">
            <button class="btn btn-primary" type="submit">등록</button>

        </div>
     <%--   <div class="col-12">
            <br>
            <button type="submit" class="btn btn-primary">등록</button>
        </div>--%>


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
</body>
</html>
