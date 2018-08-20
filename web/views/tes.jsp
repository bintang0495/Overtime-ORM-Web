<%-- 
    Document   : tes
    Created on : Aug 17, 2018, 4:59:20 PM
    Author     : BINTANG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%= session.getAttribute("id") %>
        <select name="cmbRole">
        <% for (int i = 0; i < 5; i++) {
        %>
        
            <option value="<%=i %>"
               <% if(i == 3){ %>
               selected 
               <% }%>
            >
                <%=i %>
            </option>
        
        <%
            }
        %>
        </select>
    </body>
</html>
