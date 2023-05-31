from typing import Any
from django.http import JsonResponse
from django.shortcuts import render
<<<<<<< HEAD
from django.views.generic import ListView, View
from Tablas.models import*

# Create your views here.

#CRUD TABLA CATEGORIAS

class GetTablaCategoria(View):
    def get(self, request):
        register=TablaCategoria
=======
from django.views import View
from django.views.generic import View
from django.http import HttpRequest, JsonResponse
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
import json

from BDMabla.Tablas.models import TablaUsuario

class GetTablaUser(View):
    def get(self,request):
        register= TablaUsuario.objects.all().values()
        registerUser=list(register)
        return JsonResponse(registerUser, safe=False)

class InsertTablaUser(View):
    #notacion
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs: Any):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        registerInsertUser=json.loads(request.body)
        request.POST.get('alias')
        request.POST.get('nombre')
        request.POST.get('apellido')
        request.POST.get('telefono')
        request.POST.get('correo')
        request.POST.get('clave')
        print("datos del cliente ",request.POST)
        registerInsertUser1=TablaUsuario.objects.create(alias=registerInsertUser['alias'],nombre=registerInsertUser['nombre'],apellido=registerInsertUser['apellido'],telefono=registerInsertUser['telefono'],correo=registerInsertUser['correo'],clave=registerInsertUser['clave'])
        registerInsertUser1.save()
        return JsonResponse({'mensaje':'datos guardados'})
>>>>>>> 67acceb6d3762210977b2ddb929fab09ed39253e
