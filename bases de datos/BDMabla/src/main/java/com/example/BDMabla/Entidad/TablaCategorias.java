
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

    public TablaCategorias(String Categoria, Set<TablaPruebas> tablaPruebas, Set<TablaPreguntas> tablaPreguntas, Set<TablaPrueba_Pregunta> tablaPrueba_Pregunta, Set<TablaSubcategorias> tablaSubcategorias) {
        this.Categoria = Categoria;
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

    public Set<TablaPruebas> getTablaPruebas() {
        return tablaPruebas;
    }

    public void setTablaPruebas(Set<TablaPruebas> tablaPruebas) {
        this.tablaPruebas = tablaPruebas;
    }

    public Set<TablaPreguntas> getTablaPreguntas() {
        return tablaPreguntas;
    }

    public void setTablaPreguntas(Set<TablaPreguntas> tablaPreguntas) {
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
    }
}


