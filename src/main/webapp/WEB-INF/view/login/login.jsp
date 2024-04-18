<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-04-17
  Time: 오후 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> Login</h1>
<div id="loginON">
    <form id="loginfrm" name="loginFrm" method="post" action="/login/login">
        아이디 :  <input type="text" name="user_id" id="user_id" >
        비밀번호 :  <input type="password" name ="pwd" id="pwd" value=""><br>
        <input type="checkbox" name="idSave" id="idSave" > 아이디저장 <input type="checkbox" name="autoLogin" id="autoLogin">자동로그인<br>
        <input type="button" id="login_button" value="로그인">  <input type="button" id="pwd_search" value="비밀번호찾기">  <input type="button" id="sign_up" value="회원가입">

    </form>
</div>
<script>
    const login_button = document.querySelector("#login_button");
    login_button.addEventListener("click",function(e){
        e.preventDefault();
        document.loginFrm.submit();
    })

</script>

</body>
</html>
