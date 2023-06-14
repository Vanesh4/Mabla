package com.example.BDMabla.Entidad;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

/*@Entity
@Table(name = "TablaPalabra")
public class TablaPalabras {
    @Id
    @Column(unique = true, length = 100)
    private String Palabra;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "IdCategoria", referencedColumnName = "IdCategoria")
    @JsonIgnore
    private TablaCategorias IdCategoria;

    @Column(name = "img", nullable = true)
    private String Senia="img por defecto";

    public TablaPalabras(String palabra, TablaCategorias idCategoria, String senia) {
        Palabra = palabra;
        IdCategoria = idCategoria;
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

    public TablaCategorias getIdCategoria() {
        return IdCategoria;
    }

    public void setIdCategoria(TablaCategorias idCategoria) {
        IdCategoria = idCategoria;
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
                ", IdCategoria=" + IdCategoria +
                ", Senia='" + Senia + '\'' +
                '}';
    }
}
*/
