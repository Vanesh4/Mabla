package com.example.BDMabla.Repositorio;

import com.example.BDMabla.Entidad.TablaCategorias;
import com.example.BDMabla.Entidad.TablaPruebas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RTablaPruebas extends JpaRepository<TablaPruebas, Integer>{

}
