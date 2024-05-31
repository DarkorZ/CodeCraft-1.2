<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CodeCraft - Curso</title>
    <link rel="stylesheet" href="cursoStyle.css">
</head>
<body>

    <header>
        <div class="logo">
             <p>
                <a href="http://jigsaw.w3.org/css-validator/check/referer">
                    <img style="border:0;width:88px;height:31px"
                        src="http://jigsaw.w3.org/css-validator/images/vcss"
                        alt="¡CSS Válido!" />
                </a>
            </p>
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="curso.jsp">Curso</a></li>
                <li><a href="Galeria.jsp">Galeria</a></li>
            </ul>
        </nav>
        
        <div class="auth">
            <% String correoUsuario = (String)session.getAttribute("correoUsuario"); %>
            <% if (correoUsuario != null) { %>
                <!-- Mostrar información de sesión -->
                <a href="#">Bienvenido, <%= correoUsuario %></a>
                <form action="verificarLogout.jsp" method="post">
                    <button type="submit">Cerrar Sesión</button>
                </form>
            <% } else { %>
                <!-- Mostrar enlaces de inicio de sesión -->
                <a href="login.jsp">Ingresar</a>
                <a href="RegistroC.jsp">Únete a CodeCrafth</a>
            <% } %>
        </div>
    </header>
    <main>
        <section class="hero">
            <h1>Bienvenido al curso de programación básica acerca de condicionales</h1>
            <div class="container">
                <div class="map">
                    <% if (correoUsuario != null) { %>
                        <!-- Verificar si el usuario ha iniciado sesión antes de mostrar los enlaces -->
                        <a href="nivel1.jsp" class="button">
                            <img src="https://e7.pngegg.com/pngimages/764/602/png-clipart-new-super-mario-bros-super-mario-bros-2-super-mario-world-mario-heroes-text-thumbnail.png" alt="Nivel 1">
                            <span>Nivel 1</span>
                        </a>
                        <a href="nivel2.jsp" class="button">
                            <img src="https://e7.pngegg.com/pngimages/764/602/png-clipart-new-super-mario-bros-super-mario-bros-2-super-mario-world-mario-heroes-text-thumbnail.png" alt="Nivel 2">
                            <span>Nivel 2</span>
                        </a>
                        <a href="nivel3.jsp" class="button">
                            <img src="https://e7.pngegg.com/pngimages/764/602/png-clipart-new-super-mario-bros-super-mario-bros-2-super-mario-world-mario-heroes-text-thumbnail.png" alt="Nivel 3">
                            <span>Nivel 3</span>
                        </a>
                    <% } else { %>
                        <!-- Si el usuario no ha iniciado sesión, deshabilitar los enlaces -->
                        <a href="RegistroC.jsp" class="button">
                            <img src="https://e7.pngegg.com/pngimages/764/602/png-clipart-new-super-mario-bros-super-mario-bros-2-super-mario-world-mario-heroes-text-thumbnail.png" alt="Nivel 1">
                            <span>Nivel 1</span>
                        </a>
                        <a href="RegistroC.jsp" class="button">
                            <img src="https://e7.pngegg.com/pngimages/764/602/png-clipart-new-super-mario-bros-super-mario-bros-2-super-mario-world-mario-heroes-text-thumbnail.png" alt="Nivel 2">
                            <span>Nivel 2</span>
                        </a>
                        <a href="RegistroC.jsp" class="button">
                            <img src="https://e7.pngegg.com/pngimages/764/602/png-clipart-new-super-mario-bros-super-mario-bros-2-super-mario-world-mario-heroes-text-thumbnail.png" alt="Nivel 3">
                            <span>Nivel 3</span>
                        </a>
                    <% } %>
                </div>
            </div>
        </section>
    </main>
    <footer>
        <!-- Agrega aquí tu pie de página -->
    </footer>
</body>
</html>
