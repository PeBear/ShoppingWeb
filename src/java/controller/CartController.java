package controller;

import cart.ProductDTO;
import cart.ShoppingCart;
import entity.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter printWriter = resp.getWriter();

        try {
            String action = req.getParameter("action");
            if (action.equals("btnAddToCart")) {
                HttpSession session = req.getSession(true);
                ShoppingCart cart = (ShoppingCart) session.getAttribute("Cart");
                if (cart == null) {
                    cart = new ShoppingCart();
                }
                String tensp = req.getParameter("txtTensp");
                String masp = req.getParameter("txtMasp");
                int gia = Integer.parseInt(req.getParameter("txtGia"));
                Products sp = new Products(masp, tensp, gia);
                ProductDTO product = new ProductDTO(sp);
                cart.addProduct(product);
                session.setAttribute("Cart", cart);
                RequestDispatcher rd = req.getRequestDispatcher("shop.jsp");
                rd.forward(req, resp);
            } else if (action.equals("btnRemove")) {
                String[] rmv = req.getParameterValues("chkRemove");
                if (rmv != null) {
                    HttpSession session = req.getSession();
                    if (session != null) {
                        ShoppingCart cart = (ShoppingCart) session.getAttribute("Cart");
                        if (cart != null) {
                            for (String rmv1 : rmv) {
                                cart.removeProduct(rmv1);
                            }
                            session.setAttribute("Cart", cart);
                        }
                    }
                }
                RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");
                rd.forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
