package com.example.BDMabla.Repositorio;

import com.example.BDMabla.Entidad.TablaComentarios;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.BDMabla.Entidad.TablaUsuario;
import org.springframework.stereotype.Repository;

import java.util.Optional;
@Repository
public interface RTablaUsuario extends JpaRepository<TablaUsuario, String> {

}
