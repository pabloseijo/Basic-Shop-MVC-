<!DOCTYPE html>
<html>
<head>
  <title>Fachero Shop - Portada</title>
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
      <form action="ProductosServlet" method="post">
        <div class="text-center">
          <button type="submit" class="btn btn-primary btn-lg">Ver Productos</button>
        </div>
      </form>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
