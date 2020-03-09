<%-- 
    Document   : index
    Created on : 09-mar-2020, 10:35:22
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
        <style>
           body {
                background-color: #5078a6
            }
            
            #wrapper {
                
                width: 25%;
                padding: 7px;
                border-radius: 10px;
                margin-top: 8%;
                margin-left: 35%;
                text-align: center;
                background-color: #eed299
            }
        </style>
        
        
    </head>
    <body>
        <div id="wrapper">
            <h1>Bienvenido</h1>
                <%
                if (session.getAttribute("usuario") == null) {
                %>
                <a href="formulario-login.jsp">Entrar</a>
                <%
                } else {
                %>
                Logueado como <a href="perfil.jsp"><%= session.getAttribute("usuario") %></a>
                (<a href="logout.jsp">Salir</a>)
                <%
                }
                %>
         </div>
    </body>
</html>
