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

<<<<<<< HEAD

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Categoria", referencedColumnName = "Categoria", nullable = false)
    @JsonIgnore
    private TablaCategorias tablaCategorias;

=======
>>>>>>> 007468cd6f490e68988f836d106c71443982a836
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Subcategoria", referencedColumnName = "Subcategoria", nullable = false)
    @JsonIgnore
    private TablaSubcategorias tablaSubcategorias;

    public TablaPalabras() {
    }

    public TablaPalabras(String palabra, String senia, TablaSubcategorias tablaSubcategorias) {
        Palabra = palabra;
        Senia = senia;
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
                ", tablaSubcategorias=" + tablaSubcategorias +
                '}';
    }

}





