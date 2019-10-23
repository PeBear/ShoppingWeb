package controller;

import DAO.ProductDAO;
import entity.Products;
import java.io.IOException;
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
public class ProductController extends HttpServlet {

    List<Products> list;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action.equals("btnThem")) {
            this.addProduct(req, resp);
            RequestDispatcher rd = req.getRequestDispatcher("products.jsp");
            rd.forward(req, resp);
        } else if (action.equals("btnXoa")) {
            this.removeProduce(req, resp);
            RequestDispatcher rd = req.getRequestDispatcher("products.jsp");
            rd.forward(req, resp);
        } else if (action.equals("btnInfo")) {
            this.getInfoProduct(req, resp);
            RequestDispatcher rd = req.getRequestDispatcher("infoProduct.jsp");
            rd.forward(req, resp);
        } else {
            this.updateProduct(req, resp);
            RequestDispatcher rd = req.getRequestDispatcher("products.jsp");
            rd.forward(req, resp);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        list = ProductDAO.getListProducts("");
        HttpSession session = request.getSession(true);
        session.setAttribute("ListProduct", list);
        response.sendRedirect("products.jsp");
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

    private void addProduct(HttpServletRequest req, HttpServletResponse resp) {
        String masp = req.getParameter("txtCode");
        String tensp = req.getParameter("txtName");
        double gia = Double.parseDouble(req.getParameter("txtPrice"));
        Products pd = new Products(masp, tensp, gia, null);
        ProductDAO.insertProduct(pd);
        list = ProductDAO.getListProducts("");
        HttpSession session = req.getSession(true);
        session.setAttribute("ListProduct", list);
    }

    private void removeProduce(HttpServletRequest req, HttpServletResponse resp) {
        String masp = req.getParameter("txtCode");
        ProductDAO.deleteProduct(masp);
        list = ProductDAO.getListProducts("");
        HttpSession session = req.getSession(true);
        session.setAttribute("ListProduct", list);
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse resp) {
        String masp = req.getParameter("txtCode");
        String tensp = req.getParameter("txtName");
        double gia = Double.parseDouble(req.getParameter("txtPrice"));
        Products pd = new Products(masp, tensp, gia, null);
        ProductDAO.updateProduct(pd);
        list = ProductDAO.getListProducts("");
        HttpSession session = req.getSession(true);
        session.setAttribute("ListProduct", list);
    }

    private void getInfoProduct(HttpServletRequest req, HttpServletResponse resp) {
        String masp = req.getParameter("txtCode");
        Products pd = ProductDAO.getInfoProduct(masp);
        HttpSession session = req.getSession(true);
        session.setAttribute("getInfoProduct", pd);
    }
}
