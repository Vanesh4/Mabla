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

    public STablaPreguntas(RTablaPreguntas repTablaPreguntas, RTablaCategorias repTablaCategorias) {
        this.repTablaPreguntas = repTablaPreguntas;
        this.repTablaCategorias = repTablaCategorias;
    }

    public List<TablaPreguntas> getPreguntas() {

        return repTablaPreguntas.findAll();
    }
}

