
package com.example.BDMabla.Entidad;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "tablaPruebas")
public class TablaPruebas {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(nullable = false)
    private int tipo;
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "alias", referencedColumnName = "alias", nullable = false)
    @JsonIgnore
    private TablaUsuario tablaUsuario;
    @OneToMany(mappedBy = "tablaPruebas", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<TablaCategorias> tablaCategorias;

    @Column(name = "fecha")
    @Temporal(TemporalType.DATE)
    private Date fecha;


}
