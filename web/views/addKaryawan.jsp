<%-- 
    Document   : addKaryawan
    Created on : Aug 13, 2018, 3:09:31 PM
    Author     : AINAN
--%>

<%@page import="tools.OTHibernateUtil"%>
<%@page import="entities.Role"%>
<%@page import="controllers.RoleController"%>
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
        <title>Tambah Data Karyawan</title>
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
            <div class="col-lg-12">
                <h1 class="page-header"><label>TAMBAH DATA KARYAWAN</label></h1>
            </div>
            <div class="col-lg-12">

                <form action="../actionTambahServlet" method="GET">

                    <div class="form-group row">
                        <label for="inpNmKaryawan" class="col-sm-2 col-form-label">Nama Karyawan</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="inpNmKaryawan" name="txtNamaPegawai" >
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="TglLahir" class="col-sm-2 col-form-label">Tanggal Lahir</label>
                        <div class="col-sm-4">
                            <input type="date" class="form-control" id="TglLahir" name="txtTglLahir" >
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="role" class="col-sm-2 col-form-label">Role</label>
                        <div class="col-sm-2">
                            <%  RoleController rc = new RoleController(OTHibernateUtil.getSessionFactory()); %>
                            <select name="cmbRole" class="form-control" id="role">
                                <%   for (Role role : rc.getAll()) {%>
                                <option value="<%= role.getId()%>"><%= role.getNama()%></option>           
                                <%    } %>

                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="TglMasuk" class="col-sm-2 col-form-label">Tanggal Bergabung</label>
                        <div class="col-sm-4">
                            <input type="date" class="form-control" id="TglMasuk" name="txtTglMasuk">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="alamat" class="col-sm-2 col-form-label">Alamat</label>
                        <div class="col-sm-4">
                            <textarea name="txtAlamat" id="alamat" class="form-control" ></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="form-group">
                            <label class="col-sm-2 col-form-label">Jenis Kelamin</label>
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input type="radio" name="jenisKelamin" value="L">Laki-laki
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="jenisKelamin" value="P">Perempuan
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="email" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="email" name="txtEmail">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="gaji" class="col-sm-2 col-form-label">Gaji</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="gaji" name="txtGaji">
                        </div>
                    </div>

                    <div class="col-sm-6 text-center">
                        <input type="submit" value="Save" class="btn btn-outline btn-primary" />
                    </div>
                </form>
                <br>
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