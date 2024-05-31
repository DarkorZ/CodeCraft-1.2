<%@ page import="com.producto.datos.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Subir Imagen</title>
    <script>
        function mostrarImagenSeleccionada(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    document.getElementById('imagenPreview').src = e.target.result;
                    document.getElementById('imagenPreview').style.display = 'block'; // Hace visible la vista previa
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</head>
<body>
    <h1>Subir Imagen</h1>
    <form action="SubirImagen.jsp" method="post">
        <label for="idUsuario">ID Usuario:</label>
        <input type="text" id="idUsuario" name="idUsuario">
        <input type="submit" value="Obtener Nombre">
    </form>
    <% 
        // Declaramos la variable para almacenar el nombre del autor
        String autor_text = null;

        // Obtenemos el ID de usuario enviado por el formulario
        String idUsuario = request.getParameter("idUsuario");

        if (idUsuario != null && !idUsuario.isEmpty()) {
            try {
                // Convertimos el ID a entero
                int id = Integer.parseInt(idUsuario);

                // Creamos un objeto Usuario
                Usuario usuario = new Usuario();

                // Llamamos al método para obtener el nombre del usuario por su ID
                String nombreUsuario = usuario.obtenerNombrePorId(id);

                // Guardamos el nombre del usuario en la variable autor_text
                autor_text = nombreUsuario;

                // Mostramos el nombre del usuario
                out.println("<p>El nombre del usuario con ID " + id + " es: " + nombreUsuario + "</p>");
            } catch (NumberFormatException e) {
                out.println("<p>El ID de usuario debe ser un número válido.</p>");
            }
        }
    %>

    <!-- Mostramos el nombre de la variable autor_text y su valor -->
    <p>autor_text: <%= autor_text %></p>

    <!-- Formulario para insertar datos en la tabla_imagenes -->
    <form action="insertarImagen.jsp" method="post" enctype="multipart/form-data">
        <!-- Campo oculto para enviar el autor_text -->
        <input type="hidden" name="autor_text" value="<%= autor_text %>">
        
        <!-- Campo de entrada para seleccionar la imagen -->
        <label for="imagen">Seleccionar Imagen:</label>
        <input type="file" id="imagen" name="imagen" accept="image/png" maxlength="10485760" onchange="mostrarImagenSeleccionada(this);">
        
        <!-- Vista previa de la imagen seleccionada -->
        <img id="imagenPreview" src="#" alt="Vista previa de la imagen" style="max-width: 200px; max-height: 200px; display: none;">
        
        <!-- Botón para enviar el formulario -->
        <input type="submit" value="Subir Imagen">
    </form>
</body>
</html>
