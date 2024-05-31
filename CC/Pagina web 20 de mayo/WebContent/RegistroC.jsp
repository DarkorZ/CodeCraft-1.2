<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<p>
<a href="http://jigsaw.w3.org/css-validator/check/referer">
    <img style="border:0;width:88px;height:31px"
        src="http://jigsaw.w3.org/css-validator/images/vcss-blue"
        alt="¡CSS Válido!" />
    </a>
</p>
<header>
    <h1>Registro CodeCraft</h1>
    <h2 class="destacado">Aprende creando</h2>
    <nav>
        <ul>
            <li><a href="index.jsp">Inicio</a></li>
            <li><a href="login.jsp">Iniciar Sesión</a></li>
        </ul>
    </nav>
</header>
<main>
    <div class="content">
        <section>
            <article>
                <form action="procesarRegistro.jsp" method="post">
                    <input type="hidden" name="id_per" value="2"> 
                    <table>
                        <tr><td>Nombre:</td><td> <input type="text" name="txtNombre" required /></td></tr>
                        <tr><td>Cédula:</td><td> <input type="text" name="txtCedula" required /></td></tr>
                        <tr><td>Correo:</td><td> <input type="email" name="txtCorreo" required /></td></tr>
                        <tr><td>Clave:</td><td> <input type="password" name="txtClave" required /></td></tr>
                    </table>
                    <input type="submit" value="Registrar">
                </form>
            </article>
        </section>
        <aside>
            <a href="https://ec.linkedin.com/">Ver más información sobre los desarrolladores</a>
        </aside>
    </div>
</main>
<footer>
    <ul>
        <li>Facebook</li>
        <li>Instagram</li>
        <li>Twitter</li>
    </ul>
</footer>
</body>
</html>
