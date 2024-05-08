package model.db; // Asegúrate de tener este paquete creado en tu proyecto

import model.JavaBeans.ProductoJB;

import java.sql.*;
import java.util.ArrayList;

/**
 * Programa de demostración PostgreSQL
 * Este programa es solo una demostración de cómo utilizar PostgreSQL
 * a través del conector JDBC.
 * Adaptado de http://www.javacoding.net
 */
public class TestPostgreSQL {

    private java.sql.Connection con;

    public void test() throws Exception {
        /* Primero, comprobar si el driver de PostgreSQL está instalado */
        testDriver();

        String gestor = "postgresql";
        String servidor = "localhost";
        String puerto = "5432";
        String baseDatos = "minitienda";
        String url = "jdbc:postgresql://localhost:5432/minitienda";

        String usuario = "postgres";
        String clave = "password";

        /* Segundo, obtener conexión a la base de datos */
        con = obtenerConexion(url, baseDatos, usuario, clave);

        /* Por último cerramos la conexión con la base de datos */
        con.close();
    }

    /**
     * Comprueba si el driver de conexión JDBC de PostgreSQL está instalado
     */
    protected void testDriver() throws Exception {
        try {
            Class.forName("org.postgresql.Driver");
            System.out.println("Encontrado el driver de PostgreSQL");
        } catch (ClassNotFoundException e) {
            System.out.println("PostgreSQL JDBC Driver no encontrado ... ");
            throw e;
        }
    }

    /**
     * Devuelve conexión a PostgreSQL
     */
    protected Connection obtenerConexion(String url, String database, String user, String password) throws Exception {
        try {
            Connection con = DriverManager.getConnection(url, user, password);
            System.out.println("Conexion establecida con " + url + "...");
            return con;
        } catch (SQLException e) {
            System.out.println("Conexion NO establecida con " + url);
            throw e;
        }
    }

    /**
     * Este método ejecuta una sentencia de actualización sobre la base de datos
     *
     * @param sqlStatement SQL DDL or DML statement to execute
     */
    protected void ejecutarOperacion(String sqlStatement)
            throws Exception {
        try {
            Statement s = con.createStatement();
            s.execute(sqlStatement);
            s.close();
        } catch (SQLException e) {
            System.out.println("Error ejecutando sentencia SQL");
            throw e;
        }
    }

    /**
     * Este método ejecuta una sentencia de selección/consulta y muestra el resultado
     * @param sqlStatement SQL SELECT statement to execute
     */
    protected ResultSet ejecutarConsulta(String sqlStatement) throws Exception {
        try {
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(sqlStatement);
            return  rs;
        } catch (SQLException e) {
            System.out.println("Error ejecutando la sentencia SQL");
            throw e;
        }
    }

    public ArrayList<ProductoJB> getProductos() throws Exception {
        String sql = "SELECT * FROM productos";
        ResultSet rs = ejecutarConsulta(sql);

        ArrayList<ProductoJB> productos = new ArrayList<>();

        while (rs.next()) {
            ProductoJB p = new ProductoJB();
            p.setId(rs.getInt("id"));
            p.setNombre(rs.getString("nombre"));
            p.setPrecio(rs.getDouble("precio"));
            p.setDescripcion(rs.getString("descripcion"));
            productos.add(p);
        }

        rs.close();

        return productos;
    }

    public void addUser(String email, String password, String numeroTarjeta, String tipoTarjeta) throws Exception {
        String sql = "INSERT INTO usuarios (correo, password, numeroTarjeta, tipoTarjeta) VALUES ('" + email + "', '" + password + "','" + numeroTarjeta + "', '" + tipoTarjeta + "')";
        ejecutarOperacion(sql);
    }

    /**
     * Este es el programa principal
     */
    public static void main(String args[]) throws Exception {
        if (args.length == 4) {
            new TestPostgreSQL().test();
        } else {
            System.out.println("Escriba lo siguiente: java TestPostgreSQL host database user password");
        }
    }

}
