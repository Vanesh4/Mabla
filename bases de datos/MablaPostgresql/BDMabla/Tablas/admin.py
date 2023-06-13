from django.contrib import admin
from Tablas.models import *
# Register your models here.

@admin.register(TablaUsuario)
class userAdmin(admin.ModelAdmin):
    list_display=('alias','nombre','apellido','telefono','correo', "clave", 'imgPerfil')

@admin.register(TablaComentarios)
class commentAdmin(admin.ModelAdmin):
    list_display=('alias', 'texto')