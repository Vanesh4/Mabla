/*
package com.example.BDMabla.Servicios;
<<<<<<< HEAD
import com.example.BDMabla.Entidad.TablaPreguntas;
=======

import com.example.BDMabla.Entidad.TablaPalabras;
/*import com.example.BDMabla.Entidad.TablaPreguntas;
>>>>>>> 9cce64ea0664dc09262d43416b6146cd669dcd2b
import com.example.BDMabla.Repositorio.RTablaPreguntas;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class STablaPreguntas {
    private RTablaPreguntas repTablaPreguntas;

    public STablaPreguntas(RTablaPreguntas repTablaPreguntas) {
        this.repTablaPreguntas = repTablaPreguntas;
    }

    public List<TablaPreguntas> mostrarTodasPreguntas(){
        return repTablaPreguntas.findAll();
    }

    //insertar
    public String insertarPregunta(TablaPreguntas p){
        boolean Loencontro=false;
        for (TablaPreguntas i: mostrarTodasPreguntas()  ) {
            if(i.getNumeroPregunta() == repTablaPreguntas.findbyIdint(p.getNumeroPregunta()).getNumeroPregunta()){
                Loencontro=true;
                break;
            }
            else {
                Loencontro=false;
            }
        }
        if (Loencontro==false) return "Se insertó correctamente";
        else return "La palabra ya está registrada";

    }
<<<<<<< HEAD
}
*/
<<<<<<< HEAD
=======

>>>>>>> 95f060848a07e25231932e242b809db46cf8c6e9
