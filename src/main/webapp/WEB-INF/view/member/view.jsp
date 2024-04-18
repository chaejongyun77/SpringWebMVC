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
</head>
<body>
<h1>login view입니다.</h1>


    <div>
        <span>아이디 : ${user_id} </span>
    </div>
    <div>
        <span>제목 : ${title}</span>
    </div>
    <div>
        <span>내용 :${content} </span>
    </div>
    <div>
        <span> 출력날짜 : ${display_date}</span>
    </div>
    <div>

        <button type="button" onclick ="Location.href='/member/modify?idx=1'">수정</button>
        <button type="button" onclick ="Location.href='/member/delete?idx=1'">삭제</button>
    </div>

</body>
</html>
