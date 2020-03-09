<%-- 
    Document   : login
    Created on : 09-mar-2020, 10:22:04
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
    </head>
    <body>
       <%
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        
        if (usuario.equals("admin") && contrasena.equals("4321")) {
            session.setAttribute("usuario", usuario);
            response.sendRedirect("juegos.jsp");
        } else if (usuario.equals("usu1") && contrasena.equals("1221")) {
            session.setAttribute("usuario", usuario);
            response.sendRedirect("juegos.jsp");
        } else {
            session.setAttribute("error", "Usuario o contraseña incorrecto");
            response.sendRedirect("formulario-login.jsp");
        }
        %>
    </body>
</html>
