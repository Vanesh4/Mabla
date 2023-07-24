package com.example.BDMabla.Controlador;

import com.example.BDMabla.Entidad.TablaComentarios;
import com.example.BDMabla.Entidad.TablaUsuario;
import com.example.BDMabla.Servicios.STablaComentarios;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
public class CTablaComentarios {
    private STablaComentarios metodosComent;

    public CTablaComentarios(STablaComentarios metodosComent) {
        this.metodosComent = metodosComent;
    }

    @GetMapping("/comments")
    public List<TablaComentarios> comments(){
        return metodosComent.coments();
    }
    @GetMapping("/commentAlias")
    public List<Object[]> commentAlias(){
        return metodosComent.commentAlias();
    }
    @PostMapping("/addComment/{alias}")
    public String addComent(@PathVariable("alias") String alias, @RequestBody TablaComentarios comment){
        return metodosComent.addcoment(alias, comment);
    }
    @PutMapping("/editcomment/{id}")
    public boolean editcomment(@PathVariable("id") int id, @RequestBody TablaComentarios comment){
        return metodosComent.editComment(id, comment);
    }
    @DeleteMapping("/deletecomment/{id}")
    public boolean deletecomment(@PathVariable("id") Integer id){
        return metodosComent.deleteComment(id);
    }
}

