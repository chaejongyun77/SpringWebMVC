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
<h1>bbs view입니다.</h1>
<form name="frmdelete" id="frmdelete" method="post" action="/bbs/delete">
    <input type="hidden" name="no" id="no" value="${dto.no}">
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
    </div>
</form>
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
