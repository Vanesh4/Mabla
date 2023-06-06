package com.example.BDMabla.Servicios;

import com.example.BDMabla.Entidad.TablaComentarios;
import com.example.BDMabla.Repositorio.RTablaComentarios;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class STablaComentarios {
    private RTablaComentarios repostorioComents;
    public STablaComentarios(RTablaComentarios repostorioComents) {
        this.repostorioComents = repostorioComents;
    }
    public List<TablaComentarios> coments(){
        return repostorioComents.findAll();
    }
    public Optional<TablaComentarios> mycoments(String id){
        return repostorioComents.findById(id);
    }
    public boolean addcoment(TablaComentarios coment){
        repostorioComents.save(coment);
        return true;
    }
    /*public boolean editcomment(TablaComentarios comment){
        repostorioComents.findById(comment.getId()).get(comment.getId());
        repostorioComents.save(comment);
        return true;
    }*/
    public boolean deletecoment(TablaComentarios comment){
        repostorioComents.deleteById(comment.getId());
        return true;
    }
}
