<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.producto.datos.Usuario" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<p>
<a href="http://jigsaw.w3.org/css-validator/check/referer">
    <img style="border:0;width:88px;height:31px"
        src="http://jigsaw.w3.org/css-validator/images/vcss-blue"
        alt="¡CSS Válido!" />
    </a>
</p>
<body>
<header>
    <div class="logo">
        <img src="logo.png" alt="CodeCraft Logo">
    </div>
    <nav>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="curso.jsp">Curso</a></li>
            <li><a href="Galeria.jsp">Galeria</a></li>
        </ul>
    </nav>
    <div class="auth">
        <a href="RegistroC.jsp">Únete a CodeCraft</a>
    </div>
</header>
<main>
    <h2>Iniciar Sesión</h2>
    <form action="verificarLogin.jsp" method="post">
        <label for="correo">Correo Electrónico:</label><br>
        <input type="email" id="correo" name="correo" required><br>
        <label for="clave">Contraseña:</label><br>
        <input type="password" id="clave" name="clave" required><br><br>
        <button type="submit">Iniciar Sesión</button>
    </form>

    <hr>

    <h2>Mostrar Todos los Usuarios</h2>
    <form action="mostrarUsuarios.jsp" method="post">
        <button type="submit">Mostrar Usuarios</button>
    </form>
</main>
<footer>
    <div class="social-media">
        <a href="https://www.facebook.com" target="_blank">
            <img src="facebook.png" alt="Facebook">
        </a>
        <a href="https://www.twitter.com" target="_blank">
            <img src="twitter.png" alt="Twitter">
        </a>
        <a href="https://www.instagram.com" target="_blank">
            <img src="instagram.png" alt="Instagram">
        </a>
        <a href="https://www.linkedin.com" target="_blank">
            <img src="linkedin.png" alt="LinkedIn">
        </a>
    </div>
</footer>
</body>
</html>
