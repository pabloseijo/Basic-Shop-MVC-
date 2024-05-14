package com.minitienda.util.controller.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.db.ConnectionPool;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegistroServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String numeroTarjeta = request.getParameter("numeroTarjeta");
        String tipoTarjeta = request.getParameter("tipoTarjeta");

        // Obtener conexión
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            con = pool.getConnection();
            String query = "INSERT INTO usuarios (correo, password, numeroTarjeta, tipoTarjeta) VALUES (?, ?, ?, ?)";
            stmt = con.prepareStatement(query);
            stmt.setString(1, correo);
            stmt.setString(2, password);
            stmt.setString(3, numeroTarjeta);
            stmt.setString(4, tipoTarjeta);
            stmt.executeUpdate();

            // Redirigir al usuario a la página de login después del registro exitoso
            response.sendRedirect("login.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar errores, por ejemplo, redirigir a una página de error
            response.sendRedirect("register.jsp");
        } finally {
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) pool.closeConnection(con);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }
}
