package com.minitienda.util.controller.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.JavaBeans.CarritoJB;
import model.JavaBeans.UsuarioJB;
import model.db.ConnectionPool;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

public class PedidoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        CarritoJB carro = (CarritoJB) session.getAttribute("carro");
        UsuarioJB user = (UsuarioJB) session.getAttribute("user");
        Date fecha = new Date();
        Double total = carro.getImporteTotal();

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection con = null;
        PreparedStatement stmt = null;

        try {
            con = pool.getConnection();
            String sql = "INSERT INTO pedidos (idUsuario, fecha, total) VALUES (?, ?, ?)";
            stmt = con.prepareStatement(sql);

            for (int i = 0; i < carro.getLista().size(); i++) {
                stmt.setInt(1, user.getId());
                stmt.setDate(2, new java.sql.Date(fecha.getTime()));
                stmt.setDouble(3, total);
                stmt.executeUpdate();
            }

            // Limpiar el carrito
            session.removeAttribute("carro");

            // Enviar mensaje de éxito
            request.setAttribute("message", "Pedido realizado con éxito.");
            request.getRequestDispatcher("tienda.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error al conectar a la base de datos", e);
        } finally {
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) pool.closeConnection(con);
        }
    }

}
