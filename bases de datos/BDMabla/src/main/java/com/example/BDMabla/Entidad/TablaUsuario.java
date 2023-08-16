package com.example.BDMabla.Entidad;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="tablaUsuario")
public class TablaUsuario {
    @Id
    @Column(nullable = false, unique = true, length = 30)
    String correo;
    @Column(nullable = false, length = 30, unique = true)
    private String alias;
    @Column(name="authId", unique = true)
    private String authId;
    @Column(nullable = false, length = 30)
     String nombre;
    @Column(nullable = false, length = 30)
     String apellido;
    @Column(nullable = false, length = 30)
     String clave;
    @Column(nullable = false, length = 30)
     String imgPerfil= "img por defecto";

    @OneToMany(mappedBy = "tablaUsuario", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaComentarios> tablaComentarios;
    @OneToMany(mappedBy = "tablaUsuario", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaPruebas> tablaPruebas;

    public TablaUsuario(String alias, String authId, String nombre, String apellido, String correo, String clave, String imgPerfil) {
        this.alias = alias;
        this.authId = authId;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.clave = clave;
        this.imgPerfil = imgPerfil;
    }

    public TablaUsuario(String alias, String clave) {
        this.alias = alias;
        this.clave = clave;
    }

    public TablaUsuario(String alias, String nombre, String apellido, String correo, String imgPerfil) {
        this.alias = alias;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.imgPerfil = imgPerfil;
    }

    public TablaUsuario() {
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getAuthId() {
        return authId;
    }

    public void setAuthId(String authId) {
        this.authId = authId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClave() {return clave;}
    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getImgPerfil() {
        return imgPerfil;
    }

    public void setImgPerfil(String imgPerfil) {
        this.imgPerfil = imgPerfil;
    }

    public Set<TablaComentarios> getTablaComentarios() {
        return tablaComentarios;
    }

    public void setTablaComentarios(Set<TablaComentarios> tablaComentarios) {
        this.tablaComentarios = tablaComentarios;
    }

    public Set<TablaPruebas> getTablaPruebas() {
        return tablaPruebas;
    }

    public void setTablaPruebas(Set<TablaPruebas> tablaPruebas) {
        this.tablaPruebas = tablaPruebas;
    }
}
