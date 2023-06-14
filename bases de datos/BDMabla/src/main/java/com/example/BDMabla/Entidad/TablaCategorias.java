
package com.example.BDMabla.Entidad;
import javax.persistence.*;
import javax.persistence.Entity;
import java.util.Set;

/*
@Entity
@Table(name = "tablaCategorias")
public class TablaCategorias {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer IdCategoria;

    @Column(name = "Categoria", nullable = false, length = 70)
    private String Categoria;

    @OneToMany(mappedBy = "tablaCategorias", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaSubcategorias> TablaSubcategorias;

    public TablaSubcategorias tablaSubcategorias;

   */
/* @OneToMany(mappedBy = "TablaCategoria", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaPreguntas> TablaPreguntas;*//*



    public TablaCategorias(Integer idCategoria, String categoria) {
        IdCategoria = idCategoria;
        Categoria = categoria;
    }

    public TablaCategorias() {
    }

    public Integer getIdCategoria() {
        return IdCategoria;
    }

    public void setIdCategoria(Integer idCategoria) {
        IdCategoria = idCategoria;
    }

    public TablaSubcategorias getTablaSubcategorias() {
        return tablaSubcategorias;
    }

    public void setTablaSubcategorias(TablaSubcategorias tablaSubcategorias) {
        this.tablaSubcategorias = tablaSubcategorias;
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String categoria) {
        Categoria = categoria;
    }





    @Override
    public String toString() {
        return "TablaCategorias{" +
                "IdCategoria='" + IdCategoria + '\'' +
                ", Categoria='" + Categoria + '\'' +
                '}';
    }
}


*/
