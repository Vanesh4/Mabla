from django.db import models

# Create your models here.

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
    
    def __str__(self):
        #txt="{0}{1}{2}{3}{4}"
        #return txt.format()
        return "{0}".format(self.alias)

class TablaComentarios(models.Model):
    alias=models.ForeignKey(TablaUsuario, null=True, on_delete=models.CASCADE)
    texto=models.TextField(max_length=30)
    def __str__(self):
        #txt="{0}{1}{2}{3}{4}"
        #return txt.format()
        return "{0}{1}".format(self.alias, self.texto)

#karen

class TablaCategoria(models.Model):
    IdCategoria=models.AutoField(primary_key=True, verbose_name="IdCategoria")
    Categoria=models.TextField(max_length=30)


class TablaSubcategoria(models.Model):
    IdSubcategoria=models.AutoField(primary_key=True, verbose_name="IdSubcategoria")
    IdCategoria=models.ForeignKey(TablaCategoria, null=False, on_delete=models.CASCADE )
    Subcategoria=models.TextField(max_length=30)

class TablaPalabra(models.Model):
    Palabra=models.TextField(primary_key=True)
    IdCategoria=models.ForeignKey(TablaCategoria, null=False, on_delete=models.CASCADE)
    Senia=models.TextField()

#vanessa
class TablaPreguntas(models.Model):
    #numeroPregunta = models.AutoField(primary_key=True)
    tipo = models.PositiveIntegerField(verbose_name="Tipo")
    idCategoria = models.ForeignKey(TablaCategoria, null=False, on_delete=models.CASCADE)
    senia = models.TextField()
    respuesta = models.TextField(max_length=50)
    

""" class TablaPrueba_Pregunta(models.Model):
    idPrueba = models.ForeignKey(TablaPruebas, null=False, on_delete=models.CASCADE)
    idCategoria = models.ForeignKey(TablaPreguntas, null=False, on_delete=models.CASCADE)
    puntaje=models.PositiveBigIntegerField(verbose_name="Puntaje") """


