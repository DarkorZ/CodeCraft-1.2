<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.negocio.*"
    import="com.producto.datos.*"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Tienda de Labiales - Quito</title>
    <link rel="stylesheet" type="text/css" href="NewFile.css">
</head>
<body bgcolor="#F7EBEB">
<main>
<header>
    <h1>Labiales Coreanos</h1>
    <h2 class= "destacado"> Venta de Balsamos Coreanos</h2>
    </header>
    <div class="navbar">
  <a href="index.jsp">Inicio </a>
  <a href="consulta.jsp">Ver Producto</a>
  <a href="login.jsp">Iniciar Sesión</a>
  <a href="Categoria.jsp">Buscar por categoría</a>
  <a href="nuevoProducto.jsp">Ingresar un nuevo labial</a>
  </div>
   <div class="content">	
   <section>
   <article>
   <h1> Catálogo de Productos </h1>
   <% Producto  producto  = new Producto();%>
   <%= producto.consultarTodo() %>
  
   </article>
   
   </section>
 <aside>
 	<a href="https://ec.linkedin.com/">Ver más información sobre los desarrolladores
	</a>
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
