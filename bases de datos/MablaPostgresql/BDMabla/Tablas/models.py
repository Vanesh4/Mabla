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


class TablaComentarios(models.Model):
    alias=models.ForeignKey(TablaUsuario, null=True, on_delete=models.CASCADE)
    texto=models.TextField(max_length=30)
    def __str__(self):
        #txt="{0}{1}{2}{3}{4}"
        #return txt.format()
        return "{0}{1}".format(self.alias, self.texto)

#karen

class TablaCategoria(models.Model):
    Categoria=models.TextField(max_length=30, primary_key=True)

class TablaPruebas(models.Model):   
    alias=models.ForeignKey(TablaUsuario, null=False, on_delete=models.CASCADE)
    tipoPrueba=models.PositiveSmallIntegerField(verbose_name="Tipo de prueba")
    categoria=models.ForeignKey(TablaCategoria, null=False, on_delete=models.CASCADE)
    fecha=models.DateTimeField(auto_now_add=True)
    puntaje=models.PositiveBigIntegerField(verbose_name="Puntaje")

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
    

class TablaPrueba_Pregunta(models.Model):
    idPrueba = models.ForeignKey(TablaPruebas, null=False, on_delete=models.CASCADE)
    idCategoria = models.ForeignKey(TablaPreguntas, null=False, on_delete=models.CASCADE)
    puntaje=models.PositiveBigIntegerField(verbose_name="Puntaje")


