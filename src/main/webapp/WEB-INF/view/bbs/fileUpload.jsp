<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-04-23
  Time: 오후 2:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post"action="/bbs/fileUpload" enctype="multipart/form-data">

    <div>
        <span>파일업로드</span>
        <input type="file" name="file" id="file"/>

        <input type="submit"></div>

</form>

<form method="post"action="/bbs/fileUpload2" enctype="multipart/form-data">

    <div>
        <span>파일업로드</span>
        <input type="file" name="files" id="files" multiple="multiple"/>

        <input type="submit">
    </div>

</form>

</body>
</html>
