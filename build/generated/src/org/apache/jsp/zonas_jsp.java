package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;

public final class zonas_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        \n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\" integrity=\"sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7\" crossorigin=\"anonymous\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css\" integrity=\"sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js\" integrity=\"sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("        <title>Zonas</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("\t\t\t<br><br>\t\t\t\n");
      out.write("      <div class=\"panel panel-primary\">\n");
      out.write("        <div class=\"panel-heading text-center\">\n");
      out.write("            <table class=\"table table-striped\">\n");
      out.write("            <tr>\n");
      out.write("              <td><form method=\"get\" action=\"index.jsp\">\n");
      out.write("                <button type=\"submit\" value=\"Añadir\" class=\"btn btn-primary\">Juegos</button>\n");
      out.write("              </form></td>\n");
      out.write("              <h2>Zonas de los juegos</h2>\n");
      out.write("            </tr></table>\n");
      out.write("        </div>\n");
      out.write("        ");

          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/col_metroid","admin", "1234");
          Statement s = conexion.createStatement();

          ResultSet listado = s.executeQuery ("SELECT * FROM zona z JOIN juego j ON z.CodJue = j.CodJue");
        
      out.write("\n");
      out.write("\n");
      out.write("        <table class=\"table table-striped\">\n");
      out.write("        <tr><th>Nombre</th><th>Descripción</th><th>Juego</th></tr>\n");
      out.write("        <form method=\"get\" action=\"grabaSocio.jsp\">\n");
      out.write("          <tr>\n");
      out.write("              <td><input type=\"text\" name=\"NomZona\" size=\"30\"></td>\n");
      out.write("              <td><input type=\"text\" name=\"DescripZona\" size=\"20\"></td>\n");
      out.write("              <td><input type=\"text\" name=\"NomJue\" size=\"20\"></td>\n");
      out.write("              <td><button type=\"submit\" value=\"Añadir\" class=\"btn btn-primary\"><span class=\"glyphicon glyphicon-plus\"></span> Añadir</button></td>\n");
      out.write("              <td></td>\n");
      out.write("          </tr>           \n");
      out.write("        </form>\n");
      out.write("        ");

          while (listado.next()) {
            out.println("<tr><td>");
            out.println(listado.getString("NomZona") + "</td>");
            out.println("<td>" + listado.getString("DescripZona") + "</td>");
            out.println("<td>" + listado.getString("NomJue") + "</td>");
        
      out.write("\n");
      out.write("        <td>\n");
      out.write("        <form method=\"get\" action=\"modificaSocio.jsp\">\n");
      out.write("\t  <input type=\"hidden\" name=\"CodZona\" value=\"");
      out.print(listado.getString("CodZona") );
      out.write("\">\n");
      out.write("          <input type=\"hidden\" name=\"NomZona\" value=\"");
      out.print(listado.getString("NomZona") );
      out.write("\">\n");
      out.write("          <input type=\"hidden\" name=\"DescripZona\" value=\"");
      out.print(listado.getString("DescripZona") );
      out.write("\">\n");
      out.write("          <input type=\"hidden\" name=\"CodJue\" value=\"");
      out.print(listado.getString("CodJue") );
      out.write("\">\n");
      out.write("          <button type=\"submit\"  class=\"btn btn-info\"><span class=\"glyphicon glyphicon-pencil\"></span> Modificar</button>\n");
      out.write("\t</form>\n");
      out.write("\t</td>\n");
      out.write("\t\n");
      out.write("        <td>\n");
      out.write("        <form method=\"get\" action=\"borraSocio.jsp\">\n");
      out.write("          <input type=\"hidden\" name=\"CodZona\" value=\"");
      out.print(listado.getString("CodZona") );
      out.write("\"/>\n");
      out.write("          <button type=\"submit\" class=\"btn btn-danger\"><span class=\"glyphicon glyphicon-remove\"></span> Eliminar</button>\n");
      out.write("        </form>\n");
      out.write("        </td>\n");
      out.write("        </tr>\n");
      out.write("        ");

          } // while   

          conexion.close();
        
      out.write("\n");
      out.write("\n");
      out.write("        </table>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"text-center\">&copy; Rodrigo López Ramos</div>\n");
      out.write("    </div>\n");
      out.write("    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->\n");
      out.write("    <script src=\"js/jquery.min.js\"></script>\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
