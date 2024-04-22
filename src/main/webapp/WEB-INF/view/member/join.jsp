<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-04-17
  Time: 오후 4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<html>
<head>
    <title>회원가입</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        .id_ok{
            color:#008000;
            display: none;
        }

        .id_already{
            color:#6A82FB;
            display: none;
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
<div class="container">
    <h1 style="text-align: center">회원가입</h1>
    <br>
    <form class="row g-3" name="frmRegist" id="frmRegist" method="post" action="/member/join">
        <div class="input-group mb-3">
            <label for="user_id" class="form-label">아이디 : &nbsp;</label>
            <input type="text" class="form-control" id="user_id" name="user_id">
            <button class="btn btn-outline-secondary" type="button" id="search_id" >중복확인</button>
            <div id="div_err_user_id" style="display: none"></div> &nbsp;&nbsp;

            <label for="inputPassword4" class="form-label">비밀번호 : &nbsp;</label>
            <input type="password" class="form-control" id="inputPassword4" name="pwd">
            <div id="div_err_pwd" style="display: none"></div>
        </div>
        <span class="id_ok">사용 가능한 아이디입니다.</span>
        <span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>

        <div class="col-12">
            <label for="inputAddress" class="form-label">이름</label>
            <input type="text" class="form-control" id="inputName" placeholder="홍길동" name="name">
            <div id="div_err_name" style="display: none"></div>
        </div>
        <div class="col-12">
            <label for="inputEmail" class="form-label">이메일</label>
            <input type="email" class="form-control" id="inputEmail" placeholder="example@naver.com" name="email">
            <div id="div_err_email" style="display: none"></div>
        </div>
        <div class="col-12">
            <label for="inputAddress" class="form-label">날짜</label>
            <input type="date" class="form-control" id="inputDate" name="birthday" >
            <div id="div_err_birthday" style="display: none"></div>
        </div>
        <div class="col-12">
            <label for="inputAddress" class="form-label">주소</label>
            <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="addr1" onclick="address();">
            <div id="div_err_addr1" style="display: none"></div>
        </div>
        <div class="col-12">
            <label for="inputAddress2" class="form-label">상세주소</label>
            <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor" name="addr2">
            <div id="div_err_addr2" style="display: none"></div>
        </div>



        <div class="col-12">
            관심사항  :
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" name="interest" id="inlinecheckbox1" value="스포츠" n>
            <label class="form-check-label" for="inlinecheckbox1">스포츠</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" name="interest" id="inlinecheckbox2" value="여행">
            <label class="form-check-label" for="inlinecheckbox2">여행</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" name="interest" id="inlinecheckbox3" value="영화">
            <label class="form-check-label" for="inlinecheckbox3">영화 </label>
        </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" name="interest" id="inlinecheckbox4" value="음악" >
                <label class="form-check-label" for="inlinecheckbox4">음악 </label>
            </div>
        </div>

        <div class="d-grid gap-2 col-6 mx-auto">
            <button type="submit" class="btn btn-primary">회원가입</button>

        </div>
    </form>

</div>

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
    const check_id = document.querySelector("#search_id");
    check_id.addEventListener("click",function(e){
        e.preventDefault();

        var user_id = $('#user_id').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({

            url:'/member/idCheck', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{user_id:user_id},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다
                    console.log(cnt);
                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디

                    $('.id_ok').css("display","inline-block");
                    $('.id_already').css("display", "none");

                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.id_already').css("display","inline-block");
                    $('.id_ok').css("display", "none");
                    alert("아이디를 다시 입력해주세요");
                    $('#user_id').val('');
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });

    });




    const serverValidResult ={};

    <c:forEach items ="${errors}" var ="err">

    if(document.getElementById("div_err_${err.getField()}") != null){
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red'>${err.getField()}필드는 ${err.defaultMessage}</span>";
        document.getElementById("div_err_${err.getField()}").style.display="block";
    }

    serverValidResult['${err.getField()}'] = '${err.defaultMessage}';

    </c:forEach>

    console.log(serverValidResult);

    function address() {
        new daum.Postcode({
            oncomplete: function (data) {
                if(data.userSelectedType == "R"){
                document.querySelector("#inputAddress").value= data.roadAddress;
            }
                else{
                    document.querySelector("#inputAddress").value= data.jibunAddress;
                }
            }
        }).open();
    }
</script>
</body>
</html>
