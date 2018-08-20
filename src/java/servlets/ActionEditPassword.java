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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;
import tools.OTHibernateUtil;

/**
 *
 * @author BINTANG
 */
public class ActionEditPassword extends HttpServlet {

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
        String passLama = request.getParameter("passLama");
        String passBaru = request.getParameter("passBaru");
        String rePassBaru = request.getParameter("rePassBaru");
        String id = request.getParameter("id");
        String salt = BCrypt.gensalt(12);

        KaryawanController kc = new KaryawanController(OTHibernateUtil.getSessionFactory());
        Karyawan kar = kc.getById(id);
        try (PrintWriter out = response.getWriter()) {
            
            if (BCrypt.checkpw(passLama, kar.getPassword())) {
                if (passBaru.equals(rePassBaru)) {
                    kc.saveOrEdit(id, kar.getNama(), kar.getTglLahir(), kar.getTglMasuk(), kar.getAlamat(), kar.getGaji().toString(), kar.getEmail(), kar.getJenisKelamin(), BCrypt.hashpw(passBaru, salt), kar.getIdRole().getId());
                    response.sendRedirect("views/home.jsp");

                } else {
                    out.println("Konfirmasi password tidak sesuai");
                }
            } else {
                out.println("Password lama tidak sesuai");
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
