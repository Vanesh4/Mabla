package com.example.BDMabla.Controlador;

import com.example.BDMabla.Entidad.TablaPalabras;
import com.example.BDMabla.Servicios.STablaPalabras;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController

public class CTablaPalabras {
    private STablaPalabras servicio;

    public CTablaPalabras(STablaPalabras servicio) {
        this.servicio = servicio;
    }
    @GetMapping("/verpalabras")
    public List<TablaPalabras> listapalabras(){
        return servicio.Mostrartodo();
    }
    @GetMapping("/insertpalabra")
    public String insertarpalabra(@RequestBody TablaPalabras t){
        return servicio.insertarpalabra(t);
    }
}
