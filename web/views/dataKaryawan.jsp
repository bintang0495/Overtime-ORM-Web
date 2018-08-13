<%-- 
    Document   : dataKaryawan
    Created on : Aug 12, 2018, 10:39:04 PM
    Author     : BINTANG
--%>

<%@page import="tools.HibernateUtil"%>
<%@page import="controllers.KaryawanController"%>
<%@page import="entities.Karyawan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data Karyawan</title>
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
                        KaryawanController kc = new KaryawanController(HibernateUtil.getSessionFactory());
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
                                <th>Role </th>
                                <th>Nama Karyawan</th>
                                <th>Tanggal Lahir</th>
                                <th>Tanggal Bergabung</th>
                                <th>Alamat</th>
                                <th>Gaji</th>
                                <th>Email</th>
                                <th>Jenis Kelamin</th>
                                <th>Password</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Karyawan kar : kc.getAllSort("id", "asc")) {
                            %>
                            <tr>

                                <td><%= kar.getId()%></td>
                                <td><%= kar.getIdRole()%></td>
                                <td><%= kar.getNama()%></td>
                                <td><%=kar.getTglLahir()%></td>
                                <td><%=kar.getTglMasuk()%></td>
                                <td><%=kar.getAlamat()%></td>
                                <td><%=kar.getGaji()%></td>
                                <td><%=kar.getEmail()%></td>
                                <td><%=kar.getJenisKelamin()%></td>
                                <td><%=kar.getPassword()%></td>
                                <td>
                                    <span><a href="#">Edit</a></span>
                                    <span><a href="#">Delete</a></span>
                                </td>
                            </tr>
                            <%

                                }
                            %>
                        </tbody>
                    </table>
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
