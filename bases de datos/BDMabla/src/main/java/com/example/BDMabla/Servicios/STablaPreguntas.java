package com.example.BDMabla.Servicios;

import com.example.BDMabla.Entidad.*;


import com.example.BDMabla.Entidad.TablaPreguntas;

import com.example.BDMabla.Repositorio.RTablaCategorias;
import com.example.BDMabla.Repositorio.RTablaPreguntas;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class STablaPreguntas {
    private RTablaPreguntas repTablaPreguntas;
    private RTablaCategorias repTablaCategorias;

    public STablaPreguntas(RTablaPreguntas repTablaPreguntas, RTablaCategorias repTablaCategorias) {
        this.repTablaPreguntas = repTablaPreguntas;
        this.repTablaCategorias = repTablaCategorias;
    }

    public List<TablaPreguntas> getPreguntas() {
        return repTablaPreguntas.findAll();
    }


    public Boolean PostPreguntas(String cat, TablaPreguntas p) {
        TablaCategorias categoria= repTablaCategorias.findById(cat).get();
        if(repTablaCategorias.findById(cat).isPresent()){
            p.setTablaCategorias(categoria);
            repTablaPreguntas.save(p);
            return true;
        }
        else return false;
    }

    public boolean editPregunta(Integer numpreg, TablaPreguntas p){
        if (repTablaPreguntas.findById(numpreg).isPresent()){
            TablaPreguntas preg = repTablaPreguntas.findById(numpreg).get();
            preg.setTipo(p.getTipo());
            preg.setSenia(p.getSenia());
            preg.setRespuesta(p.getRespuesta());
            repTablaPreguntas.save(preg);
            return true;
        }
        else return false;
    }

    public boolean deletePregunta(Integer numpreg){
        if(repTablaPreguntas.findById(numpreg).isPresent()){
            repTablaPreguntas.deleteById(numpreg);
            return true;
        }
        else return false;
    }

    //Preguntas por Categoria
    public List<Object[]> getPreguntasOfCategoria(String cat, int tipo){
        return repTablaPreguntas.PreguntasCategoria(cat, tipo);
    }

}

