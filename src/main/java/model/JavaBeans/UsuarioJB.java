package model.JavaBeans;

import java.io.Serializable;

public class UsuarioJB implements Serializable {
    private Integer id;
    private String email;
    private String tipo_tarjeta;
    private String num_tarjeta;
    public UsuarioJB(){

    }

    public Integer getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getNum_tarjeta() {
        return num_tarjeta;
    }

    public String getTipo_tarjeta() {
        return tipo_tarjeta;
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

    public void setId(Integer id) {
        this.id = id;
    }
}
