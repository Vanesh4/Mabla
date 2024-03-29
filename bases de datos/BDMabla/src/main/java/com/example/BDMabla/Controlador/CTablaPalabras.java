package com.example.BDMabla.Controlador;
import com.example.BDMabla.Entidad.TablaPalabras;
import com.example.BDMabla.Servicios.STablaPalabras;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;
import java.util.List;
@RestController
@CrossOrigin(origins = "*")
public class CTablaPalabras {
    private STablaPalabras serviciopalabra;

    public CTablaPalabras(STablaPalabras servicio) {
        this.serviciopalabra = servicio;
    }
    @GetMapping("/verpalabras")
    public List<TablaPalabras> listapalabras(){
        return serviciopalabra.Mostrartodo();
    }

   @GetMapping("/insertpalabra")
    public String insertarpalabra(@RequestBody TablaPalabras t){
        return serviciopalabra.insertarpalabra(t);
    }


   @PostMapping("/addpalabra/{subcate}")
    public String insertarpalabra(@PathVariable("subcate") String subcate, @RequestBody TablaPalabras t){
        return serviciopalabra.addpalabra(subcate, t);
    }
  @GetMapping("/listandopalabras/{sub}")
    public List<Object[]> Palabras(@PathVariable("sub") String sub){
        return serviciopalabra.getpalabrasforsubcate(sub);
    }
/*
    @GetMapping("/filtrar/{inicial}")
    public ResponseEntity<List<TablaPalabras>> filtrarPalabrasPorInicial(@RequestParam String inicial) {
        List<TablaPalabras> palabrasFiltradas = serviciopalabra.filtrarpalabraInicial(inicial);
        return ResponseEntity.ok(palabrasFiltradas);
    }*/

    @GetMapping("/palabrasinicial/{inicial}")
    public List<Object[]> listadoPalabras(@PathVariable("inicial") String inicial){
        return serviciopalabra.buscarPorInicial(inicial);
    }

}



