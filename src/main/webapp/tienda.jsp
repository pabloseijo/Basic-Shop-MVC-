<%@ page import="model.db.ConnectionPool, model.JavaBeans.ProductoJB" %>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.JavaBeans.PedidoJB" %>
<%@ page import="model.JavaBeans.UsuarioJB" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Productos</title>
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
        .list-group-item {
            color: #000000; /* Cambia el color de la letra a negro */
        }

        .scrollable-list {
            max-height: 400px;
            overflow-y: auto;
        }

        .login-button {
            position: absolute;
            top: 10px;
            right: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="text-center mb-4">
                <img src="images/fachero_shop.png" class="img-fluid" alt="Logo">
            </div>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h1 class="text-center mb-4">Productos Disponibles</h1>
        </div>
    </div>
    <hr>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h2 class="text-center mb-4">Lista de Productos</h2>
            <form action="TiendaServlet" method="post">
                <div class="form-group">
                    <label for="producto">Producto:</label>
                    <select class="form-control" id="producto" name="producto">
                        <%
                            ArrayList<ProductoJB> productos = (ArrayList<ProductoJB>) request.getSession().getAttribute("productos");

                            if (productos != null && !productos.isEmpty()) {
                                for (ProductoJB producto : productos) {
                        %>
                        <option class="list-group-item">
                            <%= producto.getNombre() %> | $<%= producto.getPrecio() %>
                        </option>
                        <%
                            }
                        } else {
                        %>
                        <option class="list-group-item">No hay productos disponibles.</option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="cantidad">Cantidad:</label>
                    <input type="text" class="form-control" id="cantidad" name="cantidad" value="1">
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Seleccionar Producto</button>
                </div>
            </form>
        </div>
    </div>
    <hr>
    <%
        UsuarioJB user = (UsuarioJB) session.getAttribute("user");
        if (user != null) {
            ArrayList<PedidoJB> pedidos = new ArrayList<>();
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connectionPedidos = null;
            PreparedStatement psPedidos = null;
            ResultSet rsPedidos = null;

            try {
                connectionPedidos = pool.getConnection();
                String sqlPedidos = "SELECT * FROM pedidos WHERE idUsuario = ?";
                psPedidos = connectionPedidos.prepareStatement(sqlPedidos);
                psPedidos.setInt(1, user.getId());
                rsPedidos = psPedidos.executeQuery();

                while (rsPedidos.next()) {
                    PedidoJB pedido = new PedidoJB();
                    pedido.setId(rsPedidos.getInt("id"));
                    pedido.setIdUsuario(rsPedidos.getInt("idUsuario"));
                    pedido.setFecha(rsPedidos.getDate("fecha"));
                    pedido.setTotal(rsPedidos.getFloat("total"));
                    pedidos.add(pedido);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (rsPedidos != null) {
                    try {
                        rsPedidos.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (psPedidos != null) {
                    try {
                        psPedidos.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                pool.closeConnection(connectionPedidos);
            }

            if (!pedidos.isEmpty()) {
    %>
    <div class="row justify-content-center" style="padding-bottom: 20px;">
        <div class="col-md-8">
            <h2 class="text-center mb-4">Tus Pedidos</h2>
            <div class="scrollable-list">
                <ul class="list-group">
                    <%
                        for (int i = pedidos.size() - 1; i >= 0; i--) {
                            PedidoJB pedido = pedidos.get(i);
                    %>
                    <li class="list-group-item">
                        Pedido ID: <%= pedido.getId() %> | Fecha: <%= pedido.getFecha() %> | Total: $<%= pedido.getTotal() %>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
    <%
    } else {
    %>
    <div class="row justify-content-center" style="padding-bottom: 20px;">
        <div class="col-md-8">
            <h2 class="text-center mb-4">No has realizado ningún pedido.</h2>
        </div>
    </div>
    <%
            }
        }
    %>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>