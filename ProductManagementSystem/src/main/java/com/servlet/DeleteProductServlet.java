package com.servlet;

import com.dao.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteProductServlet") // Maps the servlet to this URL
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id")); // Extract product ID
            ProductDAO dao = new ProductDAO();
            dao.deleteProduct(id); // Delete from DB
            request.setAttribute("message", "Product deleted successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error deleting product: " + e.getMessage());
        }
        request.getRequestDispatcher("productdelete.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response); // Allow GET for testing or link-based deletion
    }
}
