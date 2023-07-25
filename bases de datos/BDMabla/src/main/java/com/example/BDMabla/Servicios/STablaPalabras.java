package com.example.BDMabla.Servicios;
import com.example.BDMabla.Entidad.TablaPalabras;
import com.example.BDMabla.Entidad.TablaSubcategorias;
import com.example.BDMabla.Repositorio.RTablaPalabras;
import com.example.BDMabla.Repositorio.RTablaSubcategorias;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class STablaPalabras {
    private RTablaPalabras repositoriopalab;
    private RTablaSubcategorias repSubcategorias;

    public STablaPalabras(RTablaPalabras repositoriopalab, RTablaSubcategorias repSubcategorias) {
        this.repositoriopalab = repositoriopalab;
        this.repSubcategorias = repSubcategorias;
    }

    public List<TablaPalabras> Mostrartodo(){
        return repositoriopalab.findAll();
    }
    public TablaPalabras buscarpalabra(String Palabra){
        if(repositoriopalab.findById(Palabra).isPresent()) {
            return repositoriopalab.findById(Palabra).get();
        } else {
            return null;
        }
    }

<<<<<<< HEAD

=======
>>>>>>> 126f5010ca88475cf74d05cce3081a280371de66
/*public String insertarpalabra(TablaPalabras t){
        for (TablaCategorias: Mostrartodo());{
            if (c.getCategoria() == repositorio.findByCategoria(t.getCategoria())){
                repositorio.save(t);
                return "Categoria registrada";

            }else {
                return "esta ya existe";
            }


        }
        return "registrada";
    }*/
<<<<<<< HEAD

=======
>>>>>>> 126f5010ca88475cf74d05cce3081a280371de66

    public String insertarpalabra(TablaPalabras t){
        if(repositoriopalab.findById(t.getPalabra()).isPresent()){
            return "La palabra ya existe";
        }else {
            repositoriopalab.save(t);
        }
        return "se ha guardado";
    }

   public String addpalabra(String subcate, TablaPalabras pal){
        TablaSubcategorias subc= repSubcategorias.findById(subcate).get();
        if(repSubcategorias.findById(subcate).isPresent()){
            pal.setTablaSubcategorias(subc);
            repositoriopalab.save(pal);
            return "Palabra guardada";
        }
        else return "ESta Subcategoria no existe";
    }

    public List<Object[]> getpalabrasforsubcate(String sub){
        return repositoriopalab.findForSubcategoria(sub);
    }
}

