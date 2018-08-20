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
            <div class="container">
                <div class="col-lg-12">
                    <h1 class="page-header"><label>UBAH PASSWORD</label></h1>
                </div>
                <div class="col-lg-12">
                    <form action="../actionEditPassword" method="GET">
                        <input type="hidden" name="id" value="<%=session.getAttribute("id") %>">
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
                    </form>
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