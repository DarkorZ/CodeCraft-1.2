<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nivel 1 - IF</title>
    <link rel="stylesheet" href="nivel1styles.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap">
    <script src="script.js" defer></script>
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
            <% 
                String correoUsuario = (String)session.getAttribute("correoUsuario");
                if (correoUsuario != null) { 
            %>
                <a href="#">Bienvenido, <%= correoUsuario %></a>
                <form action="verificarLogout.jsp" method="post">
                    <button type="submit">Cerrar Sesión</button>
                </form>
            <% 
                } else { 
            %>
                <a href="login.jsp">Ingresar</a>
                <a href="RegistroC.jsp">Únete a CodeCrafth</a>
            <% 
                } 
            %>
        </div>
    </header>
    
    <h1>Nivel 1 - IF</h1>
    
    <div class="main-container">
        <div class="container">
            <div class="content">
                <div class="gif-container">
                    <img id="gif" src="https://i.makeagif.com/media/4-06-2015/OGlJZG.gif" alt="GIF">
                </div>
                <div class="gif-enemigo">
                    <img id="gif" src="https://www.pokencyclopedia.info/sprites/gen5/ani_black-white/ani_bw_004.gif" alt="charmander">
                </div>
            </div>
            <div class="pokemon-font-text" id="pokemon-text">
                <p>Texto en Consola.</p>
            </div>
            <button id="executeButton">Ejecutar</button>
           <button id="shareButton" style="display: none;">Compartir logro</button>
           <canvas id="canvas" style="display: none;"></canvas>
        </div>
        
        <div class="seccion-practica">
        <div class="top-section">
            
                <div class="pokemon-icon">
                    IF
                    <img src="https://www.pokencyclopedia.info/sprites/gen5/ani_black-white/ani_bw_004.gif" alt="charmander">
                </div>
                <div class="selection-arrow-wrapper">
                <div class="arrow">></div>
                <div class="pokemon-selection"></div>
                 </div>
                  </div>
                   <div class="bottom-section">
                <div class="closing-bracket" style="flex-direction: column;">
                    entonces:
                    <div>{ Imprimir en consola: "<span id="selection-result"> </span> 
                     <br>
                     <div>Aplastar: boton ejecutar</div> <br>
                     <div>Imprimir en consola: " <br> <span id="pokemon-text-result"></span></div>
                    "}</div>
                </div>
                </div>
            
        </div>
        <div class="teoria">
            <p>Sabemos que en Pokemon el Fuego le gana a la Planta, la Planta le gana al Agua y el Agua le gana al Fuego</p>
            <div class="imagenes-relaciones">
                <div>
                    <img src="https://upload.wikimedia.org/wikipedia/commons/a/a6/Fuego_Pokemon.svg" alt="Fuego"> >
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Planta_Pokemon.svg/1200px-Planta_Pokemon.svg.png" alt="Planta" style="width: 40px; height: 20px;">
                </div>
                <div>
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Planta_Pokemon.svg/1200px-Planta_Pokemon.svg.png" alt="Planta" style="width: 40px; height: 20px;"> >
                    <img src="https://upload.wikimedia.org/wikipedia/commons/3/36/Agua_Pokemon.svg" alt="Agua">
                </div>
                <div>
                    <img src="https://upload.wikimedia.org/wikipedia/commons/3/36/Agua_Pokemon.svg" alt="Agua"> >
                    <img src="https://upload.wikimedia.org/wikipedia/commons/a/a6/Fuego_Pokemon.svg" alt="Fuego">
                </div>
                <p>Ejemplo SI charmander es de tipo fuego
                    <img src="https://upload.wikimedia.org/wikipedia/commons/a/a6/Fuego_Pokemon.svg" alt="Fuego"> ¿qué pasaría SI seleccionas un tipo 
                    <img src="https://upload.wikimedia.org/wikipedia/commons/3/36/Agua_Pokemon.svg" alt="Agua"> o Planta?
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Planta_Pokemon.svg/1200px-Planta_Pokemon.svg.png" style="width: 40px; height: 20px;">
                </p>
            </div>
            <div class="seccion-interactiva">
                <div class="pokemon-opcion" id="squirtle">
                    <img src="https://www.pokencyclopedia.info/sprites/gen4/spr_hgss/spr_hs_007_1.png" alt="Squirtle">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/3/36/Agua_Pokemon.svg" alt="Agua">
                    <span>Squirtle, pokemon de tipo agua</span>
                </div>
                <div class="pokemon-opcion" id="bulbasaur">
                    <img src="https://www.pokencyclopedia.info/sprites/gen4/spr_hgss/spr_hs_001_1.png" alt="Bulbasaur">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Planta_Pokemon.svg/1200px-Planta_Pokemon.svg.png" alt="Planta">
                    <span>Bulbasaur, pokemon de tipo planta</span>
                </div>
            </div>
        </div>
    </div>
   
</body>
</html>
