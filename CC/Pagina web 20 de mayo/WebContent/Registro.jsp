<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
import="com.productos.negocio.*, com.producto.datos.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro</title>
</head>
<body>
<h1>
Registro exitoso
</h1>

<%
   
   String nombre = request.getParameter("name");
   Double pre = Double.parseDouble(request.getParameter("price"));
   Integer cant = Integer.parseInt(request.getParameter("quantity"));
   Integer cat=Integer.parseInt(request.getParameter("category"));
   String directorio= request.getParameter("product_image");


   
   Producto  producto  = new Producto(); 
 out.println(producto.ingresarProducto(cat, nombre, cant, pre, directorio));
   
  
   %>

</body>
</html>