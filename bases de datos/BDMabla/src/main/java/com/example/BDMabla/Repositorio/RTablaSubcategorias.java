package com.example.BDMabla.Repositorio;

import com.example.BDMabla.Entidad.TablaSubcategorias;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RTablaSubcategorias extends JpaRepository<TablaSubcategorias, String>  {


}
