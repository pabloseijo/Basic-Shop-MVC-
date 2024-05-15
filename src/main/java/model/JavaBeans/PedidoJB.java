package model.JavaBeans;

import java.io.Serializable;
import java.util.Date;

public class PedidoJB implements Serializable {
    private int id;
    private int idUsuario;
    private int idProducto;
    private Date fecha;
    private float total;

    public PedidoJB() {}

    public PedidoJB(int idUsuario, int idProducto, Date fecha, float total) {
        this.idUsuario = idUsuario;
        this.idProducto = idProducto;
        this.fecha = fecha;
        this.total = total;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
}
