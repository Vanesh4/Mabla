/*package com.example.BDMabla.Servicios;

import com.example.BDMabla.Entidad.*;


import com.example.BDMabla.Entidad.TablaPreguntas;

import com.example.BDMabla.Repositorio.RTablaCategorias;
import com.example.BDMabla.Repositorio.RTablaPreguntas;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class STablaPreguntas {
    private RTablaPreguntas repTablaPreguntas;
    private RTablaCategorias repTablaCategorias;

    public STablaPreguntas(RTablaPreguntas repTablaPreguntas, RTablaCategorias repTablaCategorias) {
        this.repTablaPreguntas = repTablaPreguntas;
        this.repTablaCategorias = repTablaCategorias;
    }

    public List<TablaPreguntas> getPreguntas(){

        return repTablaPreguntas.findAll();
    }*/

    //insertar
    /*public String postPreguntas(Integer idCategoria, TablaPreguntas p){

        TablaPreguntas preg = new TablaPreguntas();

        TablaCategorias cat = repTablaCategorias.findById(idCategoria).get();
        if (repTablaCategorias.findById(idCategoria).isPresent()){
            preg.setNumeroPregunta(p.getNumeroPregunta());
            System.out.println("Entrooo o nooooo");
            preg.setIdCategoria(cat);
            System.out.println(cat);
            preg.setTipo(p.getTipo());
            preg.setSenia(p.getSenia());
            preg.setRespuesta(p.getRespuesta());
            repTablaPreguntas.save(preg);
            return "se registro";
        }
        else return "no se registro";
    }*/

    /*
    public String postPreguntas(Integer idCategoria, TablaPreguntas p){

        TablaPreguntas preg = new TablaPreguntas();

        TablaCategorias cat = repTablaCategorias.findById(idCategoria).get();
        if (repTablaCategorias.findById(idCategoria).isPresent()){
            preg.setNumeroPregunta(p.getNumeroPregunta());
            preg.setRespuesta(p.getRespuesta());
            preg.setSenia(p.getSenia());
            preg.setTipo(p.getTipo());
            preg.setIdCategoria(cat);
            repTablaPreguntas.save(preg);
            return "se registro";
        }
        else return "no se registro";
    }

}
*/
