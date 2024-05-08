<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="model.JavaBeans.CarritoJB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CARRO</title>
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
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
        }
        li:last-child {
            margin-bottom: 0;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center">TU CARRO WEY</h1>
    <ul>
        <%
            Double importeTotal = 0.0;
            if (session != null) {
                CarritoJB carro = (CarritoJB) session.getAttribute("carro");
                if (carro != null) {
                    for (Map.Entry<String, Integer> entry : carro.getLista().entrySet()) {
                        String producto = entry.getKey();
                        StringTokenizer t = new StringTokenizer(producto,"|");
                        t.nextToken();
                        t.nextToken();
                        t.nextToken();
                        String precioString = t.nextToken();
                        precioString = precioString.replace('$',' ').trim();
                        Integer cantidad = entry.getValue();
                        Double importe = cantidad * Double.parseDouble(precioString);
                        importeTotal+=importe;
        %>
        <li>
            <%= producto %> - Cantidad: <%= cantidad %> - Importe: <%= importe %>
            <!-- Agregar un formulario para eliminar este producto -->
            <form action="Remove" method="post" style="display: inline;">
                <input type="hidden" name="producto" value="<%= producto %>">
                <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
            </form>
        </li>
        <%
                    }
                    carro.setImporteTotal(importeTotal);
                }
            }
        %>
    </ul>
    <p class="text-center">Precio total: <%= importeTotal %></p>
    <div class="text-center">
        <a href="index.jsp" class="btn btn-primary mr-2">Continuar Comprando</a>
        <a href="login.jsp" class="btn btn-success">PAGAR PEDIDO</a>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
