<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="JavaBeans.CarritoJB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CARRO</title>
</head>
<body>
<h1>TU CARRO WEY</h1>
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
            <button type="submit">Eliminar</button>
        </form>
    </li>
    <%
                }
            }
        }
    %>

</ul>
<p>Precio total: <%= importeTotal %></p>
<a href="index.jsp">Continue Shopping</a>
<a href="#"> PAGAR PEDIDO</a>
</body>
</html>
