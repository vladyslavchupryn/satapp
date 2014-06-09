<%@page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<%@include file="_parts/head.jsp"%>
<body class="no-sidebar">
<%@include file="_parts/header.jsp"%>
<!-- Main Wrapper -->
<div id="main-wrapper">

    <!-- Main -->
    <div id="main" class="container">
        <div class="row">

            <!-- Content -->
            <div id="content" class="12u skel-cell-important">

                <!-- Post -->
                <article class="is-post">
                    <jsp:include page="_parts/article.jsp" >
                        <jsp:param name="pageCode" value="${param['pageCode']}" />
                    </jsp:include>
                </article>

            </div>

        </div>
    </div>

</div>
<%@include file="_parts/footer.jsp"%>

</body>
</html>
