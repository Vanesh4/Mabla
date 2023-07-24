package com.example.BDMabla.Repositorio;

import com.example.BDMabla.Entidad.TablaComentarios;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RTablaComentarios extends JpaRepository<TablaComentarios, Integer> {
    @Query(value = "select  alias,texto from tabla_comentarios",  nativeQuery = true)
    List<Object[]> listComentario();
}

