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
</head>
<body>
<h1>bbs modify입니다.</h1>

<form name="frmRegist" id="frmRegist" method="post" action="/bbs/modify">
    <input type="hidden" name="no" id="no" value="${bbs.no}">

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
    </div>
</form>
</body>
</html>
