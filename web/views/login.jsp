<%-- 
    Document   : login
    Created on : Aug 15, 2018, 5:39:16 AM
    Author     : BINTANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title> Login </title>
    <link rel="stylesheet" type="text/css" href="styleLogin.css">
</head>
    <body>
    <div class="login-box">
    <img src="../library/img/avatar.png" class="avatar">
        <h1>Login Here</h1>
        <form action="../validationServlet" method="GET">
            <p>Email</p>
            <input type="text" name="txtEmail" placeholder="Enter your email">
            <p>Password</p>
            <input type="password" name="txtPassword" placeholder="Enter your password">
            <input type="submit" name="submit" value="Login">
            <p class="text-center">
                <%
                    if(session.getAttribute("msg")!= null){
                        out.println(session.getAttribute("msg"));
                    }
                    session.setAttribute("msg", " ");
                %>
            </p>
            </form>


        </div>

    </body>
</html>
</html>
