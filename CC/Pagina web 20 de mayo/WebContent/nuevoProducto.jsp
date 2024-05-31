<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos</title>
   
</head>
<body>
    <form action="Registro.jsp" method="post">
        <label for="code">Código:</label>
        <input type="text" id="code" name="code" value="0" readonly><br>

        <label for="category">Categoría:</label>
        <input type="text" id="category" name="category" value="0"><br>

        <label for="name">Nombre:</label>
        <input type="text" id="name" name="name" value="Labial"><br>

        <label for="quantity">Cantidad:</label>
        <input type="number" id="quantity" name="quantity" value="6"><br>

        <label for="price">Precio:</label>
        <input type="text" id="price" name="price" value="0"><br>
        
        <label for="photo">Foto:</label>
    <input type="file" id="photo" name="photo"><br>
        

        
	
        <button type="submit" onclick="submitFormAndRedirect()">Enviar consulta</button>
        <button type="reset">Restablecer</button>
    </form>
</body>
</html>