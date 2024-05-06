<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CARRO</title>
</head>
<body>
<h1>TU CARRO WEY</h1>
<ul>
    <%

        if (session != null) {
            HashMap<String, Integer> carro = (HashMap<String, Integer>) session.getAttribute("carro");
            if (carro != null) {
                for (Map.Entry<String, Integer> entry : carro.entrySet()) {
                    String producto = entry.getKey();
                    Integer cantidad = entry.getValue();
    %>
    <li>
        <%= producto %> - Cantidad: <%= cantidad %>
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
<a href="index.jsp">Continue Shopping</a>
</body>
</html>
