package com.example.BDMabla.Entidad;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table(name = "tablaSubcategorias")
public class TablaSubcategorias {

    @Id
    @Column(nullable = false, length = 70)
    private String Subcategoria;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer IdSubcategoria;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Categoria", referencedColumnName = "Categoria", nullable = false)
    @JsonIgnore
    private TablaCategorias tablaCategorias;

    @OneToMany(mappedBy = "tablaSubcategorias", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaPalabras> tablaPalabras;

    public TablaSubcategorias() {
    }
    public TablaSubcategorias(Integer idSubcategoria, String subcategoria, TablaCategorias tablaCategorias, Set<TablaPalabras> tablaPalabras) {
        IdSubcategoria = idSubcategoria;
        Subcategoria = subcategoria;
        this.tablaCategorias = tablaCategorias;
        this.tablaPalabras = tablaPalabras;
    }

    public Integer getIdSubcategoria() {
        return IdSubcategoria;
    }

    public void setIdSubcategoria(Integer idSubcategoria) {
        IdSubcategoria = idSubcategoria;
    }

    public String getSubcategoria() {
        return Subcategoria;
    }

    public void setSubcategoria(String subcategoria) {
        Subcategoria = subcategoria;
    }

    public TablaCategorias getTablaCategorias() {
        return tablaCategorias;
    }

    public void setTablaCategorias(TablaCategorias tablaCategorias) {
        this.tablaCategorias = tablaCategorias;
    }

    public Set<TablaPalabras> getTablaPalabras() {
        return tablaPalabras;
    }

    public void setTablaPalabras(Set<TablaPalabras> tablaPalabras) {
        this.tablaPalabras = tablaPalabras;
    }

    @Override
    public String toString() {
        return "TablaSubcategorias{" +
                "IdSubcategoria=" + IdSubcategoria +
                ", Subcategoria='" + Subcategoria + '\'' +
                ", tablaCategorias=" + tablaCategorias +
                ", tablaPalabras=" + tablaPalabras +
                '}';
    }
}

