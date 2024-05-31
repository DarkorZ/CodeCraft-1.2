<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Categoria</title>
    <link rel="stylesheet" type="text/css" href="NewFile.css">
</head>
<body bgcolor="#F7EBEB">
<main>
<header>
    <h1>Tonos disponibles</h1>
    <h2 class= "destacado"> Inserccion de tonos</h2>
    </header>
    <div class="navbar">
  <a href="index.jsp">Inicio </a>
  <a href="consulta.jsp">Ver Producto</a>
  <a href="login.jsp">Iniciar Sesión</a>
  <a href="Categorías">Buscar por categoría</a>
  </div>
   <div class="content">
   <section>
   <article>
   <h1> Buscar por categoría </h1>
<form action="ReporteCategoria.jsp" method="post" >
<table>
 <tr><td>Escoja la categoria </td><td><select name="cmbCategoria">
                    <option value="1">Tono #01</option>
                    <option value="2">Tono #02</option>
                </select></td></tr>
</table>
 <input type="submit" value="Enviar respuestas">
</form>
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
