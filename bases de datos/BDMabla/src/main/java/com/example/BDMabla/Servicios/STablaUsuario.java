package com.example.BDMabla.Servicios;

import com.example.BDMabla.Entidad.TablaUsuario;
import com.example.BDMabla.Repositorio.RTablaUsuario;
import org.springframework.stereotype.Service;

import java.util.List;
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
    public Optional<TablaUsuario> myuser(String alias){
        return repositorioUser.findById(alias);
    }
    public boolean iniciarSesion(String alias, String clave){
        if (repositorioUser.findById(alias).isPresent()) return Objects.equals(repositorioUser.findById(alias).get().getContrasenia(), clave);
        else return false;
    }
    public boolean insertUser(TablaUsuario user){
        if(repositorioUser.findById(user.getAlias()).isPresent())
            return false;
        else{
            repositorioUser.save(user);
            return true;
        }
    }
    public boolean editUser(TablaUsuario user){
        repositorioUser.findById(user.getAlias()).get();
        repositorioUser.save(user);
        return true;
    }

}
