package controller;

import DAO.ProductDAO;
import entity.Products;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/UploadFileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB

public class UploadFileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fileName = "";
        for (Part part : request.getParts()) {

            fileName = extractFileName(part);
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();
            part.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
            String temp = "/home/xpeter/NetBeansProjects/ShopCart/web/images/" + fileName;
            part.write(temp);
            System.out.println("do post: " + this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
        }

        request.setAttribute("message", "Upload File Success!");
        HttpSession session = request.getSession();
        String code = session.getAttribute("uploadCode").toString();
        if (code != null) {
            Products pd = ProductDAO.getInfoProduct(code);
            pd.setHinh(fileName);
            ProductDAO.updateProduct(pd);
        }
        response.sendRedirect("products.jsp");
    }

    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUpload() {
        ServletContext servletContext = getServletContext();
        File folderUpload = new File(servletContext.getRealPath("/images/"));
        System.out.println("folder upload: " + folderUpload.getAbsolutePath());
        System.out.println(folderUpload.getAbsolutePath());
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        session.setAttribute("uploadCode", req.getParameter("txtCode"));
        resp.sendRedirect("upload.jsp");
    }

}
