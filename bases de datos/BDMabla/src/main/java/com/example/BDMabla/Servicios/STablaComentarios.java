package com.example.BDMabla.Servicios;
import com.example.BDMabla.Entidad.TablaComentarios;
import com.example.BDMabla.Entidad.TablaUsuario;
import com.example.BDMabla.Repositorio.RTablaComentarios;
import com.example.BDMabla.Repositorio.RTablaUsuario;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    /*public List<String> commentAlias() {
        List<String> lista = new ArrayList<>();
        for (TablaComentarios i : coments()){
            lista.add(i.getTablaUsuario().getAlias());
            lista.add(i.getTexto());
        }
        return lista;
    }*/

    public List<Object[]> commentAlias() {
        return repostorioComents.listComentario();
    }

    /*public List<TablaComentarios> comentariosUser(){
        List<>
        for (TablaComentarios i: coments()) {
            
        }
    }*/

    public String addcoment(String alias, TablaComentarios comment){
        TablaUsuario user= repoUsuario.findById(alias).get();
        if(repoUsuario.findById(alias).isPresent()){
            comment.setTablaUsuario(user);
            repostorioComents.save(comment);
            return "Comentario guardado";
        }
        else return "El alias no existe";
    }
    public boolean editComment(int id, TablaComentarios comment){
        TablaComentarios commentF= repostorioComents.findById(id).get();
        commentF.setTexto(comment.getTexto());
        commentF.setFecha(new Date());
        repostorioComents.save(commentF);
        return true;
    }

   public boolean deleteComment(Integer id){
        repostorioComents.deleteById(id);
        return true;
   }
}

