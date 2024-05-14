package model.JavaBeans;

import java.io.Serializable;

public class UsuarioJB implements Serializable {
    private String nombre;
    private String email;
    private String tipo_tarjeta;
    private String num_tarjeta;
    public UsuarioJB(){

    }

    public String getEmail() {
        return email;
    }

    public String getNombre() {
        return nombre;
    }

    public String getNum_tarjeta() {
        return num_tarjeta;
    }

    public String getTipo_tarjeta() {
        return tipo_tarjeta;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setNum_tarjeta(String num_tarjeta) {
        this.num_tarjeta = num_tarjeta;
    }

    public void setTipo_tarjeta(String tipo_tarjeta) {
        this.tipo_tarjeta = tipo_tarjeta;
    }
}
