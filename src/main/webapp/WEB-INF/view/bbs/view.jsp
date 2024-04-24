<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
            width:120px;
        }

    </style>
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
                </form>
            </div>
        </div>
    </nav>

</header>
<br>


     <div class="container">
         <form name="frmdelete" id="frmdelete" method="post" action="/bbs/delete?no=${dto.no}">
            <%-- <input type="hidden" id="no" name="no" value="${dto.no}">--%>
         <table class="table table-striped">
             <colgroup>
                 <col style="width:10%;" /><col style="width:23%;" /><col style="width:10%;" /><col style="width:23%;" />
             </colgroup>
             <tbody>
             <tr>
                 <th scope="row">글 번호</th>
                 <td > ${dto.no}</td>

                 <th scope="row">등록일</th>
                 <td > ${dto.display_date}</td>
             </tr>
             <tr>
                 <th scope="row">제목</th>
                 <td>${dto.title}</td>

                 <th scope="row">조회수</th>
                 <td colspan="3">${dto.read_cnt}</td>
             </tr>
             <tr>
                 <th scope="row">아이디</th>
                 <td colspan="3">${dto.user_id}</td>
             </tr>
             <tr>
                 <th scope="row">내용</th>
                 <td colspan="3">${dto.content}</td>
             </tr>
             </tbody>
         </table>
         <div class="d-grid gap-2 col-6 mx-auto">
             <button class="btn btn-primary" type="button" onclick ="location.href='/bbs/list'">목록</button>
             <button class="btn btn-primary"  type="button"  id="btn_modify">수정</button>
             <button class="btn btn-primary" type="button" onclick ="goDelete()">삭제</button>


         </div>
         </form>

         <table class="table table-striped table-hover">
             <thead>
             <tr>
                 <th scope="col">댓글번호</th>
                 <th scope="col">제목</th>
                 <th scope="col">아이디</th>
                 <th scope="col">날짜</th>

             </tr>
             </thead>
             <tbody>
                <c:choose>
                 <c:when test="${not empty bbsReplyDTO}">
                     <c:forEach items="${bbsReplyDTO}" var="list"  varStatus="status">

                         <tr>

                             <th scope="row"> ${status.count}</th>
                             <th scope="row"> ${list.user_id}</th>
                             <th scope="row">  <a href="/bbs/view?no=${list.idx}"> ${list.title}</a></th>
                             <th scope="row"> ${list.reg_date}</th>
                         </tr>
                     </c:forEach>
                 </c:when>

                    <c:otherwise>
                             <tr>
                                     <td>등록된 댓글이 존재하지 않습니다.</td>

                             </tr>
                    </c:otherwise>
                </c:choose>
            <tr>


                <td colspan="4">
                    <form id="cmtFrm" name="cmtFrm "method="post" action="/bbsReply/regist">
                        <input type="hidden" id="bbs_idx" name="bbs_idx" value="${dto.no}">
                        <input type="hidden" id="user_id" name="user_id" value="${sessionScope.user_id}">

                    <div class="mb-3">
                        <input type="text" class="form-control"
                               name="title" id="title" placeholder="댓글을입력하세요.">
                    </div>


                    <div class="d-grid gap-4 d-md-flex justify-content-md-end">
                        <button class="btn btn-primary" type="submit" id="cmt_submit">등록</button>
                    </div>
                    </form>
                </td>
            </tr>
             </tbody>

         </table>



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
<script>
   /* const cmt_submit = document.querySelector("#cmt_submit");
    cmt_submit.addEventListener("click",function(e){
       e.preventDefault();

        document.cmtFrm.submit();

    });*/

    function goDelete(){
        const frm = document.getElementById("frmdelete");
        let confirm_flag = confirm("해당 게시글을 삭제하시겠습니까?");
        if(confirm_flag){
            frm.submit();
        }

    }

    document.querySelector("#btn_modify").addEventListener("click", function () {
        let login_id = `${sessionScope.user_id}`;
        let post_id = `${dto.user_id}`;

        if(login_id == post_id) {
           const confirm_msg =  confirm("해당 게시글을 수정하시겠습니까?");
           if(confirm_msg){
           location.href="/bbs/modify?no=${dto.no}";
           }

        } else {
            alert("작성자만 수정할 수 있습니다.");
            return false;
        }
    })
</script>
</body>
</html>
