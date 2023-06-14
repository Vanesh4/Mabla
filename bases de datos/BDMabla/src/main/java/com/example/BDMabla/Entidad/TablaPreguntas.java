package com.example.BDMabla.Entidad;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;


@Entity
@Table(name="TablaPreguntas")
public class TablaPreguntas {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer NumeroPregunta;

    @Column(name="Tipo")
    private int Tipo;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name="idCategoria", referencedColumnName = "idCategoria", nullable = false)
    @JsonIgnore
    public TablaCategorias idCategoria;

    @Column(name="Senia")
    private String Senia;

    @Column(name="Respuesta", nullable = false)
    private String Respuesta;

    public TablaPreguntas(Integer numeroPregunta, int tipo, TablaCategorias idCategoria, String senia, String respuesta) {
        NumeroPregunta = numeroPregunta;
        Tipo = tipo;
        this.idCategoria = idCategoria;
        Senia = senia;
        Respuesta = respuesta;
    }

    public TablaPreguntas() {
    }

    public Integer getNumeroPregunta() {
        return NumeroPregunta;
    }

    public void setNumeroPregunta(Integer numeroPregunta) {
        NumeroPregunta = numeroPregunta;
    }

    public int getTipo() {
        return Tipo;
    }

    public void setTipo(int tipo) {
        Tipo = tipo;
    }

    public TablaCategorias getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(TablaCategorias idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getSenia() {
        return Senia;
    }

    public void setSenia(String senia) {
        Senia = senia;
    }

    public String getRespuesta() {
        return Respuesta;
    }

    public void setRespuesta(String respuesta) {
        Respuesta = respuesta;
    }
}
