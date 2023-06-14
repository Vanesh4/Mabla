package com.example.BDMabla.Controlador;

import com.example.BDMabla.Entidad.TablaComentarios;
import com.example.BDMabla.Entidad.TablaUsuario;
import com.example.BDMabla.Servicios.STablaComentarios;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.swing.text.TabableView;
import java.util.List;
import java.util.Optional;
@RestController
@CrossOrigin(origins = "*")
public class CTablaComentarios {
    private STablaComentarios metodosComent;

    public CTablaComentarios(STablaComentarios metodosComent) {
        this.metodosComent = metodosComent;
    }

    @GetMapping("/commentAlias")
    public List<TablaComentarios> coments(){
        return metodosComent.coments();
    }
    @PostMapping("/addComment/{alias}")
    public String addComent(@PathVariable("alias") String alias, @RequestBody TablaComentarios comment){
        return metodosComent.addcoment(alias, comment);
    }

    @PutMapping("/editcomment")
    public boolean editcomment(@RequestBody TablaComentarios comment){
        return metodosComent.editComment(comment);
    }

    /*@DeleteMapping("/deletecomment")
    public boolean deletecomment(@RequestBody TablaComentarios comment){
        return metodosComent.deletecoment(comment);
    }*/
}

