
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
    @JoinColumn(name = "pregunta", referencedColumnName = "NumeroPregunta", nullable = false)
    @JsonIgnore
    private TablaPreguntas preguntas;

    public TablaCategorias(String categoria, TablaPruebas tablaPruebas, TablaPreguntas preguntas) {
        this.Categoria = categoria;
        this.tablaPruebas = tablaPruebas;
        this.preguntas = preguntas;
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

    public TablaPreguntas getpreguntas() {
        return preguntas;
    }

    public void setpreguntas(TablaPreguntas preguntas) {
        this.preguntas = preguntas;
    }
}


