<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.io.*, java.util.*" %>
<%
    // Invalidar la sesión actual del usuario
    HttpSession sessionToInvalidate = request.getSession(false); // No crear una nueva sesión si no existe
    if (sessionToInvalidate != null) {
        sessionToInvalidate.invalidate(); // Invalidar la sesión existente
    }

    // Redireccionar al usuario a la página de inicio
    response.sendRedirect("index.jsp");
%>
