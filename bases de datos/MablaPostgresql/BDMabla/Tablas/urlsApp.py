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
<<<<<<< HEAD
    path('insertUser',insertTablaUser.as_view(), name='insertUser')

=======
    path('insertUser',insertTablaUser.as_view(), name='insertUser'),
    path('editUser/<pk>',editTablaUser.as_view(), name='editUser/<pk>'),
    path('tablaComment',getTablaComment.as_view(), name='tablaComment'),
    path('insertComment',insertComment.as_view(), name='insertComment'),
    path('editComment/<pk>',editComment.as_view(), name='editComment/<pk>'),
    path('deleteComment/<pk>',deleteComment.as_view(), name='deleteComment/<pk>'),
    path('tablaPrueba',getTablaPrueba.as_view(), name='tablaPrueba'),
    path('insertPrueba',InsertarPrueba.as_view(), name='insertPrueba'),
>>>>>>> 0821e1a2e676193f37eb6b61509ec680abab8246
]
