package com.example.BDMabla.Controlador;

import com.example.BDMabla.Entidad.TablaComentarios;
import com.example.BDMabla.Servicios.STablaComentarios;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
@Controller
public class CTablaComentarios {
    private STablaComentarios metodosComent;
    public CTablaComentarios(STablaComentarios metodosComent) {
        this.metodosComent = metodosComent;
    }
    @GetMapping("/coments")
    public List<TablaComentarios> coments(){
        return metodosComent.coments();
    }
    @GetMapping("/comentsUser/{alias}")
    public Optional<TablaComentarios> comentsUser(@PathVariable("alias") String alias){
        return metodosComent.mycoments(alias);
    }
    @PostMapping("/addComment")
    public boolean addComent(@RequestBody TablaComentarios comment){
        return metodosComent.addcoment(comment);
    }
    @PutMapping("/editcomment")
    public boolean editcomment(@RequestBody TablaComentarios comment){
        return metodosComent.editcomment(comment);
    }
    @DeleteMapping("/deletecomment")
    public boolean deletecomment(@RequestBody TablaComentarios comment){
        return metodosComent.deletecoment(comment);
    }
}
