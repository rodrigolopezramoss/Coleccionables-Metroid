<%-- 
    Document   : Elimina
    Created on : 08-mar-2020, 14:40:22
    Author     : usuario
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/col_metroid","admin", "1234");
      Statement s = conexion.createStatement();
      
      s.execute ("DELETE FROM juego WHERE CodJue=" + request.getParameter("CodJue"));
      
      s.execute ("DELETE FROM zona WHERE CodZona=" + request.getParameter("CodZona"));
      
      s.execute ("DELETE FROM coleccionables WHERE CodCol=" + request.getParameter("CodCol"));
      
      s.close();
    %>	
    <script>
        document.location = "juegos.jsp"
        document.location = "zonas.jsp"
        document.location = "colecciones.jsp"
    </script> 
  </body>
</html>

