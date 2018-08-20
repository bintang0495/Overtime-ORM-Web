<%-- 
    Document   : dataHistoryOvertime
    Created on : Aug 13, 2018, 2:53:37 PM
    Author     : BINTANG
--%>

<%@page import="entities.DataOvertime"%>
<%@page import="controllers.DataOvertimeController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("id") == null) {
        response.sendRedirect("login.jsp");
    } else {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>History Overtime</title>
        <!-- Bootstrap Core CSS -->
        <link href="../lib/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../lib/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../lib/dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../lib/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Data Overtime</h1>
                </div>
                <div class="col-lg-12">

                    <%
                        DataOvertimeController overtimeController = new DataOvertimeController(OTHibernateUtil.getSessionFactory());
                        KaryawanController karyawanController = new KaryawanController(OTHibernateUtil.getSessionFactory());
                    %>
                    <div class="col-3 col-sm-2">
                        <select class="form-control">
                            <option value="1">Januari</option>
                            <option value="2">Februari</option>
                            <option value="3">Maret</option>
                            <option value="4">April</option>
                            <option value="5">Mei</option>
                            <option value="6">Juni</option>
                            <option value="7">Juli</option>
                            <option value="8">Agustus</option>
                            <option value="9">September</option>
                            <option value="10">Oktober</option>
                            <option value="11">November</option>
                            <option value="12">Desember</option>
                        </select></div>
                    <div >
                        <span class="col-6 col-sm-6"><input type="text" class="form-control" name="txtFind" value="" /></span>
                        <span class="col-3 col-sm-2"> <input type="submit" value="Search" class="form-control" name="btnFind" /></span>

                    </div>                
                </div>
                    <br>
                <div class="col-lg-12">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
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
                                for (DataOvertime dataOvertime : overtimeController.search("idKaryawan", session.getAttribute("id").toString())) {
                            %>
                            <tr>
                                <td><%= dataOvertime.getId()%></td>
                                <td><%= dataOvertime.getIdKaryawan().getNama()%></td>
                                <td><%= dataOvertime.getJamMasuk()%></td>
                                <td><%=dataOvertime.getJamPulang()%></td>
                                <td><%=dataOvertime.getKeterangan()%></td>
                                <td><%=dataOvertime.getIdStatus().getStatus()%></td>
                                <td><%=dataOvertime.getIdJenisLembur().getJenisLembur()%></td>
                                <td><%=dataOvertime.getUpahLembur()%></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- jQuery -->
        <script src="../lib/vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../lib/vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../lib/vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../lib/dist/js/sb-admin-2.js"></script>
    </body>
</html>
<% }%>