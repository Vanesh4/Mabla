package com.example.BDMabla.Entidad;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Entity
public class TablaComentarios {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private long id;
    @ManyToOne
    @JoinColumn(name = "commentAlias")
    @JsonIgnore
    private TablaUsuario commentAlias;
    @Column(nullable = false, length = 30)
    String texto;
    @Column(nullable = false)
    private Date fecha;
    @Column(nullable = false)
    private Time hora;
    public TablaComentarios() {
    }
    public TablaComentarios(long id,TablaUsuario commentAlias,  String texto, Date fecha, Time hora) {
        this.id=id;
        this.commentAlias = commentAlias;
        this.texto = texto;
        this.fecha = fecha;
        this.hora = hora;
    }

    public TablaUsuario getcommentAlias() {
        return commentAlias;
    }

    public void setcommentAlias(TablaUsuario commentAlias) {
        this.commentAlias = commentAlias;
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

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
