from django.urls import path
from Tablas.models import *
from .views import *

urlpatterns = [
    path('tablaUsuario',getTablaUser.as_view(), name='tablaUsuario'),
    path('insertUser',insertTablaUser.as_view(), name='insertUser')
]
