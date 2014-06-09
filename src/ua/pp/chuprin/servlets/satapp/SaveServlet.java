package ua.pp.chuprin.servlets.satapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SaveServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        DAO.save(req.getParameter("code"), req.getParameter("content"));
        resp.sendRedirect(resp.encodeRedirectURL("/view.jsp?pageCode=" + req.getParameter("code")));
    }
}
