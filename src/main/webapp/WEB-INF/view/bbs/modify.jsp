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
    <style>

        .input-group-text{
            width:80px;
        }
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Dropdown
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">Disabled</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>

</header>

<form name="frmRegist" id="frmRegist" method="post" action="/bbs/modify">
    <input type="hidden" name="no" id="no" value="${bbs.no}">
    <div class="container">
        <div class="input-group mb-3">
            <span class="input-group-text">아이디</span>
            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="id"  id="user_id" name="user_id" value="${bbs.user_id}">
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text" >제목</span>
            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="title" id="title" name="title" value="${bbs.title}">
        </div>
        <div class="input-group">
            <span class="input-group-text">내용</span>
            <textarea class="form-control" id="content" aria-label="With textarea" name="content"> ${bbs.content}</textarea>
        </div>
        <br>
        <div class="input-group mb-3">
            <span class="input-group-text">날짜 </span>
            <input type="date" name="display_date" id="display_date" class="form-control" value="${bbs.display_date}">
            <div id="div_err_display_date" style="display: none"></div>
        </div>
        <br>
        <div class="input-group mb-3">
            <span class="input-group-text">관심사항</span>
            <div class="form-control">
                음악 &nbsp;<input class="form-check-input mt-0" type="checkbox" value="음악" name="interest" id="interest_0" aria-label="Checkbox for following text input" value="음악" <c:out value ="${bbs.interest.contains(\"음악\") ? 'checked' : ''}" />>&nbsp;
                축구 &nbsp;<input class="form-check-input mt-0" type="checkbox" value="축구" name="interest" id="interest_1"  aria-label="Checkbox for following text input" value="축구" <c:out value ="${bbs.interest.contains(\"축구\") ? 'checked' : ''}" />>&nbsp;
                배구 &nbsp;<input class="form-check-input mt-0" type="checkbox" value="배구" name="interest" id="interest_2" aria-label="Checkbox for following text input" value="배구" <c:out value ="${bbs.interest.contains(\"배구\") ? 'checked' : ''}" />>&nbsp;
                농구 &nbsp;<input class="form-check-input mt-0" type="checkbox" value="농구" name="interest" id="interest_3" aria-label="Checkbox for following text input" value="농구" <c:out value ="${bbs.interest.contains(\"농구\") ? 'checked' : ''}" />>&nbsp;
            </div>

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



    <%--<input type="hidden" name="no" id="no" value="${bbs.no}">

    <div>
        <span>아이디 : </span> <input type="text" name="user_id" id="user_id" value="${bbs.user_id}">
    </div>
    <div>
        <span>제목 : </span> <input type="text" name="title" id="title" value="${bbs.title}">
    </div>
    <div>
        <span>내용 : </span> <textarea name="content" id="content" rols="10" cols="60">${bbs.content}</textarea>
    </div>
    <div>
        <span> 출력날짜 : </span> <input type="date" name="display_date" id="display_date" value="${bbs.display_date}">
    </div>

    <div>
        <span> 관심사항 : </span>
        <span> <input type="checkbox" name="interest" id="interest_0" value="음악" <c:out value ="${bbs.interest.contains(\"음악\") ? 'checked' : ''}" /> >음악   </span>
        <span> <input type="checkbox" name="interest" id="interest_1" value="축구" <c:out value ="${bbs.interest.contains(\"축구\") ? 'checked' : ''}" />> 축구 </span>
        <span> <input type="checkbox" name="interest" id="interest_2" value="배구" <c:out value ="${bbs.interest.contains(\"배구\") ? 'checked' : ''}" />> 배구 </span>
        <span> <input type="checkbox" name="interest" id="interest_3" value="농구" <c:out value ="${bbs.interest.contains(\"농구\") ? 'checked' : ''}" />> 농구 </span>

        <div id="div_err_interest" style="display: none"></div>
    </div>
    <div>
        <button type="submit">글 수정</button>
    </div>--%>
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
