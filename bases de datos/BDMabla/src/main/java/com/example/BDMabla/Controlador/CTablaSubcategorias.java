package com.example.BDMabla.Controlador;
import com.example.BDMabla.Entidad.TablaComentarios;
import com.example.BDMabla.Servicios.STablaSubcategorias;
import org.springframework.web.bind.annotation.*;
import com.example.BDMabla.Entidad.TablaSubcategorias;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CTablaSubcategorias {

    private STablaSubcategorias serSubcategorias;

    public CTablaSubcategorias(STablaSubcategorias serSubcategorias) {
        this.serSubcategorias = serSubcategorias;
    }

    @GetMapping("/getSubcategoria")
    public List<TablaSubcategorias> versubcategorias(){
        return serSubcategorias.getSubcategorias();
    }

   /* @PostMapping("/postSubcategoria")
    public String insertSubcate(@RequestBody TablaSubcategorias sub){
        return serSubcategorias.postSubcategoria(sub);
    }*/

    @PostMapping("/addsubcate/{cate}")
    public String addComent(@PathVariable("cate") String cate, @RequestBody TablaSubcategorias sub){
        return serSubcategorias.addsubcate(cate, sub);
    }
}
