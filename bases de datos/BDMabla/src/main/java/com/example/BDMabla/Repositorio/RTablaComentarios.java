package com.example.BDMabla.Repositorio;

import com.example.BDMabla.Entidad.TablaComentarios;
import com.example.BDMabla.Entidad.TablaUsuario;
import org.hibernate.sql.Delete;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RTablaComentarios extends JpaRepository<TablaComentarios, String> {

}
