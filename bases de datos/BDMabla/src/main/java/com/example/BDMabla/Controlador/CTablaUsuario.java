package com.example.BDMabla.Controlador;

import com.example.BDMabla.Entidad.TablaUsuario;
import com.example.BDMabla.Servicios.STablaUsuario;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CTablaUsuario {
    private STablaUsuario metodosUser;
    private TablaUsuario usuario;
    public CTablaUsuario(STablaUsuario metodosUser) {
        this.metodosUser = metodosUser;
    }
    public String Img(){
        System.out.println(usuario.getImgPerfil());
        return usuario.getImgPerfil();
    }
}
