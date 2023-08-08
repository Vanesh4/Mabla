package com.example.BDMabla.Controlador;

import com.example.BDMabla.Entidad.TablaUsuario;
import com.example.BDMabla.Servicios.STablaUsuario;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
public class CTablaUsuario {
    private STablaUsuario metodosUser;

    public CTablaUsuario(STablaUsuario metodosUser) {
        this.metodosUser = metodosUser;
    }
    @GetMapping("/users")
    public List<TablaUsuario> user(){return metodosUser.users();}
    @GetMapping("/user/{alias}")
    public Optional<TablaUsuario> myuser(@PathVariable("alias") String alias){return metodosUser.myuser(alias);}
    /*@GetMapping("/IniciarSesion")
   public String login(@PathVariable("alias") String alias, @PathVariable("clave") String clave){
        if(metodosUser.iniciarSesion(alias,clave)) return "alias";
        else return "El usuario no ha sido registrado";
   }*/
    @GetMapping("/IniciarSesion")
    public String login(){
        return "registro.html";
    }
   @PostMapping("/Insertaruser")
    public String insertar(@RequestBody TablaUsuario user){
       if (metodosUser.insertUser(user)) return "/inicio";
       else return "Este usuario ya existe";
   }
    @PutMapping("/editarUser")
    public boolean editar(@RequestBody TablaUsuario user){
        return metodosUser.editUser(user);
    }

}
