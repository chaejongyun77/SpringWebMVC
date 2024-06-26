<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-04-17
  Time: 오후 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


</head>

<body class="text-center">

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
<div class="container">
    <form id="loginfrm" name="loginFrm" method="post" action="/login/login">
        <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
        </svg>
        <h1 class="h3 mb-3 fw-normal">로그인</h1>

        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" name="user_id" placeholder="name@example.com">
            <label for="floatingInput">ID</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="pwd">
            <label for="floatingPassword">Password</label>
        </div>
        <div>
            <span style="color:red ; "> ${error_msg}</span>
        </div>
        <div>
        <input type="checkbox" name="auto_login" id="auto_login" style="font-size:16px" >자동로그인  </span>
        </div>
    <br>
      <%--  <div class="checkbox mb-3">

            <c:if test="${sessionScope.user_id == null}">
                <input type="button" id="login_button" value="로그인">
            </c:if>
         <input type="button" id="signup_button" value="회원가입" onclick="location.href='/member/join'">
            <c:if test="${sessionScope.user_id != null}">
                <input type="button" id="logout_button" value="로그아웃">
            </c:if>
        </div>--%>

        <div class="d-grid gap-2 col-6 mx-auto">
            <button class="btn btn-primary" id="login_button" type="button">로그인</button>
            <button class="btn btn-primary" id="signup_button" type="button">회원가입</button>
        </div>


    </form>
</div>


<script>
    const login_button = document.querySelector("#login_button");
    const logout_button = document.querySelector("#logout_button");
    const signup_button = document.querySelector("#signup_button");
    if (login_button != null) {
        login_button.addEventListener("click", function (e) {
            e.preventDefault();
            document.loginFrm.submit();
        });
    }
    if (logout_button != null) {
        logout_button.addEventListener("click", function (e) {
            e.preventDefault();
            location.href = "/login/logout";

        }, false);
    }

    if (signup_button != null) {
        signup_button.addEventListener("click", function (e) {

            e.preventDefault();

            location.href = "/member/join";
        });
    }



</script>

</body>
</html>
