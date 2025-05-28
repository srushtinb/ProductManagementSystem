package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reportType = request.getParameter("type");
        List<Product> products = null;

        try {
            switch(reportType) {
                case "price":
                    double price = Double.parseDouble(request.getParameter("price"));
                    products = productDAO.getProductsByPrice(price);
                    break;
                case "category":
                    String category = request.getParameter("category");
                    products = productDAO.getProductsByCategory(category);
                    break;
                case "top":
                    int limit = Integer.parseInt(request.getParameter("limit"));
                    products = productDAO.getTopNProductsByQuantity(limit);
                    break;
                default:
                    products = productDAO.getAllProducts();
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error retrieving report: " + e.getMessage());
        }

        request.setAttribute("products", products);
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}
