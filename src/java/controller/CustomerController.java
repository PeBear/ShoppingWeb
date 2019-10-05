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

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action == null) {
            HttpSession session = request.getSession(true);
            list = CustomerDAO.getListCustomers("");
            session.setAttribute("ListCustomer", list);
            RequestDispatcher rd = request.getRequestDispatcher("customers.jsp");
            rd.forward(request, response);
        } else {
            if (action.equals("btnThem")) {
                this.themKhachHang(request, response);
            } else if (action.equals("btnXoa")) {
                this.xoaKhachHang(request, response);
            }
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
        System.out.println(username);
        System.out.println(hoten);
        System.out.println(sdt);
        System.out.println(diachi);
        System.out.println(email);
        System.out.println(password);
        System.out.println(role);
        Customers cus = new Customers(hoten, sdt, email, diachi, username, password, role);
//        CustomerDAO.insertCustomer(cus);
    }

    private void xoaKhachHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("txtCode");
        int makh = Integer.parseInt(code);
        if (CustomerDAO.deleteCustomer(makh)) {
            list = CustomerDAO.getListCustomers("");
            RequestDispatcher rd = request.getRequestDispatcher("customers.jsp");
            rd.forward(request, response);
        } else {
            //printWriter.print("xoa not ok");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
