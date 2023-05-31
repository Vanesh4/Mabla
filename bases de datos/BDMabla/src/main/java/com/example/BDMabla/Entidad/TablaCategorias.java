package com.example.BDMabla.Entidad;
import javax.persistence.*;

@Entity
@Table(name = "TablaCategoria")

public class TablaCategorias {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int IdCategoria;

    @Column(name = "Categoria", nullable = false, length = 70)
    private String Categoria;

    public TablaCategorias(int idCategoria, String categoria) {
        IdCategoria = idCategoria;
        Categoria = categoria;
    }

    public TablaCategorias() {

    }

    public int getIdCategoria() {
        return IdCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        IdCategoria = idCategoria;
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String categoria) {
        Categoria = categoria;
    }

    @Override
    public String toString() {
        return "TablaCategorias{" +
                "IdCategoria=" + IdCategoria +
                ", Categoria='" + Categoria + '\'' +
                '}';
    }
}
