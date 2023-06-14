
package com.example.BDMabla.Entidad;
import javax.persistence.*;
import javax.persistence.Entity;


/*
@Entity
@Table(name="tablaCategorias")
public class TablaCategorias {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
<<<<<<< HEAD
    private Integer idCategoria;
=======
    private Integer IdCategoria;

    @Column(name = "Categoria", nullable = false, length = 70)
    private String Categoria;

    @OneToMany(mappedBy = "tablaCategorias", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaSubcategorias> TablaSubcategorias;

    public TablaSubcategorias tablaSubcategorias;

   */
/* @OneToMany(mappedBy = "TablaCategoria", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaPreguntas> TablaPreguntas;*//*

>>>>>>> 95f060848a07e25231932e242b809db46cf8c6e9

    @Column(name = "categoria", nullable = false, length = 50)
    private String categoria;

    public TablaCategorias(Integer idCategoria, String categoria) {
        this.idCategoria = idCategoria;
        this.categoria = categoria;
    }

    public TablaCategorias() {
    }

    public Integer getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(Integer idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
}


*/
