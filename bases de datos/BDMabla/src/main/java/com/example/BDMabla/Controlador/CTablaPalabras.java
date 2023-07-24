package com.example.BDMabla.Controlador;
import com.example.BDMabla.Entidad.TablaPalabras;
import com.example.BDMabla.Servicios.STablaPalabras;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
=======
<<<<<<< HEAD
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
=======

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

>>>>>>> 4203639c441754e245a26c257ee7d66fea5b55cc
>>>>>>> 04ade1e81b0cb7cc4baf3ba37f4d254cd7a7641c
import org.springframework.web.bind.annotation.*;
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
    }
   /* @GetMapping("/insertpalabra")
    public String insertarpalabra(@RequestBody TablaPalabras t){
        return serviciopalabra.insertarpalabra(t);
    }
<<<<<<< HEAD
=======
*/


<<<<<<< HEAD
=======


>>>>>>> 4203639c441754e245a26c257ee7d66fea5b55cc

>>>>>>> 04ade1e81b0cb7cc4baf3ba37f4d254cd7a7641c
   @PostMapping("/addpalabra/{subcate}")
    public String insertarpalabra(@PathVariable("subcate") String subcate, @RequestBody TablaPalabras t){
        return serviciopalabra.addpalabra(subcate, t);
    }
    @GetMapping("/listandopalabras/{sub}")
    public List<Object[]> Palabras(@PathVariable("sub") String sub){
        return serviciopalabra.getpalabrasforsubcate(sub);
    }

}



