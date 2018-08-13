<%-- 
    Document   : dataOvertime
    Created on : Aug 13, 2018, 5:34:35 AM
    Author     : BINTANG
--%>

<%@page import="entities.DataOvertime"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="controllers.DataOvertimeController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Overtime</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Style Bootstrap-->
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">

        <!--Style Custom-->
        <!--<link rel="stylesheet" href="bootstrap/css/custom.css">-->
        <link rel="stylesheet" href="../bootstrap/css/dashboard.css">
    </head>   
    <body>
        <%@include file="navbarhead.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <%@include file="navbar.jsp" %>
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

                    <%
                        DataOvertimeController overtimeController = new DataOvertimeController(HibernateUtil.getSessionFactory());
                    %>
                    <h1>Karyawan</h1>
                    <select name="cmbCategory">
                    </select>
                    <input type="text" name="txtFind" value="" />
                    <input type="submit" value="Find" name="btnFind" />

                    <table border="1">
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
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (DataOvertime dataOvertime : overtimeController.getAll()) {
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
                                <td><a href="#">Edit</a></td>
                            </tr>
                            <%

                                }
                            %>
                        </tbody>
                    </table>
                    <div class="text-center"> <a class="btn btn-outline-success " href="#">Tambah</a> </div>
                </main>
            </div>
        </div>
        <!--jQuery lokal -->
        <script src="../bootstrap/js/popper.min.js"></script>
        <script src="../bootstrap/js/jquery-slim.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>

        <!--Custom JS--> 
        <!--<script src="../bootstrap/js/modal.js"></script>-->
        <script src="../bootstrap/js/custom.js"></script>
        <!--jQuery lokal -->
        <script src="../bootstrap/js/popper.min.js"></script>
        <script src="../bootstrap/js/jquery-slim.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>

        <!--Custom JS--> 
        <!--<script src="../bootstrap/js/modal.js"></script>-->
        <script src="../bootstrap/js/custom.js"></script>
    </body>
</html>
