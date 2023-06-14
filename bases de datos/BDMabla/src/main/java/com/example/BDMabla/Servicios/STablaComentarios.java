package com.example.BDMabla.Servicios;

import com.example.BDMabla.Entidad.TablaComentarios;
import com.example.BDMabla.Entidad.TablaUsuario;
import com.example.BDMabla.Repositorio.RTablaComentarios;
import com.example.BDMabla.Repositorio.RTablaUsuario;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class STablaComentarios {
    private RTablaComentarios repostorioComents;
    private RTablaUsuario repoUsuario;

    public STablaComentarios(RTablaComentarios repostorioComents, RTablaUsuario repoUsuario) {
        this.repostorioComents = repostorioComents;
        this.repoUsuario = repoUsuario;
    }

    public List<TablaComentarios> coments(){
        return repostorioComents.findAll();
    }
    public String addcoment(String alias, TablaComentarios comment){
        TablaUsuario user= repoUsuario.findById(alias).get();
        if(repoUsuario.findById(alias).isPresent()){
            comment.setTablaUsuario(user);
            repostorioComents.save(comment);
            return "Comentario guardado";
        }
        else return "El alias no exist";
    }

    public boolean editComment(TablaComentarios comment){
        repostorioComents.findById(comment.getId()).get();
        repostorioComents.save(comment);
        return true;
    }
   /* public boolean deletecoment(@NotNull TablaComentarios comment){
        repostorioComents.deleteById(comment.getId());
        return true;
    }*/
}

