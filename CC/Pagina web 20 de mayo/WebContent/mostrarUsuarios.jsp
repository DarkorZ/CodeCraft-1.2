<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.ResultSet, com.producto.datos.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mostrar Usuarios</title>
</head>
<body>

<h2>Usuarios en la Base de Datos</h2>

<%
    Usuario usuario = new Usuario();
    ResultSet rs = usuario.obtenerTodosLosUsuarios();
%>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Correo Electrónico</th>
        <th>Tipo de Usuario</th>
        <th>Acciones</th>
    </tr>
    <% while (rs.next()) { %>
    <tr>
        <td><%= rs.getInt("id_us") %></td>
        <td><%= rs.getString("nombre_us") %></td>
        <td><%= rs.getString("correo_us") %></td>
        <%-- Obtener el tipo de usuario basado en el id_per --%>
        <%
            int idPerfil = rs.getInt("id_per");
            String tipoUsuario = "";
            if (idPerfil == 1) {
                tipoUsuario = "Administrador";
            } else if (idPerfil == 2) {
                tipoUsuario = "Usuario Regular";
            } else {
                tipoUsuario = "Desconocido";
            }
        %>
        <td><%= tipoUsuario %></td>
        <td>
            <form action="eliminarUsuario.jsp" method="post" style="display:inline;">
                <input type="hidden" name="id_us" value="<%= rs.getInt("id_us") %>">
                <input type="submit" value="Eliminar">
            </form>
        </td>
    </tr>
    <% } %>
</table>

</body>
</html>
