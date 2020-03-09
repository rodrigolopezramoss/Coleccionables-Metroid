<%-- 
    Document   : logout
    Created on : 09-mar-2020, 11:01:04
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          session.removeAttribute("usuario");
          response.sendRedirect("index.jsp");
        %>
    </body>
</html>
