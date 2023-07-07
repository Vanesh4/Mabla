
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
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id", referencedColumnName = "id", nullable = false)
    @JsonIgnore
    private TablaPruebas tablaPruebas;
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "NumeroPregunta", referencedColumnName = "NumeroPregunta", nullable = false)
    @JsonIgnore
    private TablaPreguntas tablaPreguntas;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "IdSubcategoria", referencedColumnName = "IdSubcategoria", nullable = false)
    @JsonIgnore
    public TablaSubcategorias tablaSubcategorias;
    @OneToMany(mappedBy = "tablaCategorias", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaPalabras> tablaPalabras;
    public TablaCategorias(String Categoria, TablaPruebas tablaPruebas, TablaPreguntas tablaPreguntas, TablaSubcategorias tablaSubcategorias) {
        this.Categoria = Categoria;
        this.tablaPruebas = tablaPruebas;
        this.tablaPreguntas = tablaPreguntas;
        this.tablaSubcategorias = tablaSubcategorias;
    }
    public TablaCategorias() {
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String categoria) {
        this.Categoria = categoria;
    }

    public TablaPruebas getTablaPruebas() {
        return tablaPruebas;
    }

    public void setTablaPruebas(TablaPruebas tablaPruebas) {
        this.tablaPruebas = tablaPruebas;
    }

    public TablaPreguntas getTablaPreguntas() {
        return tablaPreguntas;
    }

    public void setTablaPreguntas(TablaPreguntas tablaPreguntas) {
        this.tablaPreguntas = tablaPreguntas;
    }

    public Set<TablaPalabras> getTablaPalabras() {
        return tablaPalabras;
    }

    public void setTablaPalabras(Set<TablaPalabras> tablaPalabras) {
        this.tablaPalabras = tablaPalabras;
    }

    public TablaSubcategorias getTablaSubcategorias() {
        return tablaSubcategorias;
    }

    public void setTablaSubcategorias(TablaSubcategorias tablaSubcategorias) {
        this.tablaSubcategorias = tablaSubcategorias;
    }
}


