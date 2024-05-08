package com.minitienda.util.controller.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private void log(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Obtener los parámetros del formulario
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Aquí podrías hacer la lógica de autenticación, como verificar en una base de datos
        // En este ejemplo, simplemente imprimiré los datos recibidos
        System.out.println("Correo: " + email);
        System.out.println("Contraseña: " + password);

        // Redireccionar o mostrar algún mensaje según el resultado de la autenticación
        // Por ejemplo:
        HttpSession session = request.getSession();
        session.setAttribute("connect", true);
        response.sendRedirect("finalizarCompra.jsp");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log(request, response);
    }
}
