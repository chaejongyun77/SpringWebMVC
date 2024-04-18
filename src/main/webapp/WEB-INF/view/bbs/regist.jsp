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
<h1>bbs regist입니다.</h1>
<form name="frmRegist" id="frmRegist" method="post" action="/bbs/regist">


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
</form>
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

</body>
</html>
