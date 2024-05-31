<%@page import="java.sql.*"%>
<%@page import="com.producto.datos.Usuario"%>
<%@page import="com.producto.datos.Conexion"%>
<%@page session="true" %>
<%
    Integer idPerfil = (Integer) session.getAttribute("id_perfil");
    if (idPerfil == null || idPerfil != 1) {
        response.sendRedirect("login.jsp");
        return;
    }

    String nombre = request.getParameter("nombre");
    String cedula = request.getParameter("cedula");
    String correo = request.getParameter("correo");
    String clave = request.getParameter("clave");
    int estado = Integer.parseInt(request.getParameter("estado"));
    int id_perfil = Integer.parseInt(request.getParameter("id_perfil"));

    String update = "UPDATE tb_usuario SET nombre_us = ?, cedula_us = ?, clave_us = ?, id_est = ?, id_per = ? WHERE correo_us = ?";

    try {
        Conexion con = new Conexion();
        PreparedStatement pr = con.getConexion().prepareStatement(update);
        pr.setString(1, nombre);
        pr.setString(2, cedula);
        pr.setString(3, clave);
        pr.setInt(4, estado);
        pr.setInt(5, id_perfil);
        pr.setString(6, correo);

        int rowsUpdated = pr.executeUpdate();
        if (rowsUpdated > 0) {
            out.println("<p>Usuario actualizado correctamente.</p>");
        } else {
            out.println("<p>Error al actualizar el usuario.</p>");
        }

        pr.close();
        con.getConexion().close();
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>

<a href="editarPerfilAdmin.jsp">Volver</a>
