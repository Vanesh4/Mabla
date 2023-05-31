package com.example.BDMabla.Entidad;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Entity
public class TablaComentarios {
    @Id
    @GeneratedValue
    private String id;
    @ManyToOne
    @JoinColumn(name="alias")
    private TablaUsuario alias;
    @Column(nullable = false, length = 30)
    String texto;
    @Column(nullable = false)
    private Date fecha;
    @Column(nullable = false)
    private Time hora;

    public TablaComentarios() {
    }

    public TablaComentarios(String id, TablaUsuario alias, String texto, Date fecha, Time hora) {
        this.id = id;
        this.alias = alias;
        this.texto = texto;
        this.fecha = fecha;
        this.hora = hora;
    }

    public TablaComentarios(TablaUsuario alias, String texto, Date fecha, Time hora) {
        this.alias = alias;
        this.texto = texto;
        this.fecha = fecha;
        this.hora = hora;
    }

    public TablaUsuario getAlias() {
        return alias;
    }

    public void setAlias(TablaUsuario alias) {
        this.alias = alias;
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

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
