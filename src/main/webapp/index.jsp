<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
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
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="text-center mb-4">
        <img src="images/fachero_shop.png" class="img-fluid" alt="Logo">
      </div>
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-md-6">
      <h1 class="text-center mb-4">Música para DAA</h1>
    </div>
  </div>
  <hr>
  <div class="row justify-content-center">
    <div class="col-md-6">
      <form action="TiendaServlet" method="post">
        <div class="form-group">
          <label for="CD">CD:</label>
          <select class="form-control" id="CD" name="CD">
            <option>Yuan | The Guo Brothers | China | $14.95</option>
            <option>Drums of Passion | Babatunde Olatunji | Nigeria | $16.95</option>
            <option>Kaira | Tounami Diabate| Mali | $16.95</option>
            <option>The Lion is Loose | Eliades Ochoa | Cuba | $13.95</option>
            <option>Dance the Devil Away | Outback | Australia | $14.95</option>
            <option>Record of Changes | Samulnori | Korea | $12.95</option>
            <option>Djelika | Tounami Diabate | Mali | $14.95</option>
            <option>Rapture | Nusrat Fateh Ali Khan | Pakistan | $12.95</option>
            <option>Cesaria Evora | Cesaria Evora | Cape Verde | $16.95</option>
            <option>DAA | GSTIC | Spain | $50.00</option>
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
