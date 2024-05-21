package com.minitienda.util.controller.servlets;

import model.JavaBeans.CarritoJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

public class TiendaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener la sesión del usuario (o crear una nueva si no existe)
        HttpSession session = request.getSession(true);

        // Obtener o crear la lista de productos en el carro desde la sesión
        CarritoJB carro = (CarritoJB) session.getAttribute("carro");
        if (carro == null) {
            carro = new CarritoJB();
            session.setAttribute("carro", carro);
        }

        // Añadir el producto al carro
        String producto = request.getParameter("producto");
        String cantidad = request.getParameter("cantidad");
        Integer cant = Integer.valueOf(cantidad);
        if (producto != null && !producto.isEmpty()) {
            HashMap<String,Integer> lista = carro.getLista();
            int count = lista.containsKey(producto) ? lista.get(producto) : 0;
            lista.put(producto, count + cant);
        }

        // Redirigir a la página del carro
        response.sendRedirect("shopingCart.jsp");
    }

    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
