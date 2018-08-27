<%-- 
    Document   : editKaryawan
    Created on : Aug 13, 2018, 6:26:31 AM
    Author     : BINTANG
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="tools.OTHibernateUtil"%>
<%@page import="entities.Role"%>
<%@page import="controllers.RoleController"%>
<%@page import="entities.Karyawan"%>
<%@page import="controllers.KaryawanController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit data karyawan</title>
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
        <%            
            if (session.getAttribute("id") == null) {
                response.sendRedirect("login.jsp");
            } else {
                if (!dataUser.getIdRole().getId().equals("ADM")) {
                    response.sendRedirect("home.jsp");
                } else {

        %>
        <div id="wrapper">
            <%@include file="sidebar.jsp" %>
            <div id="content-wrapper">
                <div class="container-fluid">
                    <div class="col-lg-12" id="header-home">
                        <h1><b>EDIT DATA KARYAWAN</b></h1>
                    </div>
                    <%    Karyawan kar = (Karyawan) kc.getById(session.getAttribute("id_edit").toString());
                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        String tglLahir = dateFormat.format(kar.getTglLahir());
                        String tglMasuk = dateFormat.format(kar.getTglMasuk());

                    %>
                    <div class="col-lg-12">
                        <form action="../actionEditKaryawan" method="GET">
                            <div class="form-group row">
                                <label for="inpId" class="col-sm-2 col-form-label">ID Karyawan</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="inpId"name="txtIdKaryawan" value="<%= kar.getId()%>" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inpNmKaryawan" class="col-sm-2 col-form-label">Nama Karyawan</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="inpNmKaryawan" name="txtNamaPegawai" value="<%= kar.getNama()%>" >
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="TglLahir" class="col-sm-2 col-form-label">Tanggal Lahir</label>
                                <div class="col-sm-2">
                                    <input type="date" class="form-control" id="TglLahir" name="txtTglLahir" value="<%= tglLahir%>" >
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="role" class="col-sm-2 col-form-label">Role</label>
                                <div class="col-sm-2">
                                    <%  RoleController rc = new RoleController(OTHibernateUtil.getSessionFactory()); %>
                                    <select name="cmbRole" class="form-control" id="role">
                                        <% for (Role role : rc.getAll()) {%>
                                        <option value="<%=role.getId()%>" 
                                                <%if (kar.getIdRole().getId().equalsIgnoreCase(role.getId())) { %>selected<% }%> >
                                            <%=role.getNama()%>
                                        </option>
                                        <% }%>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="TglMasuk" class="col-sm-2 col-form-label">Tanggal Bergabung</label>
                                <div class="col-sm-2">
                                    <input type="date" class="form-control" id="TglMasuk" name="txtTglMasuk" value="<%= tglMasuk%>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="alamat" class="col-sm-2 col-form-label">Alamat</label>
                                <div class="col-sm-4">
                                    <textarea name="txtAlamat" id="alamat" class="form-control" ><%= kar.getAlamat()%></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="form-group">
                                    <label class="col-sm-4 col-form-label">Jenis Kelamin</label>
                                    <span class="col-sm-8 jenisKel">
                                        <label class="radio-inline ">
                                            <input type="radio" name="jenisKelamin" value="L" <% if (kar.getJenisKelamin().equalsIgnoreCase("L")) {%>checked <% }%>>Laki-laki
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="jenisKelamin" value="P" <% if (kar.getJenisKelamin().equalsIgnoreCase("P")) {%>checked <% }%>>Perempuan
                                        </label>
                                    </span>
                                </div>
                            </div>    
                            <div class="form-group row">
                                <label for="email" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="email" name="txtEmail" value="<%= kar.getEmail()%>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="gaji" class="col-sm-2 col-form-label">Gaji</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="gaji" name="txtGaji" value="<%= kar.getGaji()%>" >
                                </div>
                            </div>

                            <div class="col-sm-6 text-center">
                                <input type="submit" value="Save" class="btn btn-outline btn-primary" />
                            </div>
                            <div class="col-sm-6 text-center">
                                <p>
                                    <%
                                        if (session.getAttribute("msg") != null) {
                                            out.print(session.getAttribute("msg"));
                                        }
                                        session.setAttribute("msg", " ");
                                    %>
                                </p>
                            </div>
                        </form>
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
<% }
    }%>