<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
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
  <h1 class="text-center">Login</h1>
  <%
    if (session != null && session.getAttribute("user") != null) {
      response.sendRedirect("finalizarCompra.jsp");
    }
  %>
  <form action="login" method="post">
    <div class="form-group">
      <label for="correo">Correo:</label>
      <input type="email" class="form-control" id="correo" name="correo" required>
    </div>
    <div class="form-group">
      <label for="password">Contraseña:</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <button type="submit" class="btn btn-primary">Login</button>
  </form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
