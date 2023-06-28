package com.example.BDMabla.Entidad;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Set;


@Entity
@Table(name="tablaPreguntas")
public class TablaPreguntas {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer NumeroPregunta;
    @Column(name="Tipo")
    private int Tipo;
    @Column()
    private String Senia;

    @Column(nullable = false)
    private String Respuesta;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Categoria", referencedColumnName = "Categoria", nullable = false)
    @JsonIgnore
    private TablaCategorias tablaCategorias;

    public TablaPreguntas(Integer numeroPregunta, int tipo, String senia, String respuesta, TablaCategorias tablaCategorias) {
        NumeroPregunta = numeroPregunta;
        Tipo = tipo;
        Senia = senia;
        Respuesta = respuesta;
        this.tablaCategorias = tablaCategorias;
    }

    public TablaPreguntas(Integer numeroPregunta, int tipo, String senia, String respuesta) {
        NumeroPregunta = numeroPregunta;
        Tipo = tipo;
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

    public TablaCategorias getTablaCategorias() {
        return tablaCategorias;
    }

    public void setTablaCategorias(TablaCategorias tablaCategorias) {
        this.tablaCategorias = tablaCategorias;
    }
}
