package JavaBeans;

import java.io.Serializable;
import java.util.HashMap;

public class CarritoJB implements Serializable {
    private HashMap<String,Integer> lista;
    public CarritoJB() {
        lista = new HashMap<>();
    }
    public void addProducto(String producto,Integer cantidad){
        lista.put(producto,cantidad);
    }

    public HashMap<String,Integer> getLista() {
        return lista;
    }
}
