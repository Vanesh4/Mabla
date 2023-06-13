from django.urls import path
from Tablas.models import *
from .views import *

urlpatterns = [

    path('categoria',listaCategoria.as_view(),name='categoria'),
    path('insertcate',InsertCate.as_view(), name='insertcate'),
    path('actualizarcate/<pk>',ActualizarCate.as_view(),name='actualizacate'),
    path('eliminarcate/<pk>', EliminarCate.as_view(), name='eliminarcate'),

    path('subcategoria',listSubcategoria.as_view(),name='lisubcategoria'),
    path('insertsub', Insertsub.as_view(), name='insertsub'),
    path('actualizarsub/<pk>',ActualizarSub.as_view(),name='actualizasub'),
    path('eliminarsub/<pk>', EliminarSub.as_view(), name='eliminarsub'),

    path('palabra',listpalabra.as_view(),name='palabra'),
    path('insertpal', InsertarPal.as_view(), name='insertpal'),
    path('actualizarpal/<pk>',ActualizarPal.as_view(),name='actualizapal'),
    path('eliminarpal/<pk>', EliminarPal.as_view(), name='eliminarpal'),


    path('tablaUsuario',getTablaUser.as_view(), name='tablaUsuario'),
    path('insertUser',insertTablaUser.as_view(), name='insertUser')

]
