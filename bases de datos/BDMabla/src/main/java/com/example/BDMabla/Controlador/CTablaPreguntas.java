package com.example.BDMabla.Controlador;

import com.example.BDMabla.Entidad.TablaPreguntas;
import com.example.BDMabla.Servicios.STablaPreguntas;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
public class CTablaPreguntas {
    private STablaPreguntas serTablaPreguntas;

    public CTablaPreguntas(STablaPreguntas serTablaPreguntas) {
        this.serTablaPreguntas = serTablaPreguntas;
    }

    @GetMapping("/getPreguntas")
    public List<TablaPreguntas> listarPreguntas(){
        return serTablaPreguntas.getPreguntas();
    }

    @GetMapping("/preguntas/{categoria}/{tipo}")
    public List<Object[]> preguntasCategoria(@PathVariable("categoria") String categoria, @PathVariable("tipo") int tipo){
        return serTablaPreguntas.getPreguntasOfCategoria(categoria, tipo);
    }

    @PostMapping("/postPregunta/{cat}")
    public Boolean insertarPregunta(@PathVariable("cat") String cat, @RequestBody TablaPreguntas p){
        return serTablaPreguntas.PostPreguntas(cat, p);
    }

    @PutMapping("/editPregunta/{np}")
    public boolean editarPregunta(@PathVariable("np") Integer np, @RequestBody TablaPreguntas preg){
        return serTablaPreguntas.editPregunta(np, preg);
    }

    @DeleteMapping("/deletePreg/{np}")
    public boolean deletePreg(@PathVariable("np") Integer np){
        return serTablaPreguntas.deletePregunta(np);
    }
}


