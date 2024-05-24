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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css">
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
        tr{
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center"><i class="bi bi-cart"></i> Carrito</h1>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Importe</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <%
                Double importeTotal = 0.0;
                if (session != null) {
                    CarritoJB carro = (CarritoJB) session.getAttribute("carro");
                    if (carro != null) {
                        for (Map.Entry<String, Integer> entry : carro.getLista().entrySet()) {
                            String producto = entry.getKey();
                            StringTokenizer t = new StringTokenizer(producto, "|");
                            String nombreProducto = t.nextToken();
                            String precioString = t.nextToken();
                            precioString = precioString.replace('$', ' ').trim();
                            Integer cantidad = entry.getValue();
                            Double importe = cantidad * Double.parseDouble(precioString);
                            importeTotal += importe;
            %>
            <tr>
                <td><%= nombreProducto %></td>
                <td><%= cantidad %></td>
                <td>$<%= importe %></td>
                <td>
                    <form action="Remove" method="post" style="display: inline;">
                        <input type="hidden" name="producto" value="<%= producto %>">
                        <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                    </form>
                </td>
            </tr>
            <%
                        }
                        carro.setImporteTotal(importeTotal);
                    }
                }
            %>
            </tbody>
        </table>
    </div>
    <p class="text-center">Precio total: <%= importeTotal %></p>
    <div class="text-center">
        <a href="tienda.jsp" class="btn btn-primary mr-2">Continuar Comprando</a>
        <a href="login.jsp" class="btn btn-success">PAGAR PEDIDO</a>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
