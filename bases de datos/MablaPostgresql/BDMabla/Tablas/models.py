from django.db import models

# Create your models here.

#sara
class TablaUsuario(models.Model):
    alias=models.TextField(max_length=30, primary_key=True)
    nombre=models.TextField(max_length=30)
    apellido=models.TextField(max_length=30)
    telefono=models.PositiveBigIntegerField(verbose_name="Teléfono")
    correo=models.TextField(max_length=30)
    clave=models.TextField(max_length=30)
    imgPerfil="Img por defecto"

class TablaPruebas(models.Model):
    idPrueba=models.AutoField(primary_key=True)
    alias=models.ForeignKey(TablaUsuario, null=True, on_delete=models.CASCADE)
    tipoPrueba=models.PositiveBigIntegerField(verbose_name="Tipo de prueba")
    categoria=models.TextField(max_length=30)
    fecha=models.DateTimeField(auto_now=False)
    puntaje=models.PositiveBigIntegerField(verbose_name="Puntaje")

class TablaComentarios(models.Model):
    alias=models.ForeignKey(TablaUsuario, null=True, on_delete=models.CASCADE)
    texto=models.TextField(max_length=30)

#karen

#vanessa
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