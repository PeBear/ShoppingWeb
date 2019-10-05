package controller;

import DAO.CustomerDAO;
import entity.Customers;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter printWriter = resp.getWriter();

        String username = req.getParameter("txtUsername").trim();
        String password = req.getParameter("txtPassword").trim();
        String email = req.getParameter("txtEmail").trim();
//        Customers cus = new Customers(username, password, email, "guest");
//        if (CustomerDAO.insertCustomer(cus)) {
//            printWriter.println("<h1>Register success!</h1>");
//        } else {
//            printWriter.println("<h1>Register failed!</h1>");
//        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    
    
}
