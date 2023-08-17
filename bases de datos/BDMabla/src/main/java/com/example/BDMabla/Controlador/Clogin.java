package com.example.BDMabla.Controlador;
import com.example.BDMabla.Entidad.TablaUsuario;
import com.example.BDMabla.Servicios.STablaUsuario;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

/*
@Controller
public class Clogin {
    @GetMapping("/")
    public String index(Model model, @AuthenticationPrincipal OidcUser principal){
        if(principal!=null){
            System.out.println(principal.getClaims());
        }
        else {
            System.out.println("usuario no encontrado");
        }
        return "index";
    }
}
<<<<<<< HEAD

=======
*/
@Controller
public class Clogin {

    STablaUsuario servicio;

    public Clogin(STablaUsuario servicio) {
        this.servicio = servicio;
    }
    @GetMapping("/")
    public String index(Model model, @AuthenticationPrincipal OidcUser principal){
        if(principal!=null){
            TablaUsuario user = this.servicio.postUser(principal.getClaims());
            model.addAttribute("user", user);
            return "redirect : /index.html";
        }
        else  return "index";
    }
}
>>>>>>> 8d374d71c9d4c5e271d223017982580b53c3a995

