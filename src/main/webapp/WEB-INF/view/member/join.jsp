<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-04-17
  Time: 오후 4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
<form name="frmRegist" id="frmRegist" method="post" action="/login/login">

    <div>
        <span>아이디 : </span> <input type="text" name="user_id" id="user_id">
    </div>
    <div>
        <span>제목 : </span> <input type="text" name="title" id="title">
    </div>
    <div>
        <span>내용 : </span> <textarea name="content" id="content" rols="10" cols="60"></textarea>
    </div>
    <div>
        <span> 출력날짜 : </span> <input type="date" name="display_date" id="display_date">
    </div>
    <div>
        <button type="submit">글 등록</button>
    </div>
</form>

</body>
</html>
