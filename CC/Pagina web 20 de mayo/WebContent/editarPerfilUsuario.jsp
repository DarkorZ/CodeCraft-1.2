<%@page import="java.sql.*"%>
<%@page import="com.producto.datos.Usuario"%>
<%@page import="com.producto.datos.Conexion"%>
<%@page session="true" %>
<%
    String correoUsuario = (String)session.getAttribute("correoUsuario");
    if (correoUsuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Perfil Usuario</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="logo.png" alt="CodeCraft Logo">
        </div>
    </header>
    <main>
        <h1>Editar Perfil</h1>
        
        <form method="post">
            <label for="correo">Correo:</label>
            <input type="email" name="correo" id="correo" value="<%= correoUsuario %>" required readonly>

            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" id="nombre" required>

            <label for="clave">Clave:</label>
            <input type="password" name="clave" id="clave" required>

            <button type="submit">Actualizar Perfil</button>
        </form>

        <form action="index.jsp" method="get">
            <button type="submit">Home</button>
        </form>
    </main>
</body>
</html>

<%
    if(request.getMethod().equals("POST")) {
        String nombre = request.getParameter("nombre");
        String clave = request.getParameter("clave");

        if (nombre != null && clave != null) {
            try {
                Conexion con = new Conexion();
                String updateQuery = "UPDATE tb_usuario SET nombre_us = ?, clave_us = ? WHERE correo_us = ?";
                PreparedStatement pstmt = con.getConexion().prepareStatement(updateQuery);
                pstmt.setString(1, nombre);
                pstmt.setString(2, clave);
                pstmt.setString(3, correoUsuario);
                int rowsAffected = pstmt.executeUpdate();
                pstmt.close();
                con.getConexion().close();

                if (rowsAffected > 0) {
                    out.println("<p>Perfil actualizado correctamente.</p>");
                } else {
                    out.println("<p>Error al actualizar el perfil.</p>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
