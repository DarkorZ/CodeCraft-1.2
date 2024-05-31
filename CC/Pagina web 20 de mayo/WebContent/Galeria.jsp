<!DOCTYPE html>
<html>
<head>
    <title>Galería de Avances</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .comment-box {
            background-color: #fff;
            color: #000;
            padding: 10px;
            margin: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            max-width: 150px;
            word-wrap: break-word;
        }
        .comment-author {
            font-size: 0.8em;
            color: #555;
            margin-top: 5px;
        }
        .comments-section button {
            background-color: #ffcc00;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
        }
        #gallery {
            background-color: #f5f5f5;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        #image-container {
            flex: 1;
            text-align: center;
        }
        .comment-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .carousel-container {
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
            max-width: 100%;
            margin: 20px 0;
        }
        .carousel-slide {
            min-width: 100%;
            transition: transform 0.5s ease-in-out;
        }
        .carousel-slide img {
            width: 100%;
            cursor: pointer;
        }
        .carousel-buttons {
            position: absolute;
            top: 50%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            transform: translateY(-50%);
        }
        .carousel-button {
            background-color: rgba(255, 255, 255, 0.5);
            border: none;
            padding: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<header>
    <div class="logo">
       <p>
<a href="http://jigsaw.w3.org/css-validator/check/referer">
    <img style="border:0;width:88px;height:31px"
        src="http://jigsaw.w3.org/css-validator/images/vcss-blue"
        alt="¡CSS Válido!" />
    </a>
</p>
    </div>
    <nav>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="curso.jsp">Curso</a></li>
            <li><a href="galeria.jsp">Galería</a></li>
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
        <a href="RegistroC.jsp">Únete a CodeCraft</a>
        
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
            <!-- Si no hay un usuario autenticado, mostrar el enlace para iniciar sesión -->
            <a href="login.jsp">Ingresar</a>
        <% 
            } 
        %>
    </div>
</header>

<main>
    <div class="hero">
        <h1>Galería de Avances</h1>
    </div>

    

    <div id="gallery">
        <div class="comment-list" id="left-comments"></div>
        <div id="image-container">
            <img id="selected-image" src="/Practica06/res/c.png" alt="Imagen seleccionada" style="max-width: 100%;">
        </div>
        <div class="comment-list" id="right-comments"></div>
    </div>

    <div class="comments-section" style="margin-top: 40px; text-align: center;">
        <h2>Comentarios:</h2>
        <textarea id="comment-input" rows="4" cols="50" placeholder="Escribe tus comentarios aquí..." style="width: 80%; padding: 10px; border-radius: 5px; border: 1px solid #ccc;"></textarea>
        <br>
        <button onclick="addComment()">Agregar Comentario</button>
    </div>
</main>

<footer>
    <div class="social-media">
        <a href="#"><img src="path/to/facebook-icon.png" alt="Facebook"></a>
        <a href="#"><img src="path/to/twitter-icon.png" alt="Twitter"></a>
        <a href="#"><img src="path/to/instagram-icon.png" alt="Instagram"></a>
    </div>
</footer>

<script>
    let commentSide = 'left';
    let currentSlide = 0;
    const slides = document.querySelectorAll('.carousel-slide');

    function selectImage(imgElement) {
        const selectedImage = document.getElementById('selected-image');
        selectedImage.src = imgElement.src;
    }

    function prevSlide() {
        currentSlide = (currentSlide > 0) ? currentSlide - 1 : slides.length - 1;
        updateCarousel();
    }

    function nextSlide() {
        currentSlide = (currentSlide < slides.length - 1) ? currentSlide + 1 : 0;
        updateCarousel();
    }

    function updateCarousel() {
        const offset = -currentSlide * 100;
        slides.forEach(slide => {
            slide.style.transform = `translateX(${offset}%)`;
        });
    }

    function addComment() {
        var commentInput = document.getElementById('comment-input');
        var commentText = commentInput.value;

        if (commentText.trim() !== "") {
            var commentBox = document.createElement('div');
            commentBox.className = 'comment-box';
            
            <% 
                String usuarioComentario = (String)session.getAttribute("correoUsuario");
                if (usuarioComentario == null) {
                    usuarioComentario = "invitado";
                }
            %>
            
            commentBox.innerHTML = "<p>" + commentText + "</p><div class='comment-author'><%= usuarioComentario %></div>";

            var commentList = document.getElementById(commentSide + '-comments');
            commentList.appendChild(commentBox);

            // Alternate between left and right comments
            commentSide = commentSide === 'left' ? 'right' : 'left';

            // Clear the textarea
            commentInput.value = '';
        }
    }
</script>

</body>
</html>
