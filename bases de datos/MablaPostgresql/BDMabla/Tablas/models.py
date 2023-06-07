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
    imgPerfil=models.TextField()

class TablaPruebas(models.Model):
    idPrueba=models.AutoField(primary_key=True)
    alias=models.ForeignKey(TablaUsuario, null=False, on_delete=models.CASCADE)
    tipoPrueba=models.PositiveSmallIntegerField(verbose_name="Tipo de prueba")
    categoria=models.TextField(max_length=30)
    fecha=models.DateTimeField(auto_now=False)
    puntaje=models.PositiveBigIntegerField(verbose_name="Puntaje")

class TablaComentarios(models.Model):
    alias=models.ForeignKey(TablaUsuario, null=True, on_delete=models.CASCADE)
    texto=models.TextField(max_length=30)

#karen

class TablaCategoria(models.Model):
    IdCategoria=models.PositiveSmallIntegerField(primary_key=True, verbose_name="IdCategoria")
    Categoria=models.TextField(max_length=30)

class TablaSubcategoria(models.Model):
    IdSubcategoria=models.PositiveSmallIntegerField(primary_key=True, verbose_name="IdSubcategoria")
    IdCategoria=models.ForeignKey(TablaCategoria, null=False, on_delete=models.CASCADE )
    Subcategoria=models.TextField(max_length=30)

class TablaPalabra(models.Model):
    Palabra=models.TextField(primary_key=True)
    IdCategoria=models.ForeignKey(TablaCategoria, null=False, on_delete=models.CASCADE)
    Senia=models.TextField()

#vanessa
class TablaPreguntas(models.Model):
    tipo = models.PositiveIntegerField(verbose_name="Tipo")
    idCategoria = models.ForeignKey(TablaCategoria, null=False, on_delete=models.CASCADE)
    senia = models.TextField()
    respuesta = models.TextField(max_length=50)
    numeroPregunta = models.AutoField(primary_key=True)

class TablaPrueba_Pregunta(models.Model):
    idPrueba = models.ForeignKey(TablaPruebas, null=False, on_delete=models.CASCADE)
    idCategoria = models.ForeignKey(TablaPreguntas, null=False, on_delete=models.CASCADE)
    puntaje=models.PositiveBigIntegerField(verbose_name="Puntaje")


