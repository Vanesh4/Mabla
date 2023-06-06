from typing import Any
from django import http
from django.shortcuts import render
from django.views.generic import ListView, View
from Tablas.models import *
from django.http import JsonResponse, HttpRequest
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
import json

class listaCategoria(View):
    def get(self, request):
        registro=TablaCategoria.objects.all().values()
        registrocate=list(registro)
        return JsonResponse(registrocate, safe=False)
    
class InsertarCate(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs: Any):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        registro=json.loads(request.body)
        request.POST.get('IdCategoria')
        request.POST.get('Categoria')
        print("Datos de Categoria", request.POST)
        cate=TablaCategoria.objects.create(IdCategoria=registro['IdCategoria'], Categoria=registro['Categoria'])
        cate.save()
        return JsonResponse({'mensaje': 'Registro guardado'})
    


class ActualizarCate(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def put(self, request, pk):
        try:
            registro=TablaCategoria.objects.get(pk=pk)
        except TablaCategoria.DoesNotExist:
            return JsonResponse({'Error':'este Id de categoria no existe'})
        data=json.loads(request.body)
        registro.IdCategoria=data.get('IdCategoria')
        registro.Categoria=data.get('Categoria')
        registro.save()
        return JsonResponse({'mensaje':'Se ha actualizado correctamente'})

class EliminarCate(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    def delete(self, request, pk):
        try:
            registro=TablaCategoria.objects.get(pk=pk)
        except TablaCategoria.DoesNotExist:
            return JsonResponse({'Error':'El Id de categoria no existe'})
        registro.delete()

        return JsonResponse({'mensaje': "Categoria eliminada"})


#METODOS DE LA TABLA CATEGORIA
class listSubcategoria(View):
    def get(self, request):
        registro=TablaSubcategoria.objects.all().values()
        registrosub=list(registro)
        return JsonResponse(registrosub, safe=False)


class InsertarSub(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs: Any):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        registro=json.loads(request.body)
        request.POST.get('IdSubcategoria')
        request.POST.get('IdCategoria')
        request.POST.get('Subcategoria')
        print("Datos de Categoria", request.POST)
        sub=TablaSubcategoria.objects.create(IdSubcategoria=registro['IdSubcategoria'], IdCategoria=registro['IdCategoria'], Subcategoria=registro['Subcategoria'])
        sub.save()
        return JsonResponse({'mensaje': 'Registro guardado'})
    
class ActualizarSub(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def put(self, request, pk):
        try:
            registro=TablaSubcategoria.objects.get(pk=pk)
        except TablaSubcategoria.DoesNotExist:
            return JsonResponse({'Error':'este Id de subcategoria no existe'})
        data=json.loads(request.body)
        registro.IdSubcategoria=data.get('IdSubcategoria')
        registro.Subcategoria=data.get('Subcategoria')
        registro.save()
        return JsonResponse({'mensaje':'Se ha actualizado correctamente'})
    
class EliminarSub(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    def delete(self, request, pk):
        try:
            registro=TablaSubcategoria.objects.get(pk=pk)
        except TablaSubcategoria.DoesNotExist:
            return JsonResponse({'Error':'El Id de subcategoria no existe'})
        registro.delete()

        return JsonResponse({'mensaje': "Subcategoria eliminada"})


#METODOS DE LA TABLA PALABRA
class listpalabra(View):
    def get(self, request):
        registro=TablaPalabra.objects.all().values()
        registropal=list(registro)
        return JsonResponse(registropal, safe=False)


class InsertarPal(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs: Any):
        return super().dispatch(request, *args, **kwargs)
    
    def post(self, request):
        registro=json.loads(request.body)
        request.POST.get('Palabra')
        request.POST.get('IdCategoria')
        request.POST.get('Senia')
        print("Datos de Categoria", request.POST)
        pal=TablaSubcategoria.objects.create(Palabra=registro['Palabra'], IdCategoria=registro['IdCategoria'], Senia=registro['Senia'])
        pal.save()
        return JsonResponse({'mensaje': 'Palbra guardada'})
    
class ActualizarPal(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    
    def put(self, request, pk):
        try:
            registro=TablaPalabra.objects.get(pk=pk)
        except TablaPalabra.DoesNotExist:
            return JsonResponse({'Error':'esta palabra no existe'})
        data=json.loads(request.body)
        registro.Palabra=data.get('Palabra')
        registro.Senia=data.get('Senia')
        registro.save()
        return JsonResponse({'mensaje':'Se ha actualizado correctamente'})
    
class EliminarPal(View):
    @method_decorator(csrf_exempt)
    def dispatch(self, request: HttpRequest, *args: Any, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    def delete(self, request, pk):
        try:
            registro=TablaPalabra.objects.get(pk=pk)
        except TablaPalabra.DoesNotExist:
            return JsonResponse({'Error':'Esta palabra no existe'})
        registro.delete()

        return JsonResponse({'mensaje': "Palabtra eliminada"})




    


    

