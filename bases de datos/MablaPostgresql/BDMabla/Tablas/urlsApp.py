from django.urls import path
from Tablas.models import *
from .views import *
from . import views

urlpatterns = [
    path('tablaUsuario',getTablaUser.as_view(), name='tablaUsuario'),
    path('insertUser',insertTablaUser.as_view(), name='insertUser'),
    path('insertUserForm/',views.formInsert, name='insertUserForm'),
    path('editUser/<pk>',editTablaUser.as_view(),name='editUser'),
    path('insertComment',insertComment.as_view(),name='insertComment'),
    path('editComment/<pk>',editComment.as_view(),name='editComment/<pk>'),
    path('deleteComment/<pk>',deleteComment.as_view(),name='deleteComment/<pk>'),
    path('tablaPrueba',getTablaPrueba.as_view(),name='tablaPrueba'),
    path('insertPrueba',insertPrueba.as_view(),name='insertPrueba'),
]
