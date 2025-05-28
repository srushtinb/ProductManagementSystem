package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            Product p = new Product();
            p.setProductID(id);
            p.setProductName(name);
            p.setCategory(category);
            p.setPrice(price);
            p.setQuantity(quantity);

            new ProductDAO().updateProduct(p);
            request.setAttribute("message", "Product updated successfully.");
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
        }
        request.getRequestDispatcher("productupdate.jsp").forward(request, response);
    }
}
