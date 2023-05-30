from django.db import models

# Create your models here.

class TablaPreguntas(models.Model):
    tipo = models.TextField(int, verbose_name="Tipo")
    idCategoria = models.ForeignKey(TablaCategorias, null False, on_delete=models.CASCADE)
    senia = models.TextField()
    respuesta = models.TextField()
    numeroPregunta = models.AutoField(verbose_name="numeroPregunta")


class TablaPrueba_Pregunta(models.Model):
    idPrueba = models.ForeignKey(TablaPruebas, null=False, on_delete=models.CASCADE)
    idCategoria = models.ForeignKey(TablaPreguntas, null=False, on_delete=models.CASCADE)
    puntaje = models.TextField(int, verbose_name="Puntaje")