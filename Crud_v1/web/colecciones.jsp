<%-- 
    Document   : zonas
    Created on : 05-mar-2020, 9:46:55
    Author     : usuario
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <title>Coleccionables</title>
        
        <style>
           body {
               background-color: #7ea7d8
            }
            #aviso{
                padding: 7px;
                text-align: center;
                background-color: #eed299
            }
    </style>
        
    </head>
    <body>
        <div class="container">
            <div id="aviso">
            Logueado como <a><%= session.getAttribute("usuario") %></a>
            (<a href="logout.jsp">Salir</a>)
        </div>
			<br><br>			
      <div class="panel panel-primary">
        <div class="panel-heading text-center">
            
            <form method="get" action="zonas.jsp">
                <button type="submit" value="Añadir" class="btn btn-primary">Zonas</button>
            </form>
            <h2>Coleccionables</h2>
        </div>
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/col_metroid","admin", "1234");
          Statement s = conexion.createStatement();

          ResultSet listado = s.executeQuery ("SELECT * FROM coleccionables c, zona z, juego j WHERE c.CodJue = z.CodJue AND z.CodJue = j.CodJue");
        %>

        <table class="table table-striped">
            <%
            if(session.getAttribute("usuario").equals("admin")){
        %> 
        <tr><th>Código</th><th>Nombre</th><th>Descripción</th><th>Juego</th><th>Zona</th></tr>
        <form method="get" action="anyadircol.jsp">
          <tr>
              <td><input type="text" name="CodCol" size="5"></td>
              <td><input type="text" name="NomCol" size="20"></td>
              <td><input type="text" name="DescripcionCol" size="20"></td>
              <td><input type="text" name="CodJue" size="5"></td>
              <td><input type="text" name="CodZona" size="5"></td>
              <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td>
              <td></td>
          </tr>           
        </form>
        <% } %>
        <tr><th>Nombre</th><th>Descripción</th><th>Juego</th><th>Zona</th></tr>
        <%
          while (listado.next()) {
            out.println("<tr><td>");
            out.println(listado.getString("NomCol") + "</td>");
            out.println("<td>" + listado.getString("DescripcionCol") + "</td>");
            out.println("<td>" + listado.getString("NomJue") + "</td>");
            out.println("<td>" + listado.getString("NomZona") + "</td>");
        %>
        <td>
        <form method="get" action="modifcol.jsp">
	  <input type="hidden" name="CodCol" value="<%=listado.getString("CodCol") %>">
          <input type="hidden" name="NomCol" value="<%=listado.getString("NomCol") %>">
          <input type="hidden" name="DescripcionCol" value="<%=listado.getString("DescripcionCol") %>">
          <input type="hidden" name="CodJue" value="<%=listado.getString("CodJue") %>">
          <input type="hidden" name="CodZona" value="<%=listado.getString("CodZona") %>">
          <button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
	</form>
	</td>
	
        <td>
        <form method="get" action="elimina.jsp">
          <input type="hidden" name="CodCol" value="<%=listado.getString("CodCol") %>"/>
          <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
        </form>
        </td>
        </tr>
        <%
          } // while   

          conexion.close();
        %>

        </table>
      </div>
      <div class="text-center">&copy; Rodrigo López Ramos</div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
