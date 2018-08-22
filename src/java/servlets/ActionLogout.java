/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.DataOvertimeController;
import controllers.KaryawanController;
import entities.DataOvertime;
import entities.Karyawan;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tools.OTHibernateUtil;

/**
 *
 * @author BINTANG
 */
public class ActionLogout extends HttpServlet {

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
        HttpSession session = request.getSession();
        DataOvertimeController overtimeController = new DataOvertimeController(OTHibernateUtil.getSessionFactory());
        KaryawanController karyawanController = new KaryawanController(OTHibernateUtil.getSessionFactory());
        String idKaryawan = session.getAttribute("id").toString();

        Date date = new Date();

        Karyawan kar = karyawanController.getById(idKaryawan);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            if (kar.getIdRole().getId().equals("USR")) {
                DataOvertime dataOvertime = overtimeController.searchSortingId("idKaryawan", idKaryawan, "desc").get(0);
                if (new SimpleDateFormat("dd-MM").format(dataOvertime.getTgl()).equals(new SimpleDateFormat("dd-MM").format(date))) {
                    String id = dataOvertime.getId().toString();
                    if (overtimeController.saveOrEdit(id, dataOvertime.getTgl(), dataOvertime.getJamMasuk(), date, dataOvertime.getKeterangan(), dataOvertime.getUpahLembur().toString(), dataOvertime.getIdJenisLembur().getIdJenisLembur().toString(), dataOvertime.getIdKaryawan().getId().toString(), dataOvertime.getIdStatus().getId().toString())) {
                        session.invalidate();
                        response.sendRedirect("views/home.jsp");
                    }
                }

            } else {
                session.invalidate();
                response.sendRedirect("views/home.jsp");
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
