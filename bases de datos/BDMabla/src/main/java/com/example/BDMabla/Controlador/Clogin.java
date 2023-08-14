package com.example.BDMabla.Controlador;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
        return "inicio";
    }
}


