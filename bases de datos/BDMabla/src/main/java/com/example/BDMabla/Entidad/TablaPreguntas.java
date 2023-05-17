package com.example.BDMabla.Entidad;
import javax.persistence.*;


public class TablaPreguntas {
    private Integer Tipo;
    private Integer IdCategoria;
    private String Senia;
    private String Respuesta;
    private Integer NumeroPregunta;

    public TablaPreguntas() {

    }

    public TablaPreguntas(Integer tipo, Integer idCategoria, String senia, String respuesta, Integer numeroPregunta) {
        Tipo = tipo;
        IdCategoria = idCategoria;
        Senia = senia;
        Respuesta = respuesta;
        NumeroPregunta = numeroPregunta;
    }

    public Integer getTipo() {
        return Tipo;
    }

    public void setTipo(Integer tipo) {
        Tipo = tipo;
    }

    public Integer getIdCategoria() {
        return IdCategoria;
    }

    public void setIdCategoria(Integer idCategoria) {
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

    public Integer getNumeroPregunta() {
        return NumeroPregunta;
    }

    public void setNumeroPregunta(Integer numeroPregunta) {
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
