<%@ page import="java.io.*, java.sql.*, javax.servlet.http.*, javax.servlet.*, com.producto.datos.Galeria" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Obtener el autor_text enviado desde el formulario anterior
    String autor_text = request.getParameter("autor_text");

    // Verificar si se ha enviado un archivo de imagen
    Part filePart = request.getPart("imagen");
    
    // Comprobar si se ha enviado algún archivo
    if (filePart != null && filePart.getSize() > 0) {
        InputStream inputStream = filePart.getInputStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        byte[] imagenBytes = outputStream.toByteArray();

        // Crear un objeto Galeria y establecer el autor_text y la imagen
        Galeria galeria = new Galeria();
        galeria.setAutor_text(autor_text);
        galeria.setImagen(imagenBytes);

        // Insertar el autor e imagen en la base de datos
        String resultadoInsercion = galeria.insertarImagen();

        // Verificar el resultado de la inserción
        if (resultadoInsercion.equals("Insercion correcta")) {
            out.println("<p>La imagen se ha subido correctamente.</p>");
        } else {
            out.println("<p>Error al subir la imagen: " + resultadoInsercion + "</p>");
        }
    } else {
        out.println("<p>No se ha seleccionado ninguna imagen.</p>");
    }
%>
