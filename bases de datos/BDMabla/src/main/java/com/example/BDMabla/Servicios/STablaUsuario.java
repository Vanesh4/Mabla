package com.example.BDMabla.Servicios;

import com.example.BDMabla.Entidad.TablaUsuario;
import com.example.BDMabla.Repositorio.RTablaUsuario;
import org.springframework.stereotype.Service;

import javax.persistence.Entity;
import java.util.List;

@Service
public class STablaUsuario {
    private RTablaUsuario repositorio;

    public STablaUsuario(RTablaUsuario repositorio) {
        this.repositorio = repositorio;
    }
    }
