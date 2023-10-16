package com.example.BDMabla.Entidad;
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