package com.example.BDMabla.Servicios;

import com.example.BDMabla.Entidad.TablaCategorias;
import com.example.BDMabla.Entidad.TablaPruebas;
import com.example.BDMabla.Entidad.TablaUsuario;
import com.example.BDMabla.Repositorio.RTablaCategorias;
import com.example.BDMabla.Repositorio.RTablaPruebas;
import com.example.BDMabla.Repositorio.RTablaUsuario;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class STablaPruebas {
    private RTablaPruebas repoPrueba;
    private RTablaCategorias repoCate;
    private RTablaUsuario repoUser;

    public STablaPruebas(RTablaPruebas repoPrueba, RTablaCategorias repoCate, RTablaUsuario repoUser) {
        this.repoPrueba = repoPrueba;
        this.repoCate = repoCate;
        this.repoUser = repoUser;
    }

    public List<TablaPruebas> pruebas(){
        return repoPrueba.findAll();
    }
    public boolean insertPrueba(String alias, String cate, TablaPruebas p){
        TablaUsuario user= repoUser.findById(alias).get();
        TablaCategorias categoria= repoCate.findById(cate).get();
        if(repoUser.findById(alias).isPresent() && repoCate.findById(cate).isPresent()){
            p.setTablaUsuario(user);
            p.setTablaCategorias(categoria);
            repoPrueba.save(p);
            return true;
        }
        else return false;
    }
    public boolean deletePrueba(Integer id){
        repoPrueba.deleteById(id);
        return true;
    }
}
