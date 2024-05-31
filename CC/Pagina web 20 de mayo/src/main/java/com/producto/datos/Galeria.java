package com.producto.datos;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.PreparedStatement;

public class Galeria {
    private String autor_text;
    private byte[] imagen;

    // Método para insertar autor e imagen en la tabla tabla_imagenes
    public String insertarImagen() {
        String result = "";

        Conexion con = new Conexion();
        PreparedStatement pr = null;
        String sql = "INSERT INTO tabla_imagenes (autor_text, imagen) VALUES (?, ?)";
        try {
            pr = con.getConexion().prepareStatement(sql);
            pr.setString(1, this.getAutor_text());
            pr.setBytes(2, this.getImagen());

            if (pr.executeUpdate() == 1) {
                result = "Insercion correcta";
            } else {
                result = "Error en insercion";
            }
        } catch (Exception ex) {
            result = ex.getMessage();
            System.out.print(result);
        } finally {
            try {
                if (pr != null) {
                    pr.close();
                }
                con.getConexion().close();
            } catch (Exception ex) {
                System.out.print(ex.getMessage());
            }
        }
        return result;
    }

    public String getAutor_text() {
        return autor_text;
    }

    public void setAutor_text(String autor_text) {
        this.autor_text = autor_text;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }
}
