package com.example.BDMabla.Entidad;

import javax.persistence.*;
import java.util.List;

@Entity
public class TablaUsuario {
    @Id
    private String alias;
    @Column(nullable = false, length = 30)
     String nombre;
    @Column(nullable = false, length = 30)
     String apellido;
    @Column(nullable = false, length = 30)
     int telefono;
    @Column(nullable = false, length = 30)
     String correo;
    @Column(nullable = false, length = 30)
     String contrasenia;
    @Column(nullable = false, length = 30)
     String imgPerfil= "img por defecto";
    @OneToMany(mappedBy = "users")
    private List<TablaUsuario> users;
    public TablaUsuario(String alias, String nombre, String apellido, int telefono, String correo, String contrasenia, String imgPerfil) {
        this.alias = alias;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
        this.correo = correo;
        this.contrasenia = contrasenia;
        this.imgPerfil = imgPerfil;
    }

    public TablaUsuario(String alias, String contrasenia) {
        this.alias = alias;
        this.contrasenia = contrasenia;
    }

    public TablaUsuario(String alias) {
        this.alias = alias;
    }

    public TablaUsuario() {
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
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

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public String getImgPerfil() {
        return imgPerfil;
    }

    public void setImgPerfil(String imgPerfil) {
        this.imgPerfil = imgPerfil;
    }
}
