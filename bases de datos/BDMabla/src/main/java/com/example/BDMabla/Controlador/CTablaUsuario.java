package com.example.BDMabla.Controlador;

import com.example.BDMabla.Entidad.TablaUsuario;
import com.example.BDMabla.Servicios.STablaUsuario;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@CrossOrigin(origins = "*")
public class CTablaUsuario {
    private STablaUsuario metodosUser;

    public CTablaUsuario(STablaUsuario metodosUser) {
        this.metodosUser = metodosUser;
    }
    @GetMapping("/users")
    public List<TablaUsuario> users(){return metodosUser.users();}
    @GetMapping("/user")
    public TablaUsuario myUser(@AuthenticationPrincipal OidcUser principal) {
        System.out.println(principal.getClaims());
        String email = (String) principal.getClaims().get("email");
        TablaUsuario user = this.metodosUser.myUser(email);
        return user;
    }

    /*@GetMapping("/IniciarSesion")
   public String login(@PathVariable("alias") String alias, @PathVariable("clave") String clave){
        if(metodosUser.iniciarSesion(alias,clave)) return "alias";
        else return "El usuario no ha sido registrado";
   }*//*
    @GetMapping("/IniciarSesion")
    public String login(){
        return "registro.html";
    }
   @PostMapping("/Insertaruser")
    public String insertar(@RequestBody TablaUsuario user){
       if (metodosUser.insertUser(user)) return "login";
       else return "Este usuario ya existe";
   }
    @PutMapping("/editarUser")
    public boolean editar(@RequestBody TablaUsuario user){
        return metodosUser.editUser(user);
    }*/

}
