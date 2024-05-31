<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.negocio.*"
    import="com.producto.datos.*"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Labiales Coreanos - Quito</title>
    <link rel="stylesheet" type="text/css" href="NewFile.css">
</head>
<body bgcolor="#F7EBEB">
<main>
<header>
    <h1>Tonos disponibles</h1>
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
   <form action="EditarProductos.jsp" method="post">
   <article>
    <h1> Modificar Productos </h1>
     <% Producto  producto  = new Producto();
   int cod = Integer.parseInt(request.getParameter("cod"));   %>
   <%=producto.ConsulEditarProductos(cod) %>
    <table>
     <tr><td>Codigo Producto:</td><td><input type= "text" name="editarcod" value="<%=cod%>"/></td></tr>
	<tr><td>Categoria</td><td><output><%=producto.getId_cat()%></output></td></tr>
	<tr><td>Producto</td><td><input type = "text" name="editarprod" value="<%=producto.getNombre_pr() %>"/></td></tr>
	<tr><td>Cantidad</td><td><input type= "text" name="editarcant" value="<%=producto.getCantidad_pr()%>"/></td></tr>
	<tr><td>Precio</td><td><input type= "text" name="editarprec" value="<%=producto.getPrecio_pr()%>"/></td></tr>
	</table>
	<input type="submit" name="Actualizar"/>
   </article>
   </form>

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