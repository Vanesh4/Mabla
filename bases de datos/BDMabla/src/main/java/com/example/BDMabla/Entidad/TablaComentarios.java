package com.example.BDMabla.Entidad;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
@Entity
@Table(name="tablaComentarios")
public class TablaComentarios {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false, length = 30)
    String texto;
    @Column(nullable = false, length = 30)
    private String fecha;
    @Column(nullable = false)
    private String hora;
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "alias", referencedColumnName = "alias", nullable = false)
    @JsonIgnore
    private TablaUsuario tablaUsuario;
    public TablaComentarios() {
    }
    public TablaComentarios(int id,TablaUsuario tablaUsuario,  String texto, String fecha, String hora) {
        this.id=id;
        this.tablaUsuario = tablaUsuario;
        this.texto = texto;
        this.fecha = fecha;
        this.hora = hora;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public TablaUsuario getTablaUsuario() {
        return tablaUsuario;
    }

    public void setTablaUsuario(TablaUsuario tablaUsuario) {
        this.tablaUsuario = tablaUsuario;
    }
}
