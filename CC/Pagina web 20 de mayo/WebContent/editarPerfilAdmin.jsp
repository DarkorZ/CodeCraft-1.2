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
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Perfil Admin</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="logo.png" alt="CodeCraft Logo">
        </div>
    </header>
    <main>
        <h1>Editar Perfil Admin</h1>
        
        <form method="post">
            <label for="correo">Correo del Usuario:</label>
            <input type="email" name="correo" id="correo" required>
            <button type="submit">Buscar Usuario</button>
        </form>
        
        <%
            String correo = request.getParameter("correo");
            Usuario usuario = new Usuario();
            boolean userFound = false;

            if (correo != null && !correo.isEmpty()) {
                String query = "SELECT * FROM tb_usuario WHERE correo_us = ?";
                try {
                    Conexion con = new Conexion();
                    PreparedStatement pr = con.getConexion().prepareStatement(query);
                    pr.setString(1, correo);
                    ResultSet rs = pr.executeQuery();
                    
                    if (rs.next()) {
                        usuario.setNombre(rs.getString("nombre_us"));
                        usuario.setCedula(rs.getString("cedula_us"));
                        usuario.setCorreo(rs.getString("correo_us"));
                        usuario.setClave(rs.getString("clave_us"));
                        usuario.setEstado(rs.getInt("id_est"));
                        usuario.setId_perfil(rs.getInt("id_per"));
                        userFound = true;
                    }
                    
                    rs.close();
                    pr.close();
                    con.getConexion().close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>

        <% if (userFound) { %>
            <form method="post" action="actualizarUsuario.jsp">
                <label for="nombre">Nombre:</label>
                <input type="text" name="nombre" id="nombre" value="<%= usuario.getNombre() %>" required>

                <label for="cedula">Cédula:</label>
                <input type="text" name="cedula" id="cedula" value="<%= usuario.getCedula() %>" required>

                <label for="correo">Correo:</label>
                <input type="email" name="correo" id="correo" value="<%= usuario.getCorreo() %>" required readonly>

                <label for="clave">Clave:</label>
                <input type="password" name="clave" id="clave" value="<%= usuario.getClave() %>" required>

                <label for="estado">Estado:</label>
                <input type="number" name="estado" id="estado" value="<%= usuario.getEstado() %>" required>

                <label for="id_perfil">ID Perfil:</label>
                <input type="number" name="id_perfil" id="id_perfil" value="<%= usuario.getId_perfil() %>" required>

                <button type="submit">Actualizar Usuario</button>
            </form>
        <% } else if (correo != null) { %>
            <p>Usuario no encontrado.</p>
        <% } %>

        <a href="index.jsp">Volver a Home</a>
    </main>
</body>
</html>
