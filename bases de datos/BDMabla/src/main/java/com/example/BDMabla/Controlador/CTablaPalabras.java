package com.example.BDMabla.Controlador;
import com.example.BDMabla.Entidad.TablaPalabras;
import com.example.BDMabla.Servicios.STablaPalabras;
<<<<<<< HEAD
=======
<<<<<<< HEAD
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
=======
>>>>>>> be1877a5319c35fe6bdd5416176a1acd737267cd


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

<<<<<<< HEAD
=======

>>>>>>> 18613e63b8f3f3c73505e944bc7062f28061177c
>>>>>>> be1877a5319c35fe6bdd5416176a1acd737267cd
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
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======

>>>>>>> 18613e63b8f3f3c73505e944bc7062f28061177c
>>>>>>> be1877a5319c35fe6bdd5416176a1acd737267cd
   /* @GetMapping("/insertpalabra")
    public String insertarpalabra(@RequestBody TablaPalabras t){
        return serviciopalabra.insertarpalabra(t);
    }
<<<<<<< HEAD

*/

=======
*/
<<<<<<< HEAD
=======



>>>>>>> 18613e63b8f3f3c73505e944bc7062f28061177c
>>>>>>> be1877a5319c35fe6bdd5416176a1acd737267cd
   @PostMapping("/addpalabra/{subcate}")
    public String insertarpalabra(@PathVariable("subcate") String subcate, @RequestBody TablaPalabras t){
        return serviciopalabra.addpalabra(subcate, t);
    }
    @GetMapping("/listandopalabras/{sub}")
    public List<Object[]> Palabras(@PathVariable("sub") String sub){
        return serviciopalabra.getpalabrasforsubcate(sub);
    }

}



