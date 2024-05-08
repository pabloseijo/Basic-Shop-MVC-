package model.JavaBeans;

import java.io.Serializable;

public class ProductoJB implements Serializable  {
    private int id;
    private String nombre;
    private String descripcion;
    private Double precio;

    public ProductoJB() {}

    public ProductoJB(String nombre, String descripcion, Double precio, String imagen) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }



}
