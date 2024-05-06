package com.minitienda.util.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class TiendaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.write("<html><body><h4>PUTO</h4></body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener la sesión del usuario (o crear una nueva si no existe)
        HttpSession session = request.getSession(true);

        // Obtener o crear la lista de productos en el carro desde la sesión
        HashMap<String,Integer> carro = (HashMap<String, Integer>) session.getAttribute("carro");
        if (carro == null) {
            carro = new HashMap<>();
            session.setAttribute("carro", carro);
        }

        // Añadir el producto al carro
        String producto = request.getParameter("CD");
        String cantidad = request.getParameter("cantidad");
        Integer cant = Integer.valueOf(cantidad);
        if (producto != null && !producto.isEmpty()) {
            int count = carro.containsKey(producto) ? carro.get(producto) : 0;
            carro.put(producto, count + cant);
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
