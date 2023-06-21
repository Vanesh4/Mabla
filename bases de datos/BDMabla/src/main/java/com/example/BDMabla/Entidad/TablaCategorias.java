
package com.example.BDMabla.Entidad;
import javax.persistence.*;
import javax.persistence.Entity;
import java.util.Set;


@Entity
@Table(name="tablaCategorias")
public class TablaCategorias {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idCategoria;


    @Column(name = "Categoria", nullable = false, length = 70)
    private String Categoria;


    @OneToMany(mappedBy = "tablaCategorias", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaPreguntas> TablaPreguntas;

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

    public Set<com.example.BDMabla.Entidad.TablaPreguntas> getTablaPreguntas() {
        return TablaPreguntas;
    }

    public void setTablaPreguntas(Set<com.example.BDMabla.Entidad.TablaPreguntas> tablaPreguntas) {
        TablaPreguntas = tablaPreguntas;
    }
}


