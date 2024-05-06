package com.minitienda.util.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class RemoveElementServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String prod = request.getParameter("producto");
        HttpSession ses = request.getSession();

        HttpSession sesion = request.getSession();
        if (sesion != null) {
            HashMap<String, Integer> carro = (HashMap<String, Integer>) sesion.getAttribute("carro");
            if (carro != null) {
                Integer cantidad = carro.get(prod);
                if (cantidad != null) {
                    if (cantidad > 1) {
                        carro.put(prod, cantidad - 1); // Decrementa la cantidad en 1
                    } else {
                        carro.remove(prod); // Elimina el producto si la cantidad es 0
                    }
                }
            }
        }

        // Redirigir a la página del carro
        response.sendRedirect("shopingCart.jsp");
    }
}
