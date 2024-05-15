<%@ page import="model.JavaBeans.CarritoJB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Finalizar Compra</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #343a40;
            color: #ffffff;
            padding-top: 50px;
        }
        h1, h2, h3, h4, h5, h6 {
            color: #ffffff;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center">Finalizar Compra</h1>
    <%
        CarritoJB carro = (CarritoJB) session.getAttribute("carro");
    %>
    <p class="text-center">El importe total de la compra es: <%= carro.getImporteTotal() %></p>
    <div class="text-center">
        <form action="pedido" method="post">
            <button type="submit" class="btn btn-success">Pagar y seguir comprando</button>
        </form>
    </div>
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
    <div class="alert alert-success mt-3 text-center"><%= message %></div>
    <%
        }
    %>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
