/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.DataOvertimeController;
import entities.DataOvertime;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tools.OTHibernateUtil;

/**
 *
 * @author BINTANG
 */
public class AccOvertime extends HttpServlet {

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
        String id = request.getParameter("id");
        DataOvertimeController controller = new DataOvertimeController(OTHibernateUtil.getSessionFactory());
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            DataOvertime dataOvertime = controller.search("id", id).get(0);
            int paramJamPlgKantor = 17;

            int gaji, upah;
            upah = 0;
            gaji = Integer.parseInt(dataOvertime.getIdKaryawan().getGaji().toString());
            upah = (int) (gaji * (0.01));
            String idOT = dataOvertime.getId().toString();
            Date tglMasuk = dataOvertime.getTgl();
            Date jamMasuk = dataOvertime.getJamMasuk();
            Date jamPulang = dataOvertime.getJamPulang();
            int jamMsk = Integer.parseInt(new SimpleDateFormat("HH").format(jamMasuk));
            int jamPlg = Integer.parseInt(new SimpleDateFormat("HH").format(jamPulang));
            if (jamPlg >= 21) {
                jamPlg = 21;
            }
            String ket = dataOvertime.getKeterangan();
            if(dataOvertime.getIdJenisLembur().getIdJenisLembur().toString().equals("1")){
                if(jamPlg>17){
                    upah = upah * (jamPlg - paramJamPlgKantor);
                }else{
                    upah = 0;
                }
            }else{
                upah = upah * (jamPlg - jamMsk);
            }
            String upahh = upah + "";
            String jenisLembur = dataOvertime.getIdJenisLembur().getIdJenisLembur().toString();
            String karyawanId = dataOvertime.getIdKaryawan().getId().toString();
            String status = "2";
            if (controller.saveOrEdit(idOT, tglMasuk, jamMasuk, jamPulang, ket, upahh, jenisLembur, karyawanId, status)) {
                response.sendRedirect("views/dataOvertime.jsp");
            } else {
                out.println("Gagal");
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
