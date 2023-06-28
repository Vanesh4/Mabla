package com.example.BDMabla.Entidad;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "TablaPalabras")
public class TablaPalabras {
    @Id
    @Column(nullable = false, length = 100)
    private String Palabra;

    @Column()
    private String Senia;



    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Categoria", referencedColumnName = "Categoria", nullable = false)
    @JsonIgnore
    private TablaCategorias tablaCategorias;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Subcategoria", referencedColumnName = "Subcategoria", nullable = false)
    @JsonIgnore
    private TablaSubcategorias tablaSubcategorias;

    public TablaPalabras() {
    }

    public TablaPalabras(String palabra, String senia, TablaCategorias tablaCategorias, TablaSubcategorias tablaSubcategorias) {
        Palabra = palabra;
        Senia = senia;
        this.tablaCategorias = tablaCategorias;
        this.tablaSubcategorias = tablaSubcategorias;
    }

    public String getPalabra() {
        return Palabra;
    }

    public void setPalabra(String palabra) {
        Palabra = palabra;
    }

    public String getSenia() {
        return Senia;
    }

    public void setSenia(String senia) {
        Senia = senia;
    }

    public TablaCategorias getTablaCategorias() {
        return tablaCategorias;
    }

    public void setTablaCategorias(TablaCategorias tablaCategorias) {
        this.tablaCategorias = tablaCategorias;
    }

    public TablaSubcategorias getTablaSubcategorias() {
        return tablaSubcategorias;
    }

    public void setTablaSubcategorias(TablaSubcategorias tablaSubcategorias) {
        this.tablaSubcategorias = tablaSubcategorias;
    }

    @Override
    public String toString() {
        return "TablaPalabras{" +
                "Palabra='" + Palabra + '\'' +
                ", Senia='" + Senia + '\'' +
                ", tablaCategorias=" + tablaCategorias +
                ", tablaSubcategorias=" + tablaSubcategorias +
                '}';
    }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

}*/
=======
}
>>>>>>> 1d807d288cb386acd61c3e5d1bbda8a713c4df60
=======
<<<<<<< HEAD
}*/
=======
}
>>>>>>> 77369b45573bee6b9d914eb15340591ed00f1d7f
>>>>>>> 489ecd398db671ef0ccd380a0405fd707947c9bc
=======
}

>>>>>>> 01c39a3218b5d68900f8c8a4296a5ab57c923115

