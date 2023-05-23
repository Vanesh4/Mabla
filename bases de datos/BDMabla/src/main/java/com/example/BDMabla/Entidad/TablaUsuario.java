package com.example.BDMabla.Entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TablaUsuario {
    @Id
    @Column(unique= true, length = 50)
     String alias;
    @Column(nullable = false, length = 30)
     String nombre;
    @Column(nullable = false, length = 30)
     String apellido;
    @Column(nullable = false, length = 30)
     int telefono;
    @Column(nullable = false, length = 30)
     String correo;
    @Column(nullable = false, length = 30)
     String contraseña;
    @Column(nullable = false, length = 30)
     String imgPerfil;

    public TablaUsuario(String alias, String nombre, String apellido, int telefono, String correo, String contraseña, String imgPerfil) {
        this.alias = alias;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
        this.correo = correo;
        this.contraseña = contraseña;
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

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getImgPerfil() {
        return "img por defecto";
    }

    public void setImgPerfil(String imgPerfil) {
        this.imgPerfil = imgPerfil;
    }
}
