<%@ page import="model.db.ConnectionPool, model.JavaBeans.ProductoJB" %>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
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
              ArrayList<ProductoJB> productos = new ArrayList<>();
              ConnectionPool pool = ConnectionPool.getInstance();
              Connection connection = null;
              PreparedStatement ps = null;
              ResultSet rs = null;

              try {
                connection = pool.getConnection();
                String sql = "SELECT * FROM productos";
                ps = connection.prepareStatement(sql);
                rs = ps.executeQuery();

                while (rs.next()) {
                  ProductoJB p = new ProductoJB();
                  p.setId(rs.getInt("id"));
                  p.setNombre(rs.getString("nombre"));
                  p.setPrecio(rs.getDouble("precio"));
                  p.setDescripcion(rs.getString("descripcion"));
                  productos.add(p);
                }
              } catch (SQLException e) {
                e.printStackTrace();
              } finally {
                if (rs != null) {
                  try {
                    rs.close();
                  } catch (SQLException e) {
                    e.printStackTrace();
                  }
                }
                if (ps != null) {
                  try {
                    ps.close();
                  } catch (SQLException e) {
                    e.printStackTrace();
                  }
                }
                pool.closeConnection(connection);
              }

              if (!productos.isEmpty()) {
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
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
