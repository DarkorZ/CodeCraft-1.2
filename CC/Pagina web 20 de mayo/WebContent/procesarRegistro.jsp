procesarRegistro.jsp
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" session="true" import="com.producto.datos.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Procesar Registro</title>
</head>
<body>
<%
    // Obtener los datos del formulario
    String nombre = request.getParameter("txtNombre");
    String cedula = request.getParameter("txtCedula");
    String correo = request.getParameter("txtCorreo");
    String clave = request.getParameter("txtClave");
    

    // Crear un nuevo objeto Usuario y establecer sus propiedades
Usuario usuario = new Usuario();
    usuario.setNombre(nombre);
    usuario.setCedula(cedula);
    usuario.setCorreo(correo);
    usuario.setClave(clave);
    usuario.setEstado(1);
    usuario.setId_perfil(2);  // Estado activo por defecto, ajustar según tu lógica

    // Insertar el nuevo usuario en la base de datos
    String resultado = usuario.ingresarCliente();

    if (resultado.equals("Insercion correcta")) {
%>
    <h2>Registro exitoso</h2>
    <p>El usuario ha sido registrado correctamente.</p>
    <a href="login.jsp">Iniciar Sesión</a>
<%
    } else {
%>
    <h2>Error en el registro</h2>
    <p>Hubo un error al registrar el usuario: <%= resultado %></p>
    <a href="registro.jsp">Intentar de nuevo</a>
<%
    }
%>
</body>
</html>
