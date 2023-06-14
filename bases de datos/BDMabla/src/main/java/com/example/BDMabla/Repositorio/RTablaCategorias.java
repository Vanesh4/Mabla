
package com.example.BDMabla.Repositorio;

import com.example.BDMabla.Entidad.TablaCategorias;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface RTablaCategorias extends JpaRepository<TablaCategorias, Integer> {

}





