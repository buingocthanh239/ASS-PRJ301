/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Categorie;
import model.Product;

/**
 *
 * @author choip
 */
@WebServlet(name="ManageProductsServlet", urlPatterns={"/ManageProductsServlet"})
public class ManageProductsServlet extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            String keyword = request.getParameter("txtsearch");
            String searchby = request.getParameter("searchby");

            List<Product> list;
            if (keyword == null || searchby == null) {
                list = ProductDAO.getProducts("", "");
            } else {
                list = ProductDAO.getProducts(keyword, searchby);
            }
            List<Categorie> listCate = CategoryDAO.getCategories("");

            request.setAttribute("cateList", listCate);
            request.setAttribute("plantsList", list);
            request.getRequestDispatcher("ManageProducts.jsp").forward(request, response);

        }catch(Exception e){
            
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
