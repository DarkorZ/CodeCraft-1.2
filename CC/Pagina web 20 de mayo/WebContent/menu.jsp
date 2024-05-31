
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" session="true" import="com.producto.datos.*,com.productos.seguridad.*"%>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Venta de Refrescos</title>
    <link rel="stylesheet" type="text/css" href="NewFile.css">
</head>
<body bgcolor="#F7EBEB">
<main>
<header>
    <h1>Venta de Refrescos</h1>
    <h2 class= "destacado">Bebidas refrescantes</h2>
</header>
<div class="navbar">
  <a href="index.jsp">Inicio </a>
  <a href="consulta.jsp">Ver Producto</a>
  <a href="login.jsp">Iniciar Sesión</a>
  <a href="Categoria.jsp">Buscar por categoría</a>
</div>
<div class="content">
<section>
<article>
<%
    String usuario;
    HttpSession sesion = request.getSession();
    
    if (sesion.getAttribute("usuario") == null) { // Se verifica si existe la variable
%>
    <jsp:forward page="login.jsp">
        <jsp:param name="error" value="Debe registrarse en el sistema."/>
    </jsp:forward>
<%
    } else {
        usuario=(String)sesion.getAttribute("usuario"); // Se devuelve los valores de atributos
        int perfil=(Integer)sesion.getAttribute("perfil");
%>
    <h1>Sitio Privado de Productos</h1>
    <h4>Bienvenido <%= usuario %></h4>
<%
        Pagina pag=new Pagina();
        String menu=pag.mostrarMenu(perfil);
        out.print(menu);
    }
%>

</article>
</section>
<aside>
    <a href="https://ec.linkedin.com/">Ver más información sobre los desarrolladores</a>
</aside>
</div>
<footer>
    <ul>
        <li>Facebook</li>
        <li>Instagram</li>
        <li>Twitter</li>
    </ul>
</footer>
</main>
</body>
</html>
