<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.producto.datos.Usuario" %>
<%
    int idUs = Integer.parseInt(request.getParameter("id_us"));
    Usuario usuario = new Usuario();

    if (usuario.eliminarUsuario(idUs)) {
        out.println("Usuario eliminado exitosamente.");
    } else {
        out.println("Error al eliminar el usuario.");
    }
%>
