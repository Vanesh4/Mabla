
package com.example.BDMabla.Controlador;

import com.example.BDMabla.Entidad.TablaCategorias;
import com.example.BDMabla.Servicios.STablaCategorias;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CTablaCategorias {
    private STablaCategorias servicio;

    public CTablaCategorias(STablaCategorias servicio) {
        this.servicio = servicio;
    }

    @GetMapping("/vercategorias")
    public List<TablaCategorias> vercategorias(){
        return servicio.Mostrartodo();
    }


}

