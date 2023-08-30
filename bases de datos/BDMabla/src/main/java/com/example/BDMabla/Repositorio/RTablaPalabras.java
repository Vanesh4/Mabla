
package com.example.BDMabla.Repositorio;

import com.example.BDMabla.Entidad.TablaPalabras;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RTablaPalabras extends JpaRepository<TablaPalabras, String> {

   /* @Query(value = "select palabra from tabla_palabras where subcategoria=:subcategoria", nativeQuery = true)
    List<Object[]> findForSubcategoria(String subcategoria);
*/
    @Query(value= "select palabra FROM tabla_palabras  WHERE palabra LIKE CONCAT(:inicial, '%')",nativeQuery = true)
    List<Object[]> findByInicial(String inicial);

}
/*public interface RTablaPalabras extends JpaRepository<TablaPalabras, String> {

//    List<TablaPalabras> findByPalabraStartingWith(String inicial);

}*/
