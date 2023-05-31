from django.shortcuts import render
from django.views.generic import ListView, View
from Tablas.models import*

# Create your views here.

#CRUD TABLA CATEGORIAS

class GetTablaCategoria(View):
    def get(self, request):
        register=TablaCategoria