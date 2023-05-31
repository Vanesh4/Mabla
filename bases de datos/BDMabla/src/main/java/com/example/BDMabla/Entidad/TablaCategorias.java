package com.example.BDMabla.Entidad;
import javax.persistence.*;

@Entity
@Table(name = "TablaCategoria")

public class TablaCategorias {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long IdCategoria;

    @Column(name = "Categoria", nullable = false, length = 70)
    private String Categoria;

    public TablaCategorias(long idCategoria, String categoria) {
        IdCategoria = idCategoria;
        Categoria = categoria;
    }

    public TablaCategorias() {
    }

    public long getIdCategoria() {
        return IdCategoria;
    }

    public void setIdCategoria(long idCategoria) {
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
                "IdCategoria='" + IdCategoria + '\'' +
                ", Categoria='" + Categoria + '\'' +
                '}';
    }
}
