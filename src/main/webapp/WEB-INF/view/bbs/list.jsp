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
<h1>bbs list입니다.</h1>
<ul>
    <c:forEach items="${bbsList}" var="list">
        <li>  <a href="/bbs/view?no=${list.no}"> ${list}</a></li>
        <li></li>

    </c:forEach>
</ul>

</body>
</html>
