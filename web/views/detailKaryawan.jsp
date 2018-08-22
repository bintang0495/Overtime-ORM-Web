<%-- 
    Document   : detailKaryawan
    Created on : Aug 14, 2018, 10:41:04 AM
    Author     : AINAN
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="entities.Karyawan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <% if (session.getAttribute("id") == null) {
                response.sendRedirect("login.jsp");
            } 
        else {
                if(!dataUser.getIdRole().getId().equals("ADM")){
                    response.sendRedirect("home.jsp");
                }else{
        %>
        <div id="page-wrapper">
            <div class="container">
                <div class="col-lg-12">
                    <h1 class="page-header"><label>DETAIL KARYAWAN</label></h1>
                </div>
                <div class="col-lg-12">
                    <%
                        Karyawan kar = (Karyawan) controller.getById(session.getAttribute("detailKaryawanId").toString());
                        
                    %>
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
                            <p><%= new SimpleDateFormat("dd-MM-yyyy").format(kar.getTglLahir()) %></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Tanggal Bergabung</label>
                        <div class="col-sm-4">
                            <p><%= new SimpleDateFormat("dd-MM-yyyy").format(kar.getTglMasuk()) %></p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Tanggal Lahir</label>
                        <div class="col-sm-4">
                            <p><%= new SimpleDateFormat("dd-MM-yyyy").format(kar.getTglLahir()) %></p>
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
                            <p><%= kar.getJenisKelamin()%></p>
                        </div>
                    </div>
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
<% }
}%>