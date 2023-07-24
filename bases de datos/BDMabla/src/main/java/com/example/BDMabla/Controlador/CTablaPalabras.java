package com.example.BDMabla.Controlador;

import com.example.BDMabla.Entidad.TablaPalabras;
import com.example.BDMabla.Servicios.STablaPalabras;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
=======
import org.springframework.web.bind.annotation.*;
>>>>>>> 51582b50e48d28e2d430ab7f420db771940d787c

import java.util.List;

@RestController

public class CTablaPalabras {
    private STablaPalabras serviciopalabra;

    public CTablaPalabras(STablaPalabras servicio) {
        this.serviciopalabra = servicio;
    }
    @GetMapping("/verpalabras")
    public List<TablaPalabras> listapalabras(){
        return serviciopalabra.Mostrartodo();
<<<<<<< HEAD
    }
    @GetMapping("/insertpalabra")
    public String insertarpalabra(@RequestBody TablaPalabras t){
        return serviciopalabra.insertarpalabra(t);
    }

=======
    }

   @PostMapping("/addpalabra/{subcate}")
    public String insertarpalabra(@PathVariable("subcate") String subcate, @RequestBody TablaPalabras t){
        return serviciopalabra.addpalabra(subcate, t);
    }



    @GetMapping("/listandopalabras/{sub}")
    public List<Object[]> Palabras(@PathVariable("sub") String sub){
        return serviciopalabra.getpalabrasforsubcate(sub);
    }

>>>>>>> 51582b50e48d28e2d430ab7f420db771940d787c
}



