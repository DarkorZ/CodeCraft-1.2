<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CodeCraft</title>
    <link rel="stylesheet" href="styles.css">
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
                <% 
                    Integer idPerfil = (Integer)session.getAttribute("id_perfil");
                    if (idPerfil != null && idPerfil == 1) { 
                %>
                    <!-- Mostrar el botón solo para administradores -->
                    <li><a href="mostrarUsuarios.jsp">Ver Participantes</a></li>
                    <li><a href="RegistroAdmin.jsp">Registrar Administrativo</a></li>
                <% 
                    } 
                %>
            </ul>
        </nav>
        
        <div class="auth">
            <% 
                String correoUsuario = (String)session.getAttribute("correoUsuario");
                if (correoUsuario != null) {
                    if (idPerfil != null && idPerfil == 1) {
            %>
                        <!-- Mostrar el mensaje de administrador -->
                        <a href="#">Bienvenido Administrador, <%= correoUsuario %></a>
                        <!-- Hipervínculo para editar perfil admin -->
                        <a href="editarPerfilAdmin.jsp">Editar perfil Admin</a>
            <% 
                    } else {
            %>
                        <!-- Mostrar el correo del usuario autenticado -->
                        <a href="#">Bienvenido, <%= correoUsuario %></a>
                        <!-- Hipervínculo para editar perfil usuario -->
                        <a href="editarPerfilUsuario.jsp">Editar Perfil Usuario</a>
            <% 
                    } 
            %>
                <form action="verificarLogout.jsp" method="post">
                    <button type="submit">Cerrar Sesión</button>
                </form>
            <% 
                } else { 
            %>
                <!-- Si no hay un usuario autenticado, mostrar el enlace para iniciar sesión y unirse -->
                <a href="login.jsp">Ingresar</a>
                <a href="RegistroC.jsp">Únete a CodeCraft</a>
            <% 
                } 
            %>
        </div>
    </header>
    <main>
        <section class="hero">
            <h1>Crea historias, juegos y animaciones</h1>
            <h2>Comparte con otros alrededor del mundo</h2>
            <div class="buttons">
                <button onclick="location.href='curso.jsp'">Empieza a Crear</button>
                <button onclick="location.href='RegistroC.jsp'">Únete</button>
            </div>
        </section>
        <section class="carousel">
            <div class="carousel-container">
                <div class="carousel-slide">
                    <img src="https://i.ytimg.com/vi/fkNYtc5bleI/maxresdefault.jpg" alt="Imagen 1" style="width: 500px; height: auto;">
                </div>
                <div class="carousel-slide">
                    <img src="https://i.blogs.es/940b75/combate-pokemon/450_1000.jpg" alt="Imagen 2" style="width: 500px; height: auto;">
                </div>
                <div class="carousel-slide">
                    <img src="https://i.ytimg.com/vi/jbE1uSXzXzg/hqdefault.jpg" alt="Imagen 3" style="width: 500px; height: auto;">
                </div>
            </div>
        </section>
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
