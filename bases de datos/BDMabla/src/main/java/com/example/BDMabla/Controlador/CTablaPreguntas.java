package com.example.BDMabla.Controlador;

import com.example.BDMabla.Entidad.TablaPreguntas;
import com.example.BDMabla.Servicios.STablaPreguntas;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CTablaPreguntas {
    private STablaPreguntas serTablaPreguntas;

    public CTablaPreguntas(STablaPreguntas serTablaPreguntas) {
        this.serTablaPreguntas = serTablaPreguntas;
    }

    @GetMapping("/listarPreguntasa")
    public List<TablaPreguntas> listarPreguntas(){
        return serTablaPreguntas.mostrarTodasPreguntas();
    }

    @PostMapping("/insertarPregunta")
    public String insertarPregunta(@RequestBody TablaPreguntas p){
        return serTablaPreguntas.insertarPregunta(p);
    }
}
