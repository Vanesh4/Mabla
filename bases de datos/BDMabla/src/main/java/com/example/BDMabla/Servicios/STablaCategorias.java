
package com.example.BDMabla.Servicios;

import com.example.BDMabla.Entidad.TablaCategorias;
import com.example.BDMabla.Repositorio.RTablaCategorias;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Collections;

@Service

public class STablaCategorias {

    private RTablaCategorias repositorio;


    public STablaCategorias(RTablaCategorias repositorio) {
        this.repositorio = repositorio;
    }

    public List<TablaCategorias> Mostrartodo(){
        return repositorio.findAll();
    }

    public TablaCategorias buscarId(String IdCategoria){
        if(repositorio.findById(IdCategoria).isPresent()) {
            return repositorio.findById(IdCategoria).get();
        } else {
            return null;
        }
    }

    /*public List<TablaCategorias> buscarCategoria(String cate){

        return repositorio.findByCategoria(cate);
    }*/

    public String agregarCategoria(TablaCategorias c){
        boolean encontrado=false;
        for (TablaCategorias i: Mostrartodo()  ) {
            if(i.getIdCategoria() == repositorio.findbyIdcate(c.getIdCategoria()).getIdCategoria()){
                encontrado=true;
                break;
            }
            else {
                encontrado=false;
            }
        }
        if (encontrado==false) return "Categoria agregada correctamente";
        else return "La categoria ya está registrada";

    }



    
}

