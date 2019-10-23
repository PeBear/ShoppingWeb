package controller;

import DAO.CustomerDAO;
import entity.Customers;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
        String hoten = req.getParameter("txtHoten").trim();
        String email = req.getParameter("txtEmail").trim();
        String sdt = req.getParameter("txtSDT").trim();
        String diachi = req.getParameter("txtDiaChi").trim();
        String password = req.getParameter("txtPassword").trim();
        String vaitro = "Nhân Viên";
        Customers cus = new Customers(hoten, sdt, email, diachi, username, password, vaitro);
        if (CustomerDAO.insertCustomer(cus)) {
            resp.setHeader("Refresh", "5;url=index.jsp");
            printWriter.println("<h1>Register success!</h1>");

        } else {

            printWriter.println("<h1>Register failed!</h1>");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

}
