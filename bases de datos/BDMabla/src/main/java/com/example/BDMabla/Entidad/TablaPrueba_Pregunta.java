package com.example.BDMabla.Entidad;
import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.*;

@Entity
@Table(name="tablaPrueba_Pregunta")
public class TablaPrueba_Pregunta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private int puntaje;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "idPrueba", referencedColumnName = "idPrueba", nullable = false)
    @JsonIgnore
    private TablaPruebas tablaPruebas;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Categoria", referencedColumnName = "Categoria", nullable = false)
    @JsonIgnore
    private TablaCategorias tablaCategorias;

    public TablaPrueba_Pregunta(Integer id, int puntaje, TablaPruebas tablaPruebas, TablaCategorias tablaCategorias) {
        this.id = id;
        this.puntaje = puntaje;
        this.tablaPruebas = tablaPruebas;
        this.tablaCategorias = tablaCategorias;
    }

    public TablaPrueba_Pregunta() {
    }

    public TablaPrueba_Pregunta(Integer id, int puntaje) {
        this.id = id;
        this.puntaje = puntaje;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }

    public TablaPruebas getTablaPruebas() {
        return tablaPruebas;
    }

    public void setTablaPruebas(TablaPruebas tablaPruebas) {
        this.tablaPruebas = tablaPruebas;
    }

    public TablaCategorias getTablaCategorias() {
        return tablaCategorias;
    }

    public void setTablaCategorias(TablaCategorias tablaCategorias) {
        this.tablaCategorias = tablaCategorias;
    }
}
