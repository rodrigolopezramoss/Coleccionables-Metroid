<%-- 
    Document   : formulario-login
    Created on : 09-mar-2020, 10:06:52
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar sesión</title>
        
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
            
            #envia {
                margin-top: 5px
            }
            
        </style>
        
        
    </head>
    <body>
        <div id="wrapper">
            <%
            if (session.getAttribute("usuario") != null) {
            response.sendRedirect("index.jsp");
            }
            %>
            <h1>Iniciar sesión</h1>
            <form  action="login.jsp">
                Usuario: <input type="text" name="usuario"><br>
                Contraseña: <input type="password" name="contrasena"><br>
                <input id="envia" type="submit" value="Enviar">
            </form>
            <div style="color: red;">
                <p>
                    <%=
                    session.getAttribute("error") == null ?
                    "" : session.getAttribute("error")
                    %>
                    <% session.removeAttribute("error"); %>
                </p>
            </div>
        </div>
    </body>
</html>
