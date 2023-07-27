package com.example.BDMabla.Repositorio;

import com.example.BDMabla.Entidad.TablaPreguntas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface RTablaPreguntas extends JpaRepository <TablaPreguntas, Integer> {
    @Query(value = "select * from tabla_preguntas where categoria= :categoria", nativeQuery = true)
    List<Object[]> PreguntasCategoria(String categoria);

}


