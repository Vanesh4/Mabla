package com.example.BDMabla.Servicios;

import com.example.BDMabla.Entidad.TablaCategorias;
import com.example.BDMabla.Repositorio.RTablaCategorias;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Collections;
import java.util.Objects;

@Service
public class STablaCategorias {

    private RTablaCategorias repCategorias;

    public STablaCategorias(RTablaCategorias repCategorias) {
        this.repCategorias = repCategorias;
    }

    public List<TablaCategorias> getCategorias(){
        return repCategorias.findAll();
    }

    public String PostCategoria(TablaCategorias c){
        if (repCategorias.findById(c.getCategoria()).isPresent()){
            return "La Categoria ya existe";
        }
        else {
            repCategorias.save(c);
            return "Registrada corectamente";
        }
    }


    public boolean deleteCategoria(String cate){
        repCategorias.deleteById(cate);
        return true;
    }


/*public List<TablaCategorias> buscarCategoria(String cate){

        return repositorio.findByCategoria(cate);
    }


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

        if (inserto==true){
            return "se registro";
        }
        else return "no se registro";
    }*/

   /* public String Deletecate(Integer idcat){
        if(repCategorias.findById(idcat).isPresent()){
            repCategorias.deleteById(idcat);
            return "Se ha eliminado correctamente";
        }
        else return "No se elimino";
    }*/


}

