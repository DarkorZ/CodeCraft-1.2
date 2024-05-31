<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.negocio.*"
    import="com.producto.datos.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reporte</title>
    <link rel="stylesheet" type="text/css" href="NewFile.css">
</head>
<body bgcolor="#F7EBEB">
<main>
<header>
    <h1>Reporte de inventario</h1>
    <h2 class= "destacado"> Labiales de gelatina coreanos</h2>
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
   <h1> Reporte por categoria </h1>
   <% Producto  producto  = new Producto(); %>
    <%  Integer categoria = Integer.parseInt(request.getParameter("cmbCategoria")); %>
      <%= producto.buscarProductoCategoria(categoria) %>
    
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
