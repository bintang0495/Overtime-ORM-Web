<%-- 
    Document   : dataHistoryOvertime
    Created on : Aug 13, 2018, 2:53:37 PM
    Author     : BINTANG
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.DataOvertime"%>
<%@page import="controllers.DataOvertimeController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>History Overtime</title>
        <!-- Bootstrap core CSS-->
        <link href="../library/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template-->
        <link href="../library/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="../library/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../library/css/sb-admin.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body id="page-top">
        <%@include file="navbar.jsp" %>
        <div id="wrapper">
            <% if (session.getAttribute("id") == null) {
                    response.sendRedirect("login.jsp");
                } else {
                    if (!dataUser.getIdRole().getId().equals("USR")) {
                        response.sendRedirect("home.jsp");
                    } else {
            %>
            <%@include file="sidebar.jsp" %>
            <div id="content-wrapper">
                <div class="container-fluid">

                    <div class="col-lg-12">
                        <h1 class="page-header"><label>TABEL HISTORY OVERTIME</label></h1>

                    </div>
                    <div class="col-lg-12 text-center">
                        <label><%if (session.getAttribute("msg") != null) {
                                out.println(session.getAttribute("msg"));
                                session.setAttribute("msg", " ");
                            } %></label>

                    </div>
                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Data History Overtime</div>
                        <div class="card-body">

                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <%
                                        DataOvertimeController overtimeController = new DataOvertimeController(OTHibernateUtil.getSessionFactory());

                                    %>

                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Nama Karyawan</th>
                                            <th>Tanggal Lembur</th>
                                            <th>Jam Berangkat</th>
                                            <th>Jam Pulang</th>
                                            <th>Keterangan</th>
                                            <th>Status</th>
                                            <th>Jenis Lembur</th>
                                            <th>Upah Lembur</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                
                                            int i =1;
                                            for (DataOvertime dataOvertime : overtimeController.getAllByCategorySorting("idKaryawan", dataUser.getId().toString(), "asc")) {
                                                if (dataOvertime.getKeterangan() != null && dataOvertime.getJamPulang() != null) {
                                        %>
                                        <tr>
                                            <td><%= i %></td>
                                            <td><%= dataOvertime.getIdKaryawan().getNama()%></td>
                                            <td class="text-center"><%= new SimpleDateFormat("dd-MM-yyyy").format(dataOvertime.getTgl())%></td>
                                            <td class="text-center"> <%= new SimpleDateFormat("HH:mm").format(dataOvertime.getJamMasuk())%></td>
                                            <td class="text-center"><%= new SimpleDateFormat("HH:mm").format(dataOvertime.getJamPulang())%></td>
                                            <td><%=dataOvertime.getKeterangan()%></td>
                                            <td><%=dataOvertime.getIdStatus().getStatus()%></td>
                                            <td><%=dataOvertime.getIdJenisLembur().getJenisLembur()%></td>
                                            <td><%=dataOvertime.getUpahLembur()%></td>
                                        </tr>
                                        <%    i++;  }
                                            } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <%@include file="footer.jsp" %>
            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="../library/vendor/jquery/jquery.min.js"></script>
        <script src="../library/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="../library/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="../library/vendor/chart.js/Chart.min.js"></script>
        <script src="../library/vendor/datatables/jquery.dataTables.js"></script>
        <script src="../library/vendor/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="../library/js/sb-admin.min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="../library/js/demo/datatables-demo.js"></script>
        <script src="../library/js/demo/chart-area-demo.js"></script>
    </body>
</html>
<% }
                        }%>