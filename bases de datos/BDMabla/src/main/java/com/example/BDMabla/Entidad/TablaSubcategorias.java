package com.example.BDMabla.Entidad;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table(name = "tablaSubcategorias")
public class TablaSubcategorias {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer IdSubcategoria;

    @OneToMany(mappedBy = "tablaSubcategorias", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaCategorias> tablaCategorias;

    @Column(nullable = false, length = 70)
    private String Subcategoria;

    public TablaSubcategorias(Integer idSubcategoria, Set<TablaCategorias> tablaCategorias, String subcategoria) {
        IdSubcategoria = idSubcategoria;
        this.tablaCategorias = tablaCategorias;
        Subcategoria = subcategoria;
    }

    public TablaSubcategorias() {

    }

    public Integer getIdSubcategoria() {
        return IdSubcategoria;
    }

    public void setIdSubcategoria(Integer idSubcategoria) {
        IdSubcategoria = idSubcategoria;
    }

    public Set<TablaCategorias> getTablaCategorias() {
        return tablaCategorias;
    }

    public void setTablaCategorias(Set<TablaCategorias> tablaCategorias) {
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


