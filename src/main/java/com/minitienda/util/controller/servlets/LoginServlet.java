package com.minitienda.util.controller.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.JavaBeans.UsuarioJB;
import model.db.ConnectionPool;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginServlet extends HttpServlet {

    private void log(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        // Obtener los parámetros del formulario
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        // Obtener conexión
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = pool.getConnection();
            String query = "SELECT * FROM usuarios WHERE correo = ? AND password = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, correo);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Usuario encontrado, establecer sesión y redirigir
                HttpSession session = request.getSession();
                if(session.getAttribute("user") == null) {
                    UsuarioJB user = new UsuarioJB();
                    user.setId(rs.getInt(1));
                    user.setEmail(correo);
                    user.setNum_tarjeta(rs.getString(4));
                    user.setTipo_tarjeta(rs.getString(5));
                    session.setAttribute("user",user);
                }
                response.sendRedirect("finalizarCompra.jsp");
            } else {
                // Usuario no encontrado, redirigir a register.jsp
                response.sendRedirect("register.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) pool.closeConnection(con);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            log(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            log(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
