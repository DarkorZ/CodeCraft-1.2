<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro de Administrador</title>
    <link rel="stylesheet" type="text/css" href="estilos.css">
</head>
<body>
<main>
<header>
    <h1>Registro de Administrador</h1>
</header>
<div class="content">
<section>
<article>
<form action="ProcesarRegistroAdmin.jsp" method="post">
    <table>
        <tr><td>Nombre:</td><td> <input type="text" name="txtNombre" required /></td></tr>
        <tr><td>Cédula:</td><td> <input type="text" name="txtCedula" required /></td></tr>
        <tr><td>Correo:</td><td> <input type="email" name="txtCorreo" required /></td></tr>
        <tr><td>Clave:</td><td> <input type="password" name="txtClave" required /></td></tr>
        <tr>
            <td>Tipo de Usuario:</td>
            <td>
                <select name="tipoUsuario">
                    <option value="1">Administrador</option>
                    <option value="2">Cliente</option>
                </select>
            </td>
        </tr>
    </table>
    <input type="submit" value="Registrar">
</form>
</article>
</section>
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
