
package com.example.BDMabla.Entidad;
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> b8125aefa0e4cd39bd81054a99f0ac9d695eb797
=======
>>>>>>> 77369b45573bee6b9d914eb15340591ed00f1d7f
>>>>>>> 489ecd398db671ef0ccd380a0405fd707947c9bc
=======
>>>>>>> 01c39a3218b5d68900f8c8a4296a5ab57c923115

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "tablaPruebas")
public class TablaPruebas {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idPrueba;
    @Column(nullable = false)
    private int tipo;
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "alias", referencedColumnName = "alias", nullable = false)
    @JsonIgnore
    private TablaUsuario tablaUsuario;
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "Categoria", referencedColumnName = "Categoria", nullable = false)
    @JsonIgnore
    private TablaCategorias tablaCategorias;

    @OneToMany(mappedBy = "tablaPruebas", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaPrueba_Pregunta> tablaPrueba_Pregunta;

    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;

    @Column(length=5, nullable = false)
    private int puntaje;
    @PrePersist
    public void fechaActual(){
        this.fecha= new Date();
    }

    public TablaPruebas() {
    }

    public TablaPruebas(Integer idPrueba, int tipo, TablaUsuario tablaUsuario, TablaCategorias tablaCategorias, Set<TablaPrueba_Pregunta> tablaPrueba_Pregunta, Date fecha, int puntaje) {
        this.idPrueba = idPrueba;
        this.tipo = tipo;
        this.tablaUsuario = tablaUsuario;
        this.tablaCategorias = tablaCategorias;
        this.tablaPrueba_Pregunta = tablaPrueba_Pregunta;
        this.fecha = fecha;
        this.puntaje = puntaje;
    }

    public Integer getId() {
        return idPrueba;
    }

    public void setId(Integer idPrueba) {
        this.idPrueba = idPrueba;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public TablaUsuario getTablaUsuario() {
        return tablaUsuario;
    }

    public void setTablaUsuario(TablaUsuario tablaUsuario) {
        this.tablaUsuario = tablaUsuario;
    }

    public TablaCategorias getTablaCategorias() {
        return tablaCategorias;
    }

    public void setTablaCategorias(TablaCategorias tablaCategorias) {
        this.tablaCategorias = tablaCategorias;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }

    public Set<TablaPrueba_Pregunta> getTablaPrueba_Pregunta() {
        return tablaPrueba_Pregunta;
    }

    public void setTablaPrueba_Pregunta(Set<TablaPrueba_Pregunta> tablaPrueba_Pregunta) {
        this.tablaPrueba_Pregunta = tablaPrueba_Pregunta;
    }
}

<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> b8125aefa0e4cd39bd81054a99f0ac9d695eb797
=======
>>>>>>> 77369b45573bee6b9d914eb15340591ed00f1d7f
>>>>>>> 489ecd398db671ef0ccd380a0405fd707947c9bc
=======

>>>>>>> 01c39a3218b5d68900f8c8a4296a5ab57c923115
