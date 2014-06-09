<%@page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@page import="ua.pp.chuprin.servlets.satapp.DAO" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Редактор страницы</title>
    <script src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>
    <script>
        tinymce.init({
            selector:'textarea',
            plugins: [
                "advlist autolink lists link image charmap print preview anchor",
                "searchreplace visualblocks code fullscreen",
                "insertdatetime media table contextmenu paste"
            ],
            toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
        });
    </script>
</head>
<body>
    <form action="save" method="POST">
        <input type="hidden" name="code" value="${param['pageCode']}">
        <textarea name="content" style="height: 90%">
            <%
                out.write(DAO.content(request.getParameter("pageCode")));
            %>
        </textarea>
        <input type="submit" value="Сохранить"/>
    </form>
</body>
</html>
