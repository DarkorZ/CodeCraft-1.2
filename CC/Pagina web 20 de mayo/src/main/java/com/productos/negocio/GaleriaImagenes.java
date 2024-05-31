package com.productos.negocio;

import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.producto.datos.Conexion;

public class GaleriaImagenes {

    public List<Imagen> obtenerImagenes() {
        List<Imagen> imagenes = new ArrayList<>();
        Conexion con = new Conexion();
        String sql = "SELECT i.id_imagen, i.autor_text, i.imagen, u.nombre_us FROM tabla_imagenes i " +
                     "INNER JOIN tb_usuario u ON i.id_us = u.id_us";
        ResultSet rs = null;

        try {
            PreparedStatement pstmt = con.getConexion().prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                int idImagen = rs.getInt("id_imagen");
                String autor = rs.getString("nombre_us");
                Blob imagenBlob = rs.getBlob("imagen");
                byte[] imagenBytes = imagenBlob.getBytes(1, (int) imagenBlob.length());

                Imagen imagen = new Imagen(idImagen, autor, imagenBytes);
                imagenes.add(imagen);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                con.getConexion().close(); // Aquí cerramos la conexión
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return imagenes;
    }
    public void guardarImagen(int idUsuario, String nombreArchivo, byte[] imagenBytes) {
        Conexion con = new Conexion();
        String sql = "INSERT INTO tabla_imagenes (id_us, autor_text, imagen) VALUES (?, ?, ?)";

        try {
            PreparedStatement pstmt = con.getConexion().prepareStatement(sql);
            pstmt.setInt(1, idUsuario);
            pstmt.setString(2, nombreArchivo);
            pstmt.setBytes(3, imagenBytes);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                con.getConexion().close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public class Imagen {
        private int idImagen;
        private String autor;
        private byte[] imagenBytes;

        public Imagen(int idImagen, String autor, byte[] imagenBytes) {
            this.idImagen = idImagen;
            this.autor = autor;
            this.imagenBytes = imagenBytes;
        }

        // Métodos getter y setter
        // ...

        public int getIdImagen() {
            return idImagen;
        }

        public void setIdImagen(int idImagen) {
            this.idImagen = idImagen;
        }

        public String getAutor() {
            return autor;
        }

        public void setAutor(String autor) {
            this.autor = autor;
        }

        public byte[] getImagenBytes() {
            return imagenBytes;
        }

        public void setImagenBytes(byte[] imagenBytes) {
            this.imagenBytes = imagenBytes;
        }
    }
}
