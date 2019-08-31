package controller;

import DAO.CustomerDAO;
import entity.Customers;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter printWriter = resp.getWriter();

        String username = req.getParameter("txtUsername");
        String password = req.getParameter("txtPassword");
        if (CustomerDAO.checkLogin(username, password)) {
            HttpSession session = req.getSession(true);
            session.setAttribute("User", username);
            List<Customers> list = CustomerDAO.getListCustomers("");
            session.setAttribute("ListCustomer", list);
            RequestDispatcher rd = req.getRequestDispatcher("welcome.jsp");
            rd.forward(req, resp);
        } else {
            printWriter.println("<h1>Login failed!</h1>");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
