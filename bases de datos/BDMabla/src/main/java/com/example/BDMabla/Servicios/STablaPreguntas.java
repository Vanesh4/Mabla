package com.example.BDMabla.Servicios;

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

    public STablaPreguntas(RTablaPreguntas repTablaPreguntas) {
        this.repTablaPreguntas = repTablaPreguntas;
    }

    public List<TablaPreguntas> getPreguntas(){
        return repTablaPreguntas.findAll();
    }

    //insertar
    public Boolean postPregunta(Integer idCategoria, TablaPreguntas preg){
        TablaCategorias cat = repTablaCategorias.findById(idCategoria).get();
        if (repTablaCategorias.findById(idCategoria).isPresent()){

        }

            /*TablaUsuario user= repoUsuario.findById(alias).get();
            if(repoUsuario.findById(alias).isPresent()){
                comment.setTablaUsuario(user);
                repostorioComents.save(comment);
                return "Comentario guardado";
            }
            else return "El alias no exist";*/
        return true;
    }

}

