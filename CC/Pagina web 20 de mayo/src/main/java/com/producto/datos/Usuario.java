package com.producto.datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Usuario {
	private String nombre;
	private String cedula;
	private String correo;
	private String clave;
	private int estado;
	private Integer id_perfil;
	public String ingresarCliente()
	 {
	String result="";

	Conexion con=new Conexion();
	PreparedStatement pr=null;
	String sql= "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) "
            + "VALUES (?, ?, ?, ?, ?, ?)";
	 try{
	 pr=con.getConexion().prepareStatement(sql);
	 pr.setInt(1, this.getId_perfil());
	 pr.setInt(2, this.getEstado());
	 pr.setString(3, this.getNombre());
	 pr.setString(4, this.getCedula());
	 pr.setString(5, this.getCorreo());
	 pr.setString(6, this.getClave());

	 if(pr.executeUpdate()==1)
	 {
	 result="Insercion correcta";
	 }
	 else
	 {
	 result="Error en insercion";
	 }
	 }
	catch(Exception ex)
	 {
		 result=ex.getMessage();
		 System.out.print(result);
		 }
		 finally
		 {
		 try
		 {
		 pr.close();
		 con.getConexion().close();
		 }
		 catch(Exception ex)
		 {
		 System.out.print(ex.getMessage());
		 }
		 }
		 return result;
		 }

	public String ingreso() throws SQLException {
		Conexion con=new Conexion();
		String insert = "INSERT INTO tb_usuario (id_us, id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) "
	              + "VALUES (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = null ;
				try {
					pstmt= con.getConexion().prepareStatement(insert);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		pstmt.setInt(1, 2);       // Assuming id_us is an int
		pstmt.setInt(2, 2);      // Assuming id_per is an int
		pstmt.setInt(3, getEstado());      // Assuming id_est is an int
		pstmt.setString(4, getNombre());
		pstmt.setString(5, getCedula());
		pstmt.setString(6, getCorreo());
		pstmt.setString(7, getClave());
		pstmt.executeUpdate();
		return insert;
		
	}
	
	public boolean verificarUsuario(String correo, String nclave) {
	    boolean respuesta = false;
	    String sentencia = "SELECT * FROM tb_usuario WHERE correo_us = ? AND clave_us = ?";
	    try {
	        Conexion clsCon = new Conexion();
	        PreparedStatement pr = clsCon.getConexion().prepareStatement(sentencia);
	        pr.setString(1, correo);
	        pr.setString(2, nclave);
	        ResultSet rs = pr.executeQuery();
	        if (rs.next()) {
	            respuesta = true;
	            this.setCorreo(correo);
	            this.setClave(nclave);
	            this.setId_perfil(rs.getInt("id_per"));
	            this.setNombre(rs.getString("nombre_us"));
	        } else {
	            respuesta = false;
	        }
	        rs.close();
	        pr.close();
	        clsCon.getConexion().close();
	    } catch (Exception ex) {
	        System.out.println(ex.getMessage());
	    }
	    return respuesta;
	}
	public boolean eliminarUsuario(int idUs) {
	    boolean eliminado = false;
	    Conexion con = new Conexion();
	    PreparedStatement pr = null;
	    String sql = "DELETE FROM tb_usuario WHERE id_us = ?";
	    try {
	        pr = con.getConexion().prepareStatement(sql);
	        pr.setInt(1, idUs);
	        int rows = pr.executeUpdate();

	        if (rows > 0) {
	            eliminado = true;
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        try {
	            if (pr != null) {
	                pr.close();
	            }
	            con.getConexion().close();
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
	    return eliminado;
	}

	
	public ResultSet obtenerTodosLosUsuarios() {
	    ResultSet rs = null;
	    String sentencia = "SELECT * FROM tb_usuario";
	    try {
	        Conexion clsCon = new Conexion();
	        rs = clsCon.Consulta(sentencia);
	    } catch (Exception ex) {
	        System.out.println(ex.getMessage());
	    }
	    return rs;
	}
	 public List<Usuario> listarUsuarios() {
	        List<Usuario> usuarios = new ArrayList<>();
	        String sentencia = "SELECT * FROM tb_usuario";
	        try {
	            Conexion clsCon = new Conexion();
	            ResultSet rs = clsCon.Consulta(sentencia);
	            while (rs.next()) {
	                Usuario usuario = new Usuario();
	                usuario.setId_perfil(rs.getInt("id_per"));
	                usuario.setNombre(rs.getString("nombre_us"));
	                usuario.setCedula(rs.getString("cedula_us"));
	                usuario.setCorreo(rs.getString("correo_us"));
	                usuario.setClave(rs.getString("clave_us"));
	                usuario.setEstado(rs.getInt("id_est"));
	                usuarios.add(usuario);
	            }
	            rs.close();
	            clsCon.getConexion().close();
	        } catch (Exception ex) {
	            System.out.println(ex.getMessage());
	        }
	        return usuarios;
	    }
	 
	 public String obtenerNombrePorId(int id) {
	        String nombreUsuario = null;
	        String sentencia = "SELECT nombre_us FROM tb_usuario WHERE id_us = ?";
	        try {
	            Conexion clsCon = new Conexion();
	            PreparedStatement pr = clsCon.getConexion().prepareStatement(sentencia);
	            pr.setInt(1, id);
	            ResultSet rs = pr.executeQuery();
	            if (rs.next()) {
	                nombreUsuario = rs.getString("nombre_us");
	            }
	            rs.close();
	            pr.close();
	            clsCon.getConexion().close();
	        } catch (Exception ex) {
	            System.out.println(ex.getMessage());
	        }
	        return nombreUsuario;
	    }
	@Override
	public String toString() {
		return "Usuario [getCedula()=" + getCedula() + ", getClave()=" + getClave() + ", getCorreo()=" + getCorreo()
				+ ", getEstado()=" + getEstado() + ", getNombre()=" + getNombre() + "]";
	}


	public String getCedula() {
		return cedula;
			}

	public String getClave() {
		return clave;
	}

	public String getCorreo() {
		return correo;
	}

	public int getEstado() {
		return estado;
	}

	public String getNombre() {
		return nombre;
	}

	public Integer getId_perfil() {
		return id_perfil;
	}

	public void setId_perfil(Integer id_perfil) {
		this.id_perfil = id_perfil;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setCedula(String cedula) {
		this.cedula = cedula;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	} 
	 
}
