package com.example.BDMabla.Repositorio;

import com.example.BDMabla.Entidad.TablaSubcategorias;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RTablaSubcategorias extends JpaRepository<TablaSubcategorias, String>  {

    /*@Query(value = "select categoria, subcategoria from tabla_subcategorias",  nativeQuery = true)
    List<Object[]> findForCategoria();*/

    @Query(value = "select subcategoria from tabla_subcategorias where categoria = :categoria",  nativeQuery = true)
    List<Object[]> findForCategoria(String categoria);
}
