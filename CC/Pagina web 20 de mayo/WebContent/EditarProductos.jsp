<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.negocio.*"
    import="com.producto.datos.*"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Venta de Refrescos</title>
    <link rel="stylesheet" type="text/css" href="NewFile.css">
</head>
<body bgcolor="#F7EBEB">
<main>
<header>

  
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
   <h1> Actualización de productos </h1>
   <%
   Integer cod=Integer.parseInt(request.getParameter("editarcod"));
   String nombre = request.getParameter("editarprod");
   Double pre = Double.parseDouble(request.getParameter("editarprec"));
   Integer cant = Integer.parseInt(request.getParameter("editarcant"));
   Producto  producto  = new Producto(cod,nombre,pre,cant);  
   boolean actualizado = producto.ModificarProducto(producto);
   if(actualizado == true){
	  response.sendRedirect("Categoria.jsp");
   } else {
	   out.println("algo salio mal");
   }
   %>
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