
package com.example.BDMabla.Repositorio;

import com.example.BDMabla.Entidad.TablaPalabras;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RTablaPalabras extends JpaRepository<TablaPalabras, String> {


}

