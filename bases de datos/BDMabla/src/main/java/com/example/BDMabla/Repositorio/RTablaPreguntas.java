package com.example.BDMabla.Repositorio;

import com.example.BDMabla.Entidad.TablaPreguntas;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RTablaPreguntas extends JpaRepository <TablaPreguntas, String> {

    TablaPreguntas findbyIdint(int id);
}
