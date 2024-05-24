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
    .card {
      background-color: #495057;
      border: none;
    }
    .card .card-body {
      color: #ffffff;
    }
    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }
    .btn-primary:hover {
      background-color: #0056b3;
      border-color: #004085;
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
      <div class="card text-center">
        <div class="card-body">
          <h1 class="card-title">Bienvenido a Fachero Shop</h1>
          <p class="card-text">Explora nuestra coleccion exclusiva de productos de alta calidad.</p>
          <form action="ProductosServlet" method="post">
            <button type="submit" class="btn btn-primary btn-lg">Ver Productos</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
