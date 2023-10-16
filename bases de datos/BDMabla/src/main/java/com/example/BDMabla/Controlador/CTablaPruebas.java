package com.example.BDMabla.Controlador;

import com.example.BDMabla.Entidad.TablaCategorias;
import com.example.BDMabla.Entidad.TablaPruebas;
import com.example.BDMabla.Servicios.STablaPruebas;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
public class CTablaPruebas {
    private STablaPruebas metodoPrueba;

    public CTablaPruebas(STablaPruebas metodoPrueba) {
        this.metodoPrueba = metodoPrueba;
    }
    @GetMapping("/getPrueba")
    public List<TablaPruebas> verPruebas(){
        return metodoPrueba.pruebas();
    }

    @PostMapping("/postPrueba/{alias}/{cate}")
    public boolean insertPrueba(@PathVariable("alias") String alias, @PathVariable("cate") String cate,  @RequestBody TablaPruebas prueba){
        return metodoPrueba.insertPrueba(alias,cate,prueba);
    }
    @DeleteMapping("/deletePrueba/{id}")
    public boolean deletePrueba(@PathVariable("id") Integer id){
        return metodoPrueba.deletePrueba(id);
    }
}
