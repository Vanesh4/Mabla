package com.example.BDMabla.Entidad;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name="tablaComentarios")
public class TablaComentarios {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;
    @Column(nullable = false, length = 100)
    String texto;
    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "alias", referencedColumnName = "alias", nullable = false)
    @JsonIgnore
    private TablaUsuario tablaUsuario;
    @PrePersist
    public void fechaActual(){
        this.fecha= new Date();
    }
    public TablaComentarios() {
    }
    public TablaComentarios(String id,TablaUsuario tablaUsuario,  String texto, Date fecha) {
        this.id=id;
        this.tablaUsuario = tablaUsuario;
        this.texto = texto;
        this.fecha = fecha;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public TablaUsuario getTablaUsuario() {
        return tablaUsuario;
    }

    public void setTablaUsuario(TablaUsuario tablaUsuario) {
        this.tablaUsuario = tablaUsuario;
    }
}
