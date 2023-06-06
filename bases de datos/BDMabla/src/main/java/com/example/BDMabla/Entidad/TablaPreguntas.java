package com.example.BDMabla.Entidad;
import javax.persistence.*;

@Entity
@Table(name="TablaPreguntas")
public class TablaPreguntas {
    @Column(name="Tipo")
    private int Tipo;

    @ManyToOne
    @JoinColumn(referencedColumnName = "IdCategoria")
    private int IdCategoria;

    @Column(name="Senia")
    private String Senia;

    @Column(name="Respuesta", length = 50, nullable = false)
    private String Respuesta;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int NumeroPregunta;

    public TablaPreguntas() {
    }

    public TablaPreguntas(int tipo, int idCategoria, String senia, String respuesta, int numeroPregunta) {
        Tipo = tipo;
        IdCategoria = idCategoria;
        Senia = senia;
        Respuesta = respuesta;
        NumeroPregunta = numeroPregunta;
    }

    public int getTipo() {
        return Tipo;
    }

    public void setTipo(int tipo) {
        Tipo = tipo;
    }

    public int getIdCategoria() {
        return IdCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        IdCategoria = idCategoria;
    }

    public String getSenia() {
        return Senia;
    }

    public void setSenia(String senia) {
        Senia = senia;
    }

    public String getRespuesta() {
        return Respuesta;
    }

    public void setRespuesta(String respuesta) {
        Respuesta = respuesta;
    }

    public int getNumeroPregunta() {
        return NumeroPregunta;
    }

    public void setNumeroPregunta(int numeroPregunta) {
        NumeroPregunta = numeroPregunta;
    }

    @Override
    public String toString() {
        return "TablaPreguntas{" +
                "Tipo=" + Tipo +
                ", IdCategoria=" + IdCategoria +
                ", Senia='" + Senia + '\'' +
                ", Respuesta='" + Respuesta + '\'' +
                ", NumeroPregunta=" + NumeroPregunta +
                '}';
    }
}
