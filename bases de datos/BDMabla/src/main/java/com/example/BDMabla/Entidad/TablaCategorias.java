
package com.example.BDMabla.Entidad;
import javax.persistence.*;
import javax.persistence.Entity;



@Entity
@Table(name="tablaCategorias")
public class TablaCategorias {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idCategoria;


    @Column(name = "Categoria", nullable = false, length = 70)
    private String Categoria;


    public TablaCategorias(Integer idCategoria, String categoria) {
        this.idCategoria = idCategoria;
        this.Categoria = categoria;
    }

    public TablaCategorias() {
    }

    public Integer getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(Integer idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String categoria) {
        this.Categoria = categoria;
    }
}


