package model.JavaBeans;

import java.io.Serializable;
import java.util.HashMap;

public class CarritoJB implements Serializable {
    private HashMap<String,Integer> lista;
    private Double importeTotal;
    public CarritoJB() {
        lista = new HashMap<>();
        importeTotal = 0.0;
    }
    public void addProducto(String producto,Integer cantidad){
        lista.put(producto,cantidad);
    }


    public Double getImporteTotal() {
        return importeTotal;
    }

    public void setImporteTotal(Double importeTotal) {
        this.importeTotal = importeTotal;
    }

    public void setLista(HashMap<String, Integer> lista) {
        this.lista = lista;
    }

    public HashMap<String,Integer> getLista() {
        return lista;
    }
}
