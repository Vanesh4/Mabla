<<<<<<< HEAD
/*package com.example.BDMabla.Entidad;
=======

package com.example.BDMabla.Entidad;
>>>>>>> b8125aefa0e4cd39bd81054a99f0ac9d695eb797

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "tablaPruebas")
public class TablaPruebas {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(nullable = false)
    private int tipo;
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "alias", referencedColumnName = "alias", nullable = false)
    @JsonIgnore
    private TablaUsuario tablaUsuario;
    @OneToMany(mappedBy = "tablaCategorias", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaCategorias> tablaCategorias;

    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;

<<<<<<< HEAD
}*/
=======
    @Column(length=5, nullable = false)
    private int puntaje;
    @PrePersist
    public void fechaActual(){
        this.fecha= new Date();
    }

    public TablaPruebas() {
    }

    public TablaPruebas(Integer id, int tipo, TablaUsuario tablaUsuario, Set<TablaCategorias> tablaCategorias, Date fecha, int puntaje) {
        this.id = id;
        this.tipo = tipo;
        this.tablaUsuario = tablaUsuario;
        this.tablaCategorias = tablaCategorias;
        this.fecha = fecha;
        this.puntaje = puntaje;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Set<TablaCategorias> getTablaCategorias() {
        return tablaCategorias;
    }

    public void setTablaCategorias(Set<TablaCategorias> tablaCategorias) {
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
}

>>>>>>> b8125aefa0e4cd39bd81054a99f0ac9d695eb797
