package com.minitienda.util.servlets;

import JavaBeans.CarritoJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class ResetCarroServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        if (sesion != null) {
            CarritoJB carro = (CarritoJB) sesion.getAttribute("carro");
            if (carro != null) {
                carro.getLista().clear();
            }
        }
        // Redirigir a la página del carro
        response.sendRedirect("index.jsp");
    }

}
