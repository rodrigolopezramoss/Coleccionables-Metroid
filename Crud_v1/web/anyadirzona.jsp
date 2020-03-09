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
      <div id="aviso">
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/col_metroid","admin", "1234");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      // Comprueba la existencia del número de coleccionable introducido
      String consultaNumSocio = "SELECT * FROM zonaWHERE CodZona="
                                + Integer.valueOf(request.getParameter("CodZona"));      
      
      ResultSet numeroDeSocios = s.executeQuery (consultaNumSocio);
      numeroDeSocios.last();
      
      if (numeroDeSocios.getRow() != 0) {
        out.println("Lo siento, no se ha podido dar de alta, ya existe una zona con el número "
                    + request.getParameter("CodZona") + ".");
      } else {
        String insercion = "INSERT INTO zona VALUES (" + Integer.valueOf(request.getParameter("CodZona"))
                           + ", '" + request.getParameter("NomZona")
                           + "', '" + request.getParameter("DescripZona")
                           + "', " + Integer.valueOf(request.getParameter("CodJue")) + ")";
        s.execute(insercion);
        out.println("Zona añadida correctamente.");
      }
      conexion.close();
    %>
    <br>
    <a href="zonas.jsp" class="btn btn-primary">Volver a zonas</button>
      </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>