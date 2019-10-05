package controller;

import DAO.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter printWriter = resp.getWriter();

        String username = req.getParameter("txtUsername");
        String password = req.getParameter("txtPassword");
        if (CustomerDAO.checkLogin(username, password)) {
            resp.sendRedirect("CustomerController");
//            RequestDispatcher rd = req.getRequestDispatcher("/CustomerController");
//            rd.forward(req, resp);
        } else {
            printWriter.println("<h1>Login failed! Username or password invalid!</h1>");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
