package com.example.BDMabla.Controlador;
import com.example.BDMabla.Servicios.STablaCategorias;
import org.springframework.web.bind.annotation.*;
import com.example.BDMabla.Entidad.TablaCategorias;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
public class CTablaCategorias {
    private STablaCategorias serCategorias;

    public CTablaCategorias(STablaCategorias serCategorias) {
        this.serCategorias = serCategorias;
    }

    @GetMapping("/getCategorias")
    public List<TablaCategorias> vercategorias(){
        return serCategorias.getCategorias();
    }
    @PostMapping("/postCategorias")
    public String insertCategoria(@RequestBody TablaCategorias cat){
        return serCategorias.PostCategoria(cat);
    }

    @DeleteMapping("/deletecate/{cate}")
    public boolean deletecate(@PathVariable("cate") String cate){
        return serCategorias.deleteCategoria(cate);
    }

}

