package com.example.BDMabla.Servicios;


import com.example.BDMabla.Entidad.TablaCategorias;
import com.example.BDMabla.Entidad.TablaComentarios;
import com.example.BDMabla.Entidad.TablaSubcategorias;
import com.example.BDMabla.Entidad.TablaUsuario;
import com.example.BDMabla.Repositorio.RTablaSubcategorias;
import com.example.BDMabla.Repositorio.RTablaCategorias;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class STablaSubcategorias {

    private RTablaSubcategorias repSubcategorias;
    private RTablaCategorias repCategoria;

    public STablaSubcategorias(RTablaSubcategorias repSubcategorias, RTablaCategorias repCategoria) {
        this.repSubcategorias = repSubcategorias;
        this.repCategoria = repCategoria;
    }

    public List<TablaSubcategorias> getSubcategorias(){

        return repSubcategorias.findAll();
    }


   /* public String postSubcategoria(TablaSubcategorias s){
        if (repSubcategorias.findById(s.getSubcategoria()).isPresent()){
            return "La Subcategoria ya existe";
        }else {
            repSubcategorias.save(s);
            return "Registrada corectamente";
        }
    }*/



    public String addsubcate(String cate, TablaSubcategorias sub){
        TablaCategorias subcate= repCategoria.findById(cate).get();
        if(repCategoria.findById(cate).isPresent()){
            sub.setTablaCategorias(subcate);
            repSubcategorias.save(sub);
            return "subcategoria guardada";
        }
        else return "la categoria no existe no existe";
    }


}
