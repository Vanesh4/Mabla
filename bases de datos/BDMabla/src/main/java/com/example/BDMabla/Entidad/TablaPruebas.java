package com.example.BDMabla.Entidad;

import javax.persistence.*;

@Entity
@Table(name = "tablaPruebas")
public class TablaPruebas {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(nullable = false)
    private int tipo;
    @Column(nullable = false)


}
