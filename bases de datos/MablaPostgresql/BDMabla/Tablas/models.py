from django.contrib.auth.models import AbstractUser
from django.db import models

""" class TablaUsuario(models.Model):
    alias=models.TextField(primary_key=True, max_length=30)
    nombre=models.TextField(null= False)
    apellido=models.TextField(null= False)
    #telefono=models.PositiveBigIntegerField(verbose_name="Teléfono", null=True)
    #correo=models.TextField(max_length=30)
    #clave=models.TextField(max_length=30)
    #user= models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='User', null=True, blank=True)
"""
class User(AbstractUser):
    imgPerfil=models.ImageField(default='user.png', upload_to='img/', null=True, blank=True)
    alias=models.TextField(primary_key=True, max_length=30)
    #alias= models.OneToOneField(TablaUsuario,primary_key=True, on_delete=models.CASCADE)

class TablaComentarios(models.Model):
    alias=models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    texto=models.TextField(max_length=150)
    fecha=models.DateField(auto_now_add=True)

#karen
class TablaCategoria(models.Model):
    Categoria=models.TextField(max_length=30, primary_key=True, null=False)

class TablaSubcategoria(models.Model):
    subcategoria=models.TextField(max_length=30, primary_key=True)
    categoria=models.ForeignKey(TablaCategoria, null=False, on_delete=models.CASCADE)

class TablaPalabra(models.Model):
    Palabra=models.TextField(max_length=30, primary_key=True)
    subcategoria=models.ForeignKey(TablaSubcategoria, null=False, on_delete=models.CASCADE)
    Senia=models.TextField()

#vanessa
class TablaPreguntas(models.Model):
    #numeroPregunta = models.AutoField(primary_key=True)
    tipo = models.PositiveIntegerField(verbose_name="Tipo")
    idCategoria = models.ForeignKey(TablaCategoria, null=False, on_delete=models.CASCADE)
    senia = models.TextField()
    respuesta = models.TextField(max_length=50)

class TablaPrueba(models.Model):
    tipoPrueba= models.PositiveSmallIntegerField(null=False)
    puntaje=models.PositiveSmallIntegerField(verbose_name="Puntaje")
    fecha=models.DateField(auto_now_add=True)
    alias=models.ForeignKey(User, null=True, on_delete=models.CASCADE)
    idCategoria = models.ForeignKey(TablaCategoria, null=False, on_delete=models.CASCADE)
    
class TablaPrueba_Pregunta(models.Model):
    puntaje=models.PositiveBigIntegerField(verbose_name="Puntaje")
    idPrueba = models.ForeignKey(TablaPrueba, null=False, on_delete=models.CASCADE)
    idCategoria = models.ForeignKey(TablaCategoria, null=False, on_delete=models.CASCADE)
