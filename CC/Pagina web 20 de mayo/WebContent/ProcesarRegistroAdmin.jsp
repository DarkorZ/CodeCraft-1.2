<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.producto.datos.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Procesar Registro de Administrador</title>
</head>
<body>
<%
    // Obtener los datos del formulario
    String nombre = request.getParameter("txtNombre");
    String cedula = request.getParameter("txtCedula");
    String correo = request.getParameter("txtCorreo");
    String clave = request.getParameter("txtClave");
    String tipoUsuario = request.getParameter("tipoUsuario");

    // Imprimir el valor del tipo de usuario para verificar
    System.out.println("Valor de tipoUsuario: " + tipoUsuario);

    // Convertir el tipo de usuario a entero
    int id_per = 2; // Por defecto, se asume que es un cliente
    if (tipoUsuario.equals("1")) {
        // Si es administrador, establecer id_per como 1
        id_per = 1;
    }

    // Crear un nuevo objeto Usuario y establecer sus propiedades
    Usuario admin = new Usuario();
    admin.setNombre(nombre);
    admin.setCedula(cedula);
    admin.setCorreo(correo);
    admin.setClave(clave);
    admin.setEstado(1); // Estado activo por defecto, ajustar según tu lógica
    admin.setId_perfil(id_per); // Establecer el id_per según la selección del usuario

    // Insertar el nuevo administrador en la base de datos
    String resultado = admin.ingresarCliente(); // Puedes cambiar a "ingreso()" si prefieres

    if (resultado.equals("Insercion correcta")) {
%>
    <h2>Registro exitoso</h2>
    <p>El administrador ha sido registrado correctamente.</p>
    <a href="login.jsp">Iniciar Sesión</a>
<%
    } else {
%>
    <h2>Error en el registro</h2>
    <p>Hubo un error al registrar el administrador: <%= resultado %></p>
    <a href="RegistroAdmin.jsp">Intentar de nuevo</a>
<%
    }
%>
</body>
</html>
