/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author choip
 */
@WebServlet(name = "UpdateAccountServlet", urlPatterns = {"/UpdateAccountServlet"})
public class UpdateAccountServlet extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String email = request.getParameter("txtemail");
            String fullname = request.getParameter("txtfullname");
            String oldPassword = request.getParameter("txtoldpassword");
            String newPassword = request.getParameter("txtnewpassword");
            String phone = request.getParameter("txtphone");
            Account user = AccountDAO.getAccount(Integer.parseInt(request.getParameter("accID")));
            String phonePattern = "\\d{10,15}";
            if (!phone.matches(phonePattern)) {
                request.setAttribute("phoneERROR", "Phone number must have at least 10 digits");
                request.getRequestDispatcher("profile.jsp").forward(request, response);

            } else if (user.getPassword().compareTo(oldPassword) != 0) {
                request.setAttribute("passERROR", "Wrong old password");
                request.getRequestDispatcher("profile.jsp").forward(request, response);

            } else if(newPassword.length() <=6){
                request.setAttribute("passsizeERROR", "Password need more 6 characters");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } 
            else {
                if (AccountDAO.updateAccount(email, newPassword, fullname, phone)) {
                    HttpSession session = request.getSession();
                    Account acc = (Account) session.getAttribute("USER");
                    acc.setFullname(fullname);
                    acc.setPhone(phone);
                    session.setAttribute("USER", acc);
                    request.setAttribute("MESSAGE", "Update successfully");
                    request.getRequestDispatcher("profile.jsp").forward(request, response);
                } else {
                    response.sendRedirect("errorpage.html");
                }
            }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UpdateAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UpdateAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
