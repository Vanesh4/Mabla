package com.example.BDMabla.Entidad;
import javax.persistence.*;

@Entity
@Table(name = "TablaPalabra")
public class TablaPalabras {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String Palabra;

    @ManyToOne
    @JoinColumn(name = "IdCategoria", referencedColumnName = "IdCategoria")
    private TablaCategorias IdCategoria;

    @Column(name = "img", nullable = true)
    private String Senia="img por defecto";

}
