<%-- 
    Document   : profilUser
    Created on : Aug 20, 2018, 6:30:32 AM
    Author     : BINTANG
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entities.Karyawan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("id") == null) {
        response.sendRedirect("login.jsp");
    } else {
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Profil User</title>

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
            <%@include file="sidebar.jsp" %>
            <div id="content-wrapper">
                <div class="container-fluid">
                    <div class="col-lg-12">
                        <h1 class="page-header"><label>DETAIL KARYAWAN</label></h1>
                    </div>
                    <div class="col-lg-12">

                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">ID Karyawan</label>
                            <div class="col-sm-4">
                                <p><%= dataUser.getId()%></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Nama Karyawan</label>
                            <div class="col-sm-4">
                                <p><%= dataUser.getNama()%></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Tanggal Lahir</label>
                            <div class="col-sm-4">
                                <p><%= new SimpleDateFormat("dd-MM-yyyy").format(dataUser.getTglLahir())%></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Tanggal Bergabung</label>
                            <div class="col-sm-4">
                                <p><%= new SimpleDateFormat("dd-MM-yyyy").format(dataUser.getTglMasuk())%></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Tanggal Lahir</label>
                            <div class="col-sm-4">
                                <p><%= new SimpleDateFormat("dd-MM-yyyy").format(dataUser.getTglLahir())%></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Role</label>
                            <div class="col-sm-4">
                                <p><%= dataUser.getIdRole().getNama()%></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Alamat</label>
                            <div class="col-sm-4">
                                <p><%= dataUser.getAlamat()%></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-4">
                                <p><%= dataUser.getEmail()%></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Role</label>
                            <div class="col-sm-4">
                                <p><%= dataUser.getIdRole().getNama()%></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Gaji</label>
                            <div class="col-sm-4">
                                <p><%= dataUser.getGaji()%></p>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Jenis Kelamin</label>
                            <div class="col-sm-4">
                                <p><% if (dataUser.getJenisKelamin().equals("P")) {
                                        out.println("Perempuan");
                                    } else {
                                        out.println("Laki-laki");
                                    }
                                    %></p>
                            </div>
                        </div>
                    </div>

                </div>
                                    <%@include file="footer.jsp" %>
            </div>
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
<% }%>
