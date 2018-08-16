/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.KaryawanController;
import entities.Karyawan;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.ehcache.hibernate.HibernateUtil;
import org.mindrot.jbcrypt.BCrypt;
import tools.OTHibernateUtil;

/**
 *
 * @author BINTANG
 */
public class ValidationServlet extends HttpServlet {

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
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");
        String salt = BCrypt.gensalt(12);
        Date date = new Date();
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        KaryawanController kc = new KaryawanController(OTHibernateUtil.getSessionFactory());
        try (PrintWriter out = response.getWriter()) {
            if (email == "" || email == null || password == "" || password == null) {
                out.println("Gagal");
            } else {
                if (kc.login("email", email, password)) {
                    
                    session.setAttribute("id_karyawan", kc.getIdByCategory("email", email).getId());
                    response.sendRedirect("views/home.jsp");
                } else {
                    response.sendRedirect("views/login.jsp");
                }

            }
//            dispatcher.include(request, response);
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
