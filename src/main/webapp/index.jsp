<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<table align="center" border="0">
  <tr>
    <th><IMG SRC="" ALIGN="CENTER"></th>
    <th><font face="Times New Roman,Times" size="+3">Musica para DAA</font></th>
    <th><IMG SRC="" ALIGN="CENTER"></th>
  </tr>
</table>
<hr>
<p>
<center>
  <form action="TiendaServlet" method="post">
    <b>CD:</b>
    <select name="CD">
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
    <b>Cantidad:</b>
    <input type="text" name="cantidad" value="1">
    <p>
    <center>
      <input type="submit" value="Selecciona Producto">
    </center>
  </form>
</center>
<hr>
</body>
</html>