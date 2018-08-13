<%-- 
    Document   : login
    Created on : Aug 13, 2018, 3:00:53 PM
    Author     : BINTANG
--%>

<%@page import="entities.Karyawan"%>
<%@page import="tools.HibernateUtil"%>
<%@page import="controllers.KaryawanController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Style Bootstrap-->
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">

        <!--Style Custom-->
        <!--<link rel="stylesheet" href="../bootstrap/css/custom.css">-->
        <link rel="stylesheet" href="../bootstrap/css/dashboard.css">
    </head>
    <body>
        <% KaryawanController kc = new KaryawanController(HibernateUtil.getSessionFactory()); %>
        <% for (Karyawan kar : kc.getAllSort("id", "asc")) {%>
        <h1 class="text-center">Login</h1>
        <div class ="container">
            <form action="../validationServlet?=<%=kar.getEmail()%>"> <%
                }
                %>
                <div class="form-group row">
                    <label for="inputEmail"  class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <input type="text"  class="form-control" id="inputEmail" name="txtEmail">
                        
                    </div>

                </div>
                <div class="form-group row">
                    <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password"  class="form-control" id="inputPassword" name="txtPassword">
                    </div>
                </div>
                <div class="form-group row text-center">
                    <input type="submit" value="Save" class="btn btn-outline-secondary">
                </div>   
            </form>
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
