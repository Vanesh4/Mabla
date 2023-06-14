
package com.example.BDMabla.Entidad;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

/*
@Entity
@Table(name = "tablaSubcategorias")
public class TablaSubcategorias {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer IdSubcategoria;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "IdCategoria", referencedColumnName = "IdCategoria", nullable = false)
    @JsonIgnore
    public TablaCategorias tablaCategorias;

    @Column(name = "Subcategoria", nullable = false, length = 70)
    private String Subcategoria;

    public TablaSubcategorias(Integer idSubcategoria, TablaCategorias tablaCategorias, String subcategoria) {
        this.IdSubcategoria = idSubcategoria;
        this.tablaCategorias = tablaCategorias;
        this.Subcategoria = subcategoria;
    }

    public TablaSubcategorias() {

    }

    public Integer getIdSubcategoria() {
        return IdSubcategoria;
    }

    public void setIdSubcategoria(Integer idSubcategoria) {
        IdSubcategoria = idSubcategoria;
    }

    public TablaCategorias getTablaCategorias() {
        return tablaCategorias;
    }

    public void setTablaCategorias(TablaCategorias tablaCategorias) {
        this.tablaCategorias = tablaCategorias;
    }

    public String getSubcategoria() {
        return Subcategoria;
    }

    public void setSubcategoria(String subcategoria) {
        Subcategoria = subcategoria;
    }

    @Override
    public String toString() {
        return "TablaSubcategorias{" +
                "IdSubcategoria=" + IdSubcategoria +
                ", tablaCategorias=" + tablaCategorias +
                ", Subcategoria='" + Subcategoria + '\'' +
                '}';
    }
}
*/

