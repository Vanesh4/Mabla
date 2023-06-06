package com.example.BDMabla.Entidad;
import javax.persistence.*;

@Entity
@Table(name = "TablaSubcategoria")
public class TablaSubcategorias {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer IdSubcategoria;

    @ManyToOne
    @JoinColumn(name = "IdCategoria", referencedColumnName = "IdCategoria")
    private TablaCategorias IdCategoria;

    @Column(name = "Subcategoria", nullable = false, length = 70)
    private String Subcategoria;

    public TablaSubcategorias(Integer idSubcategoria, TablaCategorias idCategoria, String subcategoria) {
        IdSubcategoria = idSubcategoria;
        IdCategoria = idCategoria;
        Subcategoria = subcategoria;
    }

    public TablaSubcategorias() {
    }

    public Integer getIdSubcategoria() {
        return IdSubcategoria;
    }

    public void setIdSubcategoria(Integer idSubcategoria) {
        IdSubcategoria = idSubcategoria;
    }

    public TablaCategorias getIdCategoria() {
        return IdCategoria;
    }

    public void setIdCategoria(TablaCategorias idCategoria) {
        IdCategoria = idCategoria;
    }

    public String getSubcategoria() {
        return Subcategoria;
    }

    public void setSubcategoria(String subcategoria) {
        Subcategoria = subcategoria;
    }

    @Override
    public String toString() {
        return "TablaSubcategorias{" +
                "IdSubcategoria=" + IdSubcategoria +
                ", IdCategoria=" + IdCategoria +
                ", Subcategoria='" + Subcategoria + '\'' +
                '}';
    }
}
