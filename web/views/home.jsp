<%-- 
    Document   : home
    Created on : Aug 13, 2018, 5:27:24 AM
    Author     : BINTANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Home</title>

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
        <%
            if (session.getAttribute("id") == null) {
                response.sendRedirect("login.jsp");
            } else {
        %>
        <%@include file="navbar.jsp" %>
        <div id="wrapper">
            <%@include file="sidebar.jsp" %>
            <div id="content-wrapper">
                <div class="row">
                    <div class="col-lg-12" id="header-home">
                        <h1><b>Selamat Datang</b></h1>
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