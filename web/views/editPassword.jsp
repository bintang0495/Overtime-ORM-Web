<%-- 
    Document   : editPassword
    Created on : Aug 13, 2018, 6:27:29 AM
    Author     : BINTANG
--%>

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
        <title>Ubah password</title>
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
                        <h1 class="page-header"><label>EDIT PASSWORD</label></h1>
                    </div>
                    <div class="col-lg-12">
                        <form action="../actionEditPassword" method="GET">
                            <input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
                            <div class="form-group row">
                                <label for="inpPassword" class="col-sm-2 col-form-label">Password Lama</label>
                                <div class="col-sm-6">
                                    <input type="password" class="form-control" name="passLama" id="inpPassword"  placeholder="Password Lama">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="inpPasswordBaru" class="col-sm-2 col-form-label">Password Baru</label>
                                <div class="col-sm-6">
                                    <input type="password" name="passBaru" class="form-control" id="inpPasswordBaru" placeholder="Password Baru">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="rePasswordBaru" class="col-sm-2 col-form-label">Konfirmasi Password Baru</label>
                                <div class="col-sm-6">
                                    <input type="password" name="rePassBaru" class="form-control" id="rePasswordBaru" placeholder="Ulangi Password Baru">
                                </div>
                            </div>
                            <div class="col-sm-8 text-center">
                                <input type="submit" value="Save" class="btn btn-outline btn-primary" />
                            </div>
                            <div class="col-sm-8 text-center">
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