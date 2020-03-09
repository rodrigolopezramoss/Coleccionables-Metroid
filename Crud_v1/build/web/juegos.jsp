<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

    <title>Coleccionables de Metroid - Rodrigo López Ramos</title>
    
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
        <div class="panel-heading text-center d-inline">
            
            <h2>Juegos de la saga Metroid</h2>
            <form method="get" action="zonas.jsp">
                <button type="submit" value="Añadir" class="btn btn-primary">Zonas</button>
            </form>
        </div>
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/col_metroid","admin", "1234");
          Statement s = conexion.createStatement();

          ResultSet listado = s.executeQuery ("SELECT * FROM juego");
        %>

        <table class="table table-striped">
        <tr><th>Código</th><th>Nombre</th><th>Descripción</th></tr>
        <%
            if(session.getAttribute("usuario").equals("admin")){
        %> 
        <form method="get" action="anyadirjue.jsp">
          <tr>
              <td><input type="text" name="CodJue" size="5"></td>
              <td><input type="text" name="NomJue" size="15"></td>
              <td><input type="text" name="DescripJue" size="20"></td>
              <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Añadir</button></td>
              <td></td>
          </tr>           
        </form>
        <% } %>
        <%
          while (listado.next()) {
            out.println("<tr><td>");
            out.println(listado.getString("CodJue") + "</td>");
            out.println("<td>" + listado.getString("NomJue") + "</td>");
            out.println("<td>" + listado.getString("DescripJue") + "</td>");
        %>
        <td>
        <form method="get" action="modifjue.jsp">
	  <input type="hidden" name="CodJue" value="<%=listado.getString("CodJue") %>">
          <input type="hidden" name="NomJue" value="<%=listado.getString("NomJue") %>">
          <input type="hidden" name="DescripJue" value="<%=listado.getString("DescripJue") %>">
          <button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
	</form>
	</td>
	
        <td>
        <form method="get" action="elimina.jsp">
          <input type="hidden" name="CodJue" value="<%=listado.getString("CodJue") %>"/>
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