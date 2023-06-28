
package com.example.BDMabla.Entidad;
import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.*;
import javax.persistence.Entity;
import java.util.Set;


@Entity
@Table(name="tablaCategorias")
public class TablaCategorias {
    @Id
    @Column(nullable = false, length = 70)
    private String Categoria;
<<<<<<< HEAD

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

    @OneToMany(mappedBy = "tablaCategorias", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaPreguntas> TablaPreguntas;

    public TablaCategorias(Integer idCategoria, String categoria) {
        this.idCategoria = idCategoria;
=======
    public TablaCategorias(String categoria, TablaPruebas tablaPruebas, TablaPreguntas preguntas) {
>>>>>>> b8125aefa0e4cd39bd81054a99f0ac9d695eb797
        this.Categoria = categoria;
=======
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "IdSubcategoria", referencedColumnName = "IdSubcategoria", nullable = false)
    @JsonIgnore
    public TablaSubcategorias tablaSubcategorias;
    @OneToMany(mappedBy = "tablaCategorias", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaPalabras> tablaPalabras;
    public TablaCategorias(String Categoria, TablaPruebas tablaPruebas, TablaPreguntas tablaPreguntas, TablaSubcategorias tablaSubcategorias) {
        this.Categoria = Categoria;
>>>>>>> 1d807d288cb386acd61c3e5d1bbda8a713c4df60
=======

=======
>>>>>>> da6353f13d491b4665da9e1ffc680f52051a96c2
    @OneToMany(mappedBy = "tablaCategorias", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaPruebas> tablaPruebas;

    @OneToMany(mappedBy = "tablaCategorias", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaPreguntas> tablaPreguntas;

    @OneToMany(mappedBy = "tablaCategorias", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaPrueba_Pregunta> tablaPrueba_Pregunta;

    @OneToMany(mappedBy = "tablaCategorias", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaSubcategorias> tablaSubcategorias;

    public TablaCategorias() {
    }

<<<<<<< HEAD
    public TablaCategorias(String categoria, Set<TablaPruebas> tablaPruebas, Set<TablaPreguntas> tablaPreguntas, Set<TablaPrueba_Pregunta> tablaPrueba_Pregunta, Set<TablaSubcategorias> tablaSubcategorias) {
        Categoria = categoria;
>>>>>>> 01c39a3218b5d68900f8c8a4296a5ab57c923115
=======
    public TablaCategorias(String Categoria, Set<TablaPruebas> tablaPruebas, Set<TablaPreguntas> tablaPreguntas, Set<TablaPrueba_Pregunta> tablaPrueba_Pregunta, Set<TablaSubcategorias> tablaSubcategorias) {
        this.Categoria = Categoria;
>>>>>>> da6353f13d491b4665da9e1ffc680f52051a96c2
        this.tablaPruebas = tablaPruebas;
        this.tablaPreguntas = tablaPreguntas;
        this.tablaPrueba_Pregunta = tablaPrueba_Pregunta;
        this.tablaSubcategorias = tablaSubcategorias;
    }


    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String Categoria) {
        this.Categoria = Categoria;
    }

<<<<<<< HEAD
<<<<<<< HEAD
    public Set<com.example.BDMabla.Entidad.TablaPreguntas> getTablaPreguntas() {
        return TablaPreguntas;
    }

    public void setTablaPreguntas(Set<com.example.BDMabla.Entidad.TablaPreguntas> tablaPreguntas) {
        TablaPreguntas = tablaPreguntas;
=======
    public TablaPruebas getTablaPruebas() {
=======
    public Set<TablaPruebas> getTablaPruebas() {
>>>>>>> 01c39a3218b5d68900f8c8a4296a5ab57c923115
        return tablaPruebas;
    }

    public void setTablaPruebas(Set<TablaPruebas> tablaPruebas) {
        this.tablaPruebas = tablaPruebas;
    }

    public Set<TablaPreguntas> getTablaPreguntas() {
        return tablaPreguntas;
    }

<<<<<<< HEAD
<<<<<<< HEAD
    public void setpreguntas(TablaPreguntas preguntas) {
        this.preguntas = preguntas;
>>>>>>> b8125aefa0e4cd39bd81054a99f0ac9d695eb797
=======
    public void setTablaPreguntas(TablaPreguntas tablaPreguntas) {
=======
    public void setTablaPreguntas(Set<TablaPreguntas> tablaPreguntas) {
>>>>>>> 01c39a3218b5d68900f8c8a4296a5ab57c923115
        this.tablaPreguntas = tablaPreguntas;
    }

    public Set<TablaPrueba_Pregunta> getTablaPrueba_Pregunta() {
        return tablaPrueba_Pregunta;
    }

    public void setTablaPrueba_Pregunta(Set<TablaPrueba_Pregunta> tablaPrueba_Pregunta) {
        this.tablaPrueba_Pregunta = tablaPrueba_Pregunta;
    }

    public Set<TablaSubcategorias> getTablaSubcategorias() {
        return tablaSubcategorias;
    }

    public void setTablaSubcategorias(Set<TablaSubcategorias> tablaSubcategorias) {
        this.tablaSubcategorias = tablaSubcategorias;
>>>>>>> 1d807d288cb386acd61c3e5d1bbda8a713c4df60
    }
}


