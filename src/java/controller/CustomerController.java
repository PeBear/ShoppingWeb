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

/**
 *
 * @author xpeter
 */
public class CustomerController extends HttpServlet {

    List<Customers> list = null;
    PrintWriter printWriter = null;
    String cusPage = "customers.jsp";
    String infoPage = "infoCus.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action.equals("btnThem")) {
            this.themKhachHang(request, response);
            RequestDispatcher rd = request.getRequestDispatcher(cusPage);
            rd.forward(request, response);
        } else if (action.equals("btnXoa")) {
            this.xoaKhachHang(request, response);
            RequestDispatcher rd = request.getRequestDispatcher(cusPage);
            rd.forward(request, response);
        } else if (action.equals("btnInfo")) {
            this.getThongTinKhachHang(request, response);
            RequestDispatcher rd = request.getRequestDispatcher(infoPage);
            rd.forward(request, response);
        } else {
            this.updateKhachHang(request, response);
            RequestDispatcher rd = request.getRequestDispatcher(cusPage);
            rd.forward(request, response);
        }

    }

    private void themKhachHang(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("txtUsername");
        String hoten = request.getParameter("txtFullname");
        String sdt = request.getParameter("txtPhoneNum");
        String diachi = request.getParameter("txtAddress");
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        String role = request.getParameter("rdoVaitro");
        Customers cus = new Customers(hoten, sdt, email, diachi, username, password, role);
        if (CustomerDAO.insertCustomer(cus)) {
            HttpSession session = request.getSession(true);
            list = CustomerDAO.getListCustomers("");
            session.setAttribute("ListCustomer", list);
        }
    }

    private void xoaKhachHang(HttpServletRequest request, HttpServletResponse response) {
        String code = request.getParameter("txtCode");
        int makh = Integer.parseInt(code);
        if (CustomerDAO.deleteCustomer(makh)) {
            HttpSession session = request.getSession(true);
            list = CustomerDAO.getListCustomers("");
            session.setAttribute("ListCustomer", list);
        } else {
            //printWriter.print("xoa not ok");
        }
    }

    private void getThongTinKhachHang(HttpServletRequest request, HttpServletResponse response) {
        String tempcode = request.getParameter("txtCode");
        int code = Integer.parseInt(tempcode);
        Customers cus = CustomerDAO.getInfoCustomer(code);
        HttpSession session = request.getSession(true);
        session.setAttribute("getInFoCustomer", cus);

    }

    private void updateKhachHang(HttpServletRequest request, HttpServletResponse response) {
        String tempcode = request.getParameter("txtCode");
        int code = Integer.parseInt(tempcode);
        String username = request.getParameter("txtUsername");
        String hoten = request.getParameter("txtFullname");
        String sdt = request.getParameter("txtPhoneNum");
        String diachi = request.getParameter("txtAddress");
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        String role = request.getParameter("rdoVaitro");
        Customers cus = new Customers(code, hoten, sdt, email, diachi, username, password, role);
        CustomerDAO.updateCustomer(cus);

        HttpSession session = request.getSession(true);
        list = CustomerDAO.getListCustomers("");
        session.setAttribute("ListCustomer", list);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        list = CustomerDAO.getListCustomers("");
        session.setAttribute("ListCustomer", list);
        response.sendRedirect(cusPage);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
