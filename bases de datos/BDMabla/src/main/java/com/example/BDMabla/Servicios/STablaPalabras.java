package com.example.BDMabla.Servicios;

import com.example.BDMabla.Entidad.TablaCategorias;
import com.example.BDMabla.Entidad.TablaPalabras;
import com.example.BDMabla.Repositorio.RTablaCategorias;
import com.example.BDMabla.Repositorio.RTablaPalabras;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class STablaPalabras {
    private RTablaPalabras repositorio;

    public STablaPalabras(RTablaPalabras repositorio) {
        this.repositorio = repositorio;
    }

    public List<TablaPalabras> Mostrartodo(){
        return repositorio.findAll();
    }
    public TablaPalabras buscarpalabra(String Palabra){
        if(repositorio.findById(Palabra).isPresent()) {
            return repositorio.findById(Palabra).get();
        } else {
            return null;
        }
    }

   /* public String insertarpalabra(TablaPalabras t){
        for (TablaCategorias c: Mostrartodo()){
            if (c.getCategoria() == repositorio.findByCategoria(t.getCategoria())){
                repositorio.save(t);
                return "Categoria registrada";

            }else {
                return "esta ya existe";
            }


        }
        return "registrada";
    }*/
}
