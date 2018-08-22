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
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Detail Karyawan</title>
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
        <%
            Karyawan kar = (Karyawan) controller.getById(session.getAttribute("id").toString());

        %>
        <div id="page-wrapper">
            <div class="container">
                <div class="col-lg-12">
                    <h1 class="page-header"><label><%= kar.getNama()%></label></h1>
                </div>
                <div class="col-lg-12">

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">ID Karyawan</label>
                        <div class="col-sm-4">
                            <p><%= kar.getId()%></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Nama Karyawan</label>
                        <div class="col-sm-4">
                            <p><%= kar.getNama()%></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Tanggal Lahir</label>
                        <div class="col-sm-4">
                            <p><%= new SimpleDateFormat("dd-MM-yyyy").format(kar.getTglLahir())%></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Tanggal Bergabung</label>
                        <div class="col-sm-4">
                            <p><%= new SimpleDateFormat("dd-MM-yyyy").format(kar.getTglMasuk())%></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Tanggal Lahir</label>
                        <div class="col-sm-4">
                            <p><%= new SimpleDateFormat("dd-MM-yyyy").format(kar.getTglLahir())%></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Role</label>
                        <div class="col-sm-4">
                            <p><%= kar.getIdRole().getNama()%></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Alamat</label>
                        <div class="col-sm-4">
                            <p><%= kar.getAlamat()%></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-4">
                            <p><%= kar.getEmail()%></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Role</label>
                        <div class="col-sm-4">
                            <p><%= kar.getIdRole().getNama()%></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Gaji</label>
                        <div class="col-sm-4">
                            <p><%= kar.getGaji()%></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Jenis Kelamin</label>
                        <div class="col-sm-4">
                            <p><% if(kar.getJenisKelamin().equals("P")){
                                out.println("Perempuan");
                            }else{
                                out.println("Laki-laki");
                            }%></p>
                        </div>
                    </div>
                </div>

            </div>
            <br>
            <br>
            <br>
            <br>
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
