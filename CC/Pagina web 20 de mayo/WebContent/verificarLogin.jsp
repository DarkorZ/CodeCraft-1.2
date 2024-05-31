<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.ResultSet, com.producto.datos.Usuario" %>
<%@ page import="java.io.*, java.util.*" %>

<%
    // Obtener los parámetros del formulario de inicio de sesión
    String correo = request.getParameter("correo");
    String clave = request.getParameter("clave");

    // Verificar las credenciales del usuario
    Usuario usuario = new Usuario();
    boolean loginExitoso = usuario.verificarUsuario(correo, clave);

    if (loginExitoso) {
        // Inicio de sesión exitoso, establecer la sesión del usuario
        session.setAttribute("correoUsuario", correo);
        session.setAttribute("id_perfil", usuario.getId_perfil());

        // Redirigir a la página de inicio o página de perfil del usuario
        response.sendRedirect("index.jsp"); // Cambiar "index.jsp" al nombre de tu página de inicio
    } else {
        // Las credenciales son incorrectas, mostrar un mensaje de error
        out.println("<h2>Error: Credenciales incorrectas. Inténtalo de nuevo.</h2>");
    }
%>
