package com.minitienda.util.servlets;

import JavaBeans.CarritoJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;

public class RemoveElementServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prod = request.getParameter("producto");
        HttpSession ses = request.getSession();

        HttpSession sesion = request.getSession();
        if (sesion != null) {
            CarritoJB carro = (CarritoJB) sesion.getAttribute("carro");
            if (carro != null) {
                HashMap<String,Integer> lista = carro.getLista();
                Integer cantidad = lista.get(prod);
                if (cantidad != null) {
                    if (cantidad > 1) {
                        lista.put(prod, cantidad - 1); // Decrementa la cantidad en 1
                    } else {
                        lista.remove(prod); // Elimina el producto si la cantidad es 0
                    }
                }
            }
        }

        // Redirigir a la página del carro
        response.sendRedirect("shopingCart.jsp");
    }
}
