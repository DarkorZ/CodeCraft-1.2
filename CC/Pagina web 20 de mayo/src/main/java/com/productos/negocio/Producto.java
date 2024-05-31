package com.productos.negocio;

import java.io.File;
import java.io.FileInputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.producto.datos.Conexion;

public class Producto {
	private Integer id_pr;
	private Integer id_cat;
	private String nombre_pr;
	private Integer cantidad_pr;
	private Double precio_pr;
	private byte foto;
	
	public Producto() {
		this.id_pr = 0;
		this.id_cat = 0;
		this.nombre_pr = "";
		this.cantidad_pr = 0;
		this.precio_pr = 0.0;
		this.foto = 0;
	}
	public Producto(Integer producto,String nombre,Double precio,Integer cantidad) {	
		this.id_pr = producto;
		this.nombre_pr = nombre;
		this.precio_pr =precio;
		this.cantidad_pr = cantidad;
	}
	public String consultarTodo()
	{
	String sql="SELECT * FROM tb_producto ORDER BY id_pr";
	Conexion con=new Conexion();
	String tabla="<table border=2><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th>";
	ResultSet rs=null;
	rs=con.Consulta(sql);
	try {
	while(rs.next())
	{
	tabla+="<tr><td>"+rs.getInt(1)+"</td>"
	+ "<td>"+rs.getString(3)+"</td>"
	+ "<td>"+rs.getInt(4)+"</td>"
	+ "<td>"+rs.getDouble(5)+"</td>"
	+ "<td> <a href= BuscarProducto.jsp?cod=" + rs.getInt(1) + "><pre style=\"text-align: center\">Modificar</pre></a></td>"
	+ "<td> <a href= EliminarProducto.jsp?cod=" + rs.getInt(1) + "><pre style=\"text-align: center\">Eliminar</pre></a></td>"
	+ "</tr>";
	}
	} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	System.out.print(e.getMessage());
	}
	tabla+="</table>";
	return tabla;
	}
	
	public String buscarProductoCategoria(int cat) {
		String sentencia="SELECT nombre_pr, precio_pr FROM tb_producto WHERE id_cat="+cat;
		Conexion con=new Conexion();
		ResultSet rs=null;
		String resultado="<table border=3>";
		try
		{
		rs=con.Consulta(sentencia);
		while(rs.next())
		{
		resultado+="<tr><td>"+ rs.getString(1)+"</td>"
		 + "<td>"+rs.getDouble(2)+"</td></tr>";
		}
		resultado+="</table>";
		}
		catch(SQLException e)
		{
		System.out.print(e.getMessage());
		}
		System.out.print(resultado);
		return resultado;
		}
	
	//Consultar editar

	public String ConsulEditarProductos(int cod) {
		String resultado = "";
		Conexion con = new Conexion();
		ResultSet rs= null;
		String sql = "SELECT id_pr,id_cat,nombre_pr"
				+ ",cantidad_pr,precio_pr FROM tb_producto"
				+ " where id_pr ="+"'"+ cod +"'";
		try {
			rs = con.Consulta(sql);
			while (rs.next()) {
				setId_pr((rs.getInt(1)));
				setId_cat(rs.getInt(2));
				setNombre_pr(rs.getString(3));
				setCantidad_pr(rs.getInt(4));
				setPrecio_pr(rs.getDouble(5));
			}
		}catch (SQLException e) {
			System.out.print(e.getMessage());
	}
		System.out.print(resultado);
		return resultado;
	}
	public String ingresarProducto(int cat,String nombre, int cantidad, double precio,
			String directorio)
			{
			String result="";
			Conexion con=new Conexion();
			PreparedStatement pr=null;
			String sql="INSERT INTO tb_producto (id_cat,"
					+ "nombre_pr,cantidad_pr,precio_pr) "
					+ "VALUES(?,?,?,?)";
					try{
					pr=con.getConexion().prepareStatement(sql);
					
					pr.setInt(1,cat);
					pr.setString(2, nombre);
					pr.setInt(3, cantidad);
					pr.setDouble(4, precio);
					//File fichero=new File(directorio);
					//FileInputStream streamEntrada=new FileInputStream(fichero);
					//pr.setBinaryStream(6, streamEntrada,(int)fichero.length());
					if(pr.executeUpdate()==1)
					{
					result="Inserción correcta";
					}
					else
					{
					result="Error en inserción";
					}
					}
					catch(Exception ex)
					{
					result=ex.getMessage();
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

	public boolean ModificarProducto(Producto prod) {
		boolean agregado = false;
		Conexion con = new Conexion();
		String sql = "UPDATE tb_producto SET nombre_pr='"+prod.getNombre_pr()+"', precio_pr = '"+prod.getPrecio_pr()+"',cantidad_pr ='"+prod.getCantidad_pr()+"' "
		+"WHERE id_pr= '"+prod.getId_pr()+"';";
		try {
			con.Ejecutar(sql);
			agregado = true;
		} catch (Exception e) {
			agregado = false;
		}
		return agregado;
	}
	//Eliminar
	public boolean EliminarProducto(int cod) {
		boolean f = false;
		Conexion con = new Conexion();
		String sql= "delete from tb_producto where id_pr= '"+cod+"'";
		try {
			con.Ejecutar(sql);
			f = true;
		} catch (Exception e) {
			f =false;
		}
		return f;
	}

	@Override
	public String toString() {
		return "Producto [getId_pr()=" + getId_pr() + ", getId_cat()=" + getId_cat() + ", getNombre_pr()="
				+ getNombre_pr() + ", getCantidad_pr()=" + getCantidad_pr() + ", getPrecio_pr()=" + getPrecio_pr()
				+ ", getFoto()=" + getFoto() + "]";
	}
	public Integer getId_pr() {
		return id_pr;
	}

	public void setId_pr(Integer id_pr) {
		this.id_pr = id_pr;
	}

	public Integer getId_cat() {
		return id_cat;
	}

	public void setId_cat(Integer id_cat) {
		this.id_cat = id_cat;
	}

	public String getNombre_pr() {
		return nombre_pr;
	}

	public void setNombre_pr(String nombre_pr) {
		this.nombre_pr = nombre_pr;
	}

	public Integer getCantidad_pr() {
		return cantidad_pr;
	}

	public void setCantidad_pr(Integer cantidad_pr) {
		this.cantidad_pr = cantidad_pr;
	}

	public Double getPrecio_pr() {
		return precio_pr;
	}

	public void setPrecio_pr(Double precio_pr) {
		this.precio_pr = precio_pr;
	}

	public byte getFoto() {
		return foto;
	}

	public void setFoto(byte foto) {
		this.foto = foto;
	}
}

