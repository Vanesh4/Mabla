from django.contrib import admin
from Tablas.models import *

@admin.register(TablaUsuario)
class tablaUsuarioAdmin(admin.ModelAdmin):
    list_display=('alias','nombre','apellido','telefono','correo','clave','imgPerfil')

@admin.register(TablaComentarios)
class tablaComentariosAdmin(admin.ModelAdmin):
    list_display=('alias','texto')

@admin.register(TablaPruebas)
class TablaPruebasAdmin(admin.ModelAdmin):
    list_display=('idPrueba','alias','tipoPrueba','categoria','fecha','puntaje')

