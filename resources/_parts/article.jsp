<%@page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ page import="ua.pp.chuprin.servlets.satapp.DAO" %>
<%@ page import="ua.pp.chuprin.servlets.satapp.Config" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% if (request.isUserInRole(Config.ADMIN_ROLE)) { %>
    <div style="width: auto; background-color: greenyellow; text-align: center">
        <a href="edit.jsp?pageCode=${param['pageCode']}">Редактировать</a>
    </div>
<% } %>

<%
    out.write(DAO.content(request.getParameter("pageCode")));
%>
