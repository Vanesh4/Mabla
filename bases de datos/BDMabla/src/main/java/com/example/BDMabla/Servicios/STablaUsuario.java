package com.example.BDMabla.Servicios;

import com.example.BDMabla.Entidad.TablaUsuario;
import com.example.BDMabla.Repositorio.RTablaUsuario;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

@Service
public class STablaUsuario {
    private RTablaUsuario repositorioUser;

    public STablaUsuario(RTablaUsuario repositorio) {
        this.repositorioUser = repositorio;
    }
    public List<TablaUsuario> users(){
        return repositorioUser.findAll();
    }

    public TablaUsuario myUser(String correo){
        if(repositorioUser.findById(correo).isPresent()){
            return this.repositorioUser.findById(correo).get();
        }
        else return null;
    }
    /*public boolean iniciarSesion(String alias, String clave){
        if (repositorioUser.findById(alias).isPresent()) return Objects.equals(repositorioU+ser.findById(alias).get().getContrasenia(), clave);
        else return false;
    }*/
/*
    public boolean insertUser(TablaUsuario user){
        if(repositorioUser.findById(user.getCorreo()).isPresent())
            return false;
        else{
            repositorioUser.save(user);
            return true;
        }
    }
    public boolean editUser(TablaUsuario user){
        repositorioUser.findById(user.getCorreo()).get();
        repositorioUser.save(user);
        return true;
    }
*/
    public TablaUsuario postUser(Map<String, Object> dataUser){

        TablaUsuario user = myUser((String) dataUser.get("email"));

        if(user==null){
            String alias = (String) dataUser.get("Username");
            String correo = (String) dataUser.get("email");
            String nombre = (String) dataUser.get("nombre");
            String apellido = (String) dataUser.get("apellido");
            String imgPerfil = (String) dataUser.get("picture");
            String id = (String) dataUser.get("sub");

            TablaUsuario User = new TablaUsuario(alias, id, nombre, apellido, correo, imgPerfil);

            return repositorioUser.save(User);
        }
        else return user;
    }
}
