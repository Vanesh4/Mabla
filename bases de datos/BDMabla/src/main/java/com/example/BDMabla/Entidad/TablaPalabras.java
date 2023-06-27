package com.example.BDMabla.Entidad;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "TablaPalabras")
public class TablaPalabras {
    @Id
    @Column(nullable = false, length = 100)
    private String Palabra;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Categoria", referencedColumnName = "Categoria", nullable = false)
    @JsonIgnore
    private TablaCategorias tablaCategorias;

    @Column()
    private String Senia;

    public TablaPalabras(String palabra, TablaCategorias tablaCategorias, String senia) {
        Palabra = palabra;
        this.tablaCategorias = tablaCategorias;
        Senia = senia;
    }

    public TablaPalabras() {
    }

    public String getPalabra() {
        return Palabra;
    }

    public void setPalabra(String palabra) {
        Palabra = palabra;
    }

    public TablaCategorias getTablaCategorias() {
        return tablaCategorias;
    }

    public void setTablaCategorias(TablaCategorias tablaCategorias) {
        this.tablaCategorias = tablaCategorias;
    }

    public String getSenia() {
        return Senia;
    }

    public void setSenia(String senia) {
        Senia = senia;
    }

    @Override
    public String toString() {
        return "TablaPalabras{" +
                "Palabra='" + Palabra + '\'' +
                ", categoria=" + tablaCategorias +
                ", Senia='" + Senia + '\'' +
                '}';
    }
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

