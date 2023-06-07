package com.example.BDMabla.Repositorio;

import com.example.BDMabla.Entidad.TablaComentarios;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface RTablaComentarios extends JpaRepository<TablaComentarios, String> {
    List<TablaComentarios> findById(long id);
    List<TablaComentarios> deleteById(long id);


}

